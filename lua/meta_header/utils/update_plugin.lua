-- ************************************************************ --
--    Copyright © 2025 <hi@allali.me>                           --
--                                                              --
--    File    : update_plugin.lua                               --
--    Project : meta_header.nvim                                --
--    License : MIT                                             --
--                                                              --
--    Created : 2025/01/18 12:46:23 by aallali                  --
--    Updated : 2025/02/14 18:48:50 by aallali                  --
-- ************************************************************ --
local function update_plugin()
	local plugin_dir = debug.getinfo(2, "S").source:sub(2):match("(.*meta_header)")
	local cmd = string.format("cd %s && git pull >/dev/null 2>&1", plugin_dir)
	local handle = io.popen(cmd)

	if handle then
		local result = handle:read("*a")
		handle:close()

		if not result:match("error:") then
			package.loaded["meta_header"] = nil
			package.loaded["meta_header.utils"] = nil
			require("meta_header")
		end
	end
end

return update_plugin
