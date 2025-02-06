-- ************************************************************************** --
--   Copyright © 2025 <hi@allali.me>                                          --
--                                                                            --
--   File    : hdr_generator.lua                                              --
--   Project : meta-header.nvim                                               --
--   License : MIT                                                            --
--                                                                            --
--   Created: 2025/01/19 14:32:53 by aallali                                  --
--   Updated: 2025/02/06 21:54:22 by aallali                                  --
-- ************************************************************************** --
local header_utils = require('meta_header.utils.init')

local function hdr_generator()
    local header_width = 76

    header_utils.ensure_env_vars()

    -- Load template from file
    local template_path = debug.getinfo(1, "S").source:sub(2):match("(.*/)").. "template.txt"
    local template_file = io.open(template_path, "r")
    if not template_file then
        vim.notify("Could not load template file", vim.log.levels.ERROR)
        return
    end
    local generic_template = template_file:read("*all")
    template_file:close()


    local comment_open, comment_close = header_utils.get_comment_style()

    local file_name = vim.fn.expand('%:t') -- Current file name
    local author = os.getenv("HDR_AUTHOR") or "Unknown Author"
    local username = os.getenv("HDR_USERNAME") or "Unknown User"
    local project_name = os.getenv("HDR_PROJECT") or "Unknown Project"
    local license = os.getenv("HDR_LICENSE") or "Unknown Project license"
    local current_time = os.date('%Y/%m/%d %H:%M:%S')
    local creation_time = header_utils.get_file_creation_time()

    -- Placeholder values
    local placeholders = {
        ["$AUTHOR"] = author,
        ["$FILENAME"] = file_name,
        ["$PROJECT"] = project_name,
        ["$LICENSE"] = license,
        ["$CREATEDAT"] = creation_time,
        ["$CREATEDBY"] = username,
        ["$UPDATEDAT"] = current_time,
        ["$UPDATEDBY"] = username
    }

    -- Fetch existing header (if any)
    local lines = vim.api.nvim_buf_get_lines(0, 0, 10, false)
    -- Get existing metadata and updated lines
    local tmpLines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    local existing_created_at, existing_created_by, lines = header_utils.extract_existing_metadata(tmpLines)

    -- Retain or fill placeholders
    placeholders["$CREATEDAT"] = existing_created_at or creation_time
    placeholders["$CREATEDBY"] = existing_created_by or username
    placeholders["$CREATEDBY"] = placeholders["$CREATEDBY"]:match("^(.-)%s%s") or placeholders["$CREATEDBY"]

    local header_lines = header_utils.generate_formatted_header(generic_template, placeholders, header_width,
        comment_open, comment_close)

    return lines, header_lines
end

return hdr_generator
