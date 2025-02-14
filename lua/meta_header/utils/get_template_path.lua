-- ************************************************************ --
--    Copyright © 2025 <hi@allali.me>                           --
--                                                              --
--    File    : get_template_path.lua                           --
--    Project : meta_header.nvim                                --
--    License : MIT                                             --
--                                                              --
--    Created : 2025/02/07 13:35:05 by aallali                  --
--    Updated : 2025/02/14 18:48:39 by aallali                  --
-- ************************************************************ --
local function get_template_path()
	local config = require("meta_header").config
	if config.template_locally then
		local local_template = vim.fn.getcwd() .. "/.meta_header/template.txt"

		-- Create directory if it doesn't exist
		local dir = vim.fn.getcwd() .. "/.meta_header"
		if vim.fn.isdirectory(dir) == 0 then
			vim.fn.mkdir(dir, "p")
		end

		-- Create template file if it doesn't exist
		if vim.fn.filereadable(local_template) == 0 then
			-- Create with default content
			local default_content = [[****************************************************
   $AUTHOR________________________________________

   File    : $FILENAME____________________________
   Project : $PROJECT_____________________________
   License : $LICENSE_____________________________

   Created: $CREATEDAT_________ by $CREATEDBY___
   Updated: $UPDATEDAT_________ by $UPDATEDBY___
****************************************************]]
			local file = io.open(local_template, "w")
			if file then
				file:write(default_content)
				file:close()
				print("Created template file at: " .. local_template)
			end
		end

		return local_template
	end

	-- Plugin templates directory
	local plugin_template_dir = vim.fn.stdpath("config") .. "/lua/meta_header/lua/meta_header/templates/"
	local template_path = plugin_template_dir .. config.template

	if vim.fn.filereadable(template_path) == 1 then
		return template_path
	end

	-- Fallback to default
	return plugin_template_dir .. "template.txt"
end

return get_template_path
