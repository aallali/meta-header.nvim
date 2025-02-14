-- ************************************************************ --
--    Copyright © 2025 <hi@allali.me>                           --
--                                                              --
--    File    : get_comment_style.lua                           --
--    Project : meta_header.nvim                                --
--    License : MIT                                             --
--                                                              --
--    Created : 2025/01/18 02:23:11 by aallali                  --
--    Updated : 2025/02/14 18:48:34 by aallali                  --
-- ************************************************************ --
-- Determine the comment style based on the file type
local function get_comment_style()
	local filetype = vim.bo.filetype
	local extension = vim.fn.expand("%:e")

	if extension == "sh" or extension == "bash" or extension == "py" then
		return "#", "#"
	elseif extension == "vim" or filetype == "vim" then
		return '"', '"'
	elseif extension == "lua" or filetype == "lua" then
		return "--", "--"
	elseif
		extension == "js"
		or extension == "ts"
		or extension == "c"
		or extension == "h"
		or extension == "cpp"
		or extension == "hpp"
	then
		return "/*", "*/"
	elseif extension == "html" or extension == "xml" then
		return "<!--", "-->"
	elseif extension == "go" or extension == "rs" then
		return "//", "//"
	else
		return "#", "#"
	end
end

return get_comment_style
