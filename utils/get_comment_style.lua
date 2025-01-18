-- ************************************************************************** --
--   Copyright © 2025 <hi@allali.me>                                         --
--                                                                            --
--   File    : get_comment_style.lua                                          --
--   Project : meta-header.nvim                                               --
--   License : MIT                                                            --
--                                                                            --
--   Created: 2025/01/18 02:23:11 by aallali                                  --
--   Updated: 2025/01/18 02:27:25 by aallali                                  --
-- ************************************************************************** --
-- Determine the comment style based on the file type
local function get_comment_style()
    local filetype = vim.bo.filetype
    if filetype == "lua" then
        return "--", "--"
    elseif filetype == "python" or filetype == "bash" then
        return "#", "#"
    elseif filetype == "c" or filetype == "cpp" or filetype == "java" then
        return "/*", "*/"
    elseif filetype == "html" or filetype == "xml" then
        return "<!--", "-->"
    else
        return "//", "//"
    end
end

return get_comment_style
