-- ************************************************************ --
--    Copyright © 2025 <hi@allali.me>                           --
--                                                              --
--    File    : init.lua                                        --
--    Project : meta_header.nvim                                --
--    License : MIT                                             --
--                                                              --
--    Created : 2025/01/18 02:31:36 by aallali                  --
--    Updated : 2025/02/14 18:48:42 by aallali                  --
-- ************************************************************ --

local get_file_creation_time = require("meta_header.utils.get_file_creation_time")
local ensure_env_vars = require("meta_header.utils.ensure_env_vars")
local get_comment_style = require("meta_header.utils.get_comment_style")
local extract_existing_metadata = require("meta_header.utils.extract_existing_metadata")
local generate_formatted_header = require("meta_header.utils.generate_formatted_header")
local update_plugin = require("meta_header.utils.update_plugin")
local get_template_path = require("meta_header.utils.get_template_path")

local M = {
	get_file_creation_time = get_file_creation_time,
	ensure_env_vars = ensure_env_vars,
	get_comment_style = get_comment_style,
	extract_existing_metadata = extract_existing_metadata,
	generate_formatted_header = generate_formatted_header,
	update_plugin = update_plugin,
	get_template_path = get_template_path,
}

return M
