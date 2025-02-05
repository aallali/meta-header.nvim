-- ************************************************************************** --
--   Copyright © 2025 <hi@allali.me>                                          --
--                                                                            --
--   File    : ensure_env_vars.lua                                            --
--   Project : meta-header.nvim                                               --
--   License : MIT                                                            --
--                                                                            --
--   Created: 2025/01/18 02:19:33 by aallali                                  --
--   Updated: 2025/01/28 14:33:15 by aallali                                  --
-- ************************************************************************** --
-- Function to check and set HDR environment variables
local function ensure_env_vars()
    -- Get the directory of the current file
    local current_file_path = vim.fn.expand('%:p:h')
    local hdr_meta_path = current_file_path .. "/hdr_meta.sh"

    if not os.getenv("HDR_AUTHOR") or not os.getenv("HDR_USERNAME") or not os.getenv("HDR_PROJECT") or
        not os.getenv("HDR_LICENSE") then
        if vim.fn.filereadable(hdr_meta_path) == 0 then
            -- Create the template file in the current directory
            local file = io.open(hdr_meta_path, "w")
            file:write([[
#!/bin/bash

# Plugin: https://github.com/aallali/meta-header.nvim/
# Fill in the following environment variables
export HDR_AUTHOR="<Copyright © Your Name Here>"
export HDR_USERNAME="<Your Username Here>"
export HDR_PROJECT="<Your Project Name Here>"
export HDR_LICENSE="<Your License Here>"

# source this file after modify (source hdr_meta.sh)
echo "AUTHOR: $HDR_AUTHOR"
echo "USERNAME: $HDR_USERNAME"
echo "PROJECT: $HDR_PROJECT"
echo "LICENSE: $HDR_LICENSE"
]])
            file:close()

            -- Notify the user
            vim.notify("HDR environment variables are not set. Template created at " .. hdr_meta_path ..
                           ". Please edit and source it.", vim.log.levels.INFO)
        else
            -- Notify the user if the template already exists
            vim.notify("HDR environment variables are not set. Please source " .. hdr_meta_path .. ".",
                vim.log.levels.WARN)
        end
    end
end

return ensure_env_vars
