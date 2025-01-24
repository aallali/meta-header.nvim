-- ************************************************************************** --
--   Copyright © 2025 <hi@allali.me>                                          --
--                                                                            --
--   File    : get_comment_style.lua                                          --
--   Project : meta-header.nvim                                               --
--   License : MIT                                                            --
--                                                                            --
--   Created: 2025/01/18 02:23:11 by aallali                                  --
--   Updated: 2025/01/24 21:50:00 by aallali                                  --
-- ************************************************************************** --
-- Determine the comment style based on the file type
local function get_comment_style()
    local filetype = vim.bo.filetype
    local extension = vim.fn.expand('%:e')

    if extension == "sh" or extension == "bash" or extension == "py" then
        return "#", "#"
    elseif extension == "vim" or filetype == "vim" then
        return "\"", "\""
    elseif extension == "lua" or filetype == "lua" then
        return "--", "--"
    elseif extension == "c" or extension == "h" or extension == "cpp" or extension == "hpp" then
        return "/*", "*/"
    elseif extension == "html" or extension == "xml" then
        return "<!--", "-->"
    elseif extension == "go" then
        return "//", "//"
    else
        return "*", "*"
    end
end

return get_comment_style
