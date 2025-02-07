-- **************************************************** --
--    Copyright © 2025 <hi@allali.me>                   --
--                                                      --
--    File    : get_template_path.lua                   --
--    Project : meta-header.nvim                        --
--    License : MIT                                     --
--                                                      --
--    Created: 2025/02/07 13:35:05 by aallali           --
--    Updated: 2025/02/07 17:35:57 by aallali           --
-- **************************************************** --
local function get_template_path()
    local config = require("meta_header").config
    if config.template_locally then
        local local_template = vim.fn.getcwd() .. "/.meta_header/template.txt"
        if vim.fn.filereadable(local_template) == 1 then
            return local_template
        else 
            print("Template file not found: " .. local_template)
        end
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

