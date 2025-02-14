-- ************************************************************ --
--    Copyright © 2025 <hi@allali.me>                           --
--                                                              --
--    File    : generate_formatted_header.lua                   --
--    Project : meta_header.nvim                                --
--    License : MIT                                             --
--                                                              --
--    Created : 2025/01/18 03:15:51 by aallali                  --
--    Updated : 2025/02/14 18:48:31 by aallali                  --
-- ************************************************************ --
local pad_and_replace = require("meta_header.utils.pad_and_replace")
local pad_and_wrap_line = require("meta_header.utils.pad_and_wrap_line")

local function generate_formatted_header(template, placeholders, header_width, comment_open, comment_close)
	-- Generate base header
	local header = pad_and_replace(template, placeholders, "", "")
	local header_lines = vim.split(header, "\n")

	-- Format with comments and padding
	for i, line in ipairs(header_lines) do
		header_lines[i] = pad_and_wrap_line(line, header_width, comment_open, comment_close)
	end

	return header_lines
end

return generate_formatted_header
