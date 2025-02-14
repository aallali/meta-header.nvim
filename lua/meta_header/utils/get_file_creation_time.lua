-- ************************************************************ --
--    Copyright © 2025 <hi@allali.me>                           --
--                                                              --
--    File    : get_file_creation_time.lua                      --
--    Project : meta_header.nvim                                --
--    License : MIT                                             --
--                                                              --
--    Created : 2025/01/18 02:17:35 by aallali                  --
--    Updated : 2025/02/14 18:48:36 by aallali                  --
-- ************************************************************ --
local function get_file_creation_time()
	local filepath = vim.fn.expand("%:p")
	local handle = io.popen(string.format("stat -c %%W '%s' 2>/dev/null", filepath))
	if handle then
		local birth_time = handle:read("*a")
		handle:close()
		birth_time = tonumber(birth_time)
		if birth_time and birth_time > 0 then
			return os.date("%Y/%m/%d %H:%M:%S", birth_time)
		end
	end
	return os.date("%Y/%m/%d %H:%M:%S")
end

return get_file_creation_time
