-- ************************************************************************** --
--   Copyright © 2025 <hi@allali.me>                                          --
--                                                                            --
--   File    : init.lua                                                       --
--   Project : meta-header.nvim                                               --
--   License : MIT                                                            --
--                                                                            --
--   Created: 2025/01/17 17:06:14 by aallali                                  --
--   Updated: 2025/01/19 14:51:41 by aallali                                  --
-- ************************************************************************** --
local header_utils = require('meta_header.utils.init')
local hdr_generator = require('meta_header.hdr_generator')

local function has_header()
    local lines = vim.api.nvim_buf_get_lines(0, 0, 10, false)

    return #lines >= 10 and #lines >= 10 and (lines[1]:match("%*+") or lines[1]:match("%-+") or lines[1]:match("%=+"))
end

local function update_meta_header(lines, header_lines)
    lines, header_lines = hdr_generator()
    if has_header() then
        -- Update the first lines with the new header content
        vim.api.nvim_buf_set_lines(0, 0, #header_lines, false, header_lines)
    end
end

local function insert_meta_header()
    if not has_header() then
        lines, header_lines = hdr_generator()
        vim.api.nvim_buf_set_lines(0, 0, 0, false, header_lines)
    else
        update_meta_header()
    end

end

-- wrap mapping inside functions to avoid conflicts
local function load_mappings()
    -- Hook F2 to insert/update the header
    vim.api.nvim_set_keymap("n", "<F2>", ":lua require('meta_header').insert_meta_header()<CR>", {
        noremap = true,
        silent = true
    })

    -- Hook BufWritePre to update the header before saving
    vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*",
        callback = function()
            local lines = vim.api.nvim_buf_get_lines(0, 0, 10, false)
            if has_header(lines) then
                update_meta_header()
            end
        end
    })
end

return {
    insert_meta_header = insert_meta_header,
    update_meta_header = update_meta_header,
    load_mappings = load_mappings,
    update_plugin = header_utils.update_plugin
}
