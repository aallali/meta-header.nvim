-- ************************************************************************** --
--   Copyright © 2025 <hi@allali.me>                                         --
--                                                                            --
--   File    : init.lua                                                       --
--   Project : meta-header.nvim                                               --
--   License : MIT                                                            --
--                                                                            --
--   Created: 2025/01/17 17:06:14 by aallali                                  --
--   Updated: 2025/01/18 12:55:07 by aallali                                  --
-- ************************************************************************** --
local header_utils = require('meta_header.utils.init')

local function update_header()
    local header_width = 76

    header_utils.ensure_env_vars()

    -- Template with placeholders
    local generic_template = [[
**************************************************************************
  $AUTHOR
                                                                          
  File    : $FILENAME
  Project : $PROJECT
  Licence : $LICENCE
                                                                          
  Created: $CREATEDAT by $CREATEDBY
  Updated: $UPDATEDAT by $UPDATEDBY
**************************************************************************]]

    local comment_open, comment_close = header_utils.get_comment_style()

    local file_name = vim.fn.expand('%:t') -- Current file name
    local author = os.getenv("HDR_AUTHOR") or "Unknown Author"
    local username = os.getenv("HDR_USERNAME") or "Unknown User"
    local project_name = os.getenv("HDR_PROJECT") or "Unknown Project"
    local licence = os.getenv("HDR_LICENCE") or "Unknown Project licence"
    local current_time = os.date('%Y/%m/%d %H:%M:%S')
    local creation_time = header_utils.get_file_creation_time()

    -- Placeholder values
    local placeholders = {
        ["$AUTHOR"] = author,
        ["$FILENAME"] = file_name,
        ["$PROJECT"] = project_name,
        ["$LICENCE"] = licence,
        ["$CREATEDAT"] = creation_time,
        ["$CREATEDBY"] = username,
        ["$UPDATEDAT"] = current_time,
        ["$UPDATEDBY"] = username
    }

    -- Fetch existing header (if any)
    local lines = vim.api.nvim_buf_get_lines(0, 0, 10, false)
    -- Get existing metadata and updated lines
    local existing_created_at, existing_created_by, lines = header_utils.extract_existing_metadata(vim.api.nvim_buf_get_lines(0, 0, -1, false))

    -- Retain or fill placeholders
    placeholders["$CREATEDAT"] = existing_created_at or creation_time
    placeholders["$CREATEDBY"] = existing_created_by or username
    placeholders["$CREATEDBY"] = placeholders["$CREATEDBY"]:match("^(.-)%s%s") or placeholders["$CREATEDBY"]

    local header_lines = header_utils.generate_formatted_header(generic_template, placeholders, header_width,
        comment_open, comment_close)

    -- Insert or update the header
    header_utils.insert_header(lines, header_lines)
    
    header_utils.update_plugin()
end

-- Export the function for external usage
return {
    update_header = update_header
}
