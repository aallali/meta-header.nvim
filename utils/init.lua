-- ************************************************************************** --
--   Copyright © 2025 <hi@allali.me>                                         --
--                                                                            --
--   File    : init.lua                                                       --
--   Project : meta-header.nvim                                               --
--   License : MIT                                                            --
--                                                                            --
--   Created: 2025/01/18 02:31:36 by aallali                                  --
--   Updated: 2025/01/18 03:39:20 by aallali                                  --
-- ************************************************************************** --
local get_file_creation_time = require('utils.get_file_creation_time')
local ensure_env_vars = require('utils.ensure_env_vars')
local get_comment_style = require('utils.get_comment_style')
local pad_and_replace = require('utils.pad_and_replace')
local pad_and_wrap_line = require('utils.pad_and_wrap_line')
local extract_existing_metadata = require('utils.extract_existing_metadata')
local insert_header = require('utils.insert_header')
local generate_formatted_header = require('utils.generate_formatted_header')

local M = {
    get_file_creation_time = get_file_creation_time,
    ensure_env_vars = ensure_env_vars,
    get_comment_style = get_comment_style,
    pad_and_replace = pad_and_replace,
    pad_and_wrap_line = pad_and_wrap_line,
    extract_existing_metadata = extract_existing_metadata,
    insert_header = insert_header,
    generate_formatted_header = generate_formatted_header
}

return M
