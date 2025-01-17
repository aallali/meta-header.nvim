    -- Function to check and set HDR environment variables
    local function ensure_env_vars()
        -- Get the directory of the current file
        local current_file_path = vim.fn.expand('%:p:h')
        local hdr_meta_path = current_file_path .. "/hdr_meta.sh"
    
        if not os.getenv("HDR_AUTHOR") or not os.getenv("HDR_USERNAME") or not os.getenv("HDR_PROJECT") or not os.getenv("HDR_LICENCE") then
            if vim.fn.filereadable(hdr_meta_path) == 0 then
                -- Create the template file in the current directory
                local file = io.open(hdr_meta_path, "w")
                file:write([[
    #!/bin/bash
    
    # Fill in the following environment variables
    export HDR_AUTHOR="<Copyright Your Name Here>"
    export HDR_USERNAME="<Your Username Here>"
    export HDR_PROJECT="<Your Project Name Here>"
    export HDR_LICENCE="<Your License Here>"

    echo "AUTHOR: $HDR_AUTHOR"
    echo "USERNAME: $HDR_USERNAME"
    echo "PROJECT: $HDR_PROJECT"
    echo "LICENCE: $HDR_LICENCE"

    # Uncomment the next line after editing:
    # source ./hdr_meta.sh
    ]])
                file:close()
    
                -- Notify the user
                vim.notify("HDR environment variables are not set. Template created at " .. hdr_meta_path .. ". Please edit and source it.", vim.log.levels.INFO)
            else
                -- Notify the user if the template already exists
                vim.notify("HDR environment variables are not set. Please source " .. hdr_meta_path .. ".", vim.log.levels.WARN)
            end
        end
    end

local function update_header()
    local header_width = 76

    ensure_env_vars()

    -- Template with placeholders
    local generic_template = [[
**************************************************************************
  $AUTHOR 
                                                                          
  File    : $FILENAME
  Project : $PROJECT
  licence : $LICENCE
                                                                          
  Created: $CREATEDAT by $CREATEDBY
  Updated: $UPDATEDAT by $UPDATEDBY
**************************************************************************]]
 

    -- Determine the comment style based on the file type
    local function get_comment_style()
        local filetype = vim.bo.filetype
        if filetype == "lua" or filetype == "python" or filetype == "bash" then
            return "#", "#"
        elseif filetype == "c" or filetype == "cpp" or filetype == "java" then
            return "/*", "*/"
        elseif filetype == "html" or filetype == "xml" then
            return "<!--", "-->"
        else
            return "//", "//"
        end
    end

    -- Replace placeholders and pad to fixed width with custom padding
    local function pad_and_replace(template, placeholders, comment_open, comment_close)
        local lines = vim.split(template, "\n")
        local commented_lines = {}
        for _, line in ipairs(lines) do
            for placeholder, value in pairs(placeholders) do
                local replacement = value .. string.rep(' ', 0)
                line = line:gsub(placeholder, replacement)
            end
            table.insert(commented_lines, comment_open .. " " .. line .. " " .. (comment_close or ""))
        end
        return table.concat(commented_lines, "\n")
    end

    local function pad_and_wrap_line(line, target_width, comment_open, comment_close)
        -- Pad the line content to target width
        local padded = line .. string.rep(" ", target_width - #line)
        -- Wrap with comment markers
        return comment_open .. padded .. comment_close
    end

    local comment_open, comment_close = get_comment_style()

    local file_name = vim.fn.expand('%:t') -- Current file name
    local author = os.getenv("HDR_AUTHOR") or "Unknown Author"
    local username = os.getenv("HDR_USERNAME") or "Unknown User"
    local project_name = os.getenv("HDR_PROJECT") or "Unknown Project"
    local licence = os.getenv("HDR_LICENCE") or "Unknown Project licence"
    local current_time = os.date('%Y/%m/%d %H:%M:%S')

    -- Placeholder values
    local placeholders = {
        ["$AUTHOR"] = author,
        ["$FILENAME"] = file_name,
        ["$PROJECT"] = project_name,
        ["$LICENCE"] = licence,
        ["$CREATEDAT"] = current_time,
        ["$CREATEDBY"] = username,
        ["$UPDATEDAT"] = current_time,
        ["$UPDATEDBY"] = username,
    }

    -- Fetch existing header (if any)
    local lines = vim.api.nvim_buf_get_lines(0, 0, 10, false)
    local existing_created_at = nil
    local existing_created_by = nil

    -- Detect existing lines
    for i, line in ipairs(lines) do
        if line:find("Created:") then
            existing_created_at = line:match("Created:%s*(.-)%s*by")
            existing_created_by = line:match("by%s*(.-)%s*$")
            -- Update the existing line without adding extra comment markers
            lines[i] = line:gsub(
                "(Created:%s*)(.-)(%s*by%s*)(.*)",
                "%1" .. (existing_created_at or current_time) .. "%3" .. (existing_created_by or username)
            )
        end
    end
   
    -- Retain or fill placeholders
    placeholders["$CREATEDAT"] = existing_created_at or current_time
    placeholders["$CREATEDBY"] = existing_created_by or username
    placeholders["$CREATEDBY"] = placeholders["$CREATEDBY"]:match("^(.-)%s%s") or placeholders["$CREATEDBY"]

    -- Generate header without padding/comments first
    local header = pad_and_replace(generic_template, placeholders, "", "")
    local header_lines = vim.split(header, "\n")

    -- Pad and wrap each line
    for i, line in ipairs(header_lines) do
        header_lines[i] = pad_and_wrap_line(line, header_width, comment_open, comment_close)
    end

    -- Insert or update the header
    if #lines >= 10 and lines[1]:match("%*+") then
        -- Update the first lines with the new header content
        vim.api.nvim_buf_set_lines(0, 0, #header_lines, false, header_lines)
    else
        -- Insert new header if none exists
        vim.api.nvim_buf_set_lines(0, 0, 0, false, header_lines)
    end
end

-- Export the function for external usage
return {
    update_header = update_header,
}
