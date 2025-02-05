-- ************************************************************************** --
--   Copyright © 2025 <hi@allali.me>                                         --
--                                                                            --
--   File    : pad_and_replace.lua                                            --
--   Project : meta-header.nvim                                               --
--   License : MIT                                                            --
--                                                                            --
--   Created: 2025/01/18 02:23:58 by aallali                                  --
--   Updated: 2025/01/18 02:27:43 by aallali                                  --
-- ************************************************************************** --
-- Replace placeholders and pad to fixed width with custom padding
local function pad_and_replace(template, placeholders, comment_open, comment_close)
    local lines = vim.split(template, "\n")
    local commented_lines = {}
    for _, line in ipairs(lines) do
        for placeholder, value in pairs(placeholders) do
            local replacement = value .. string.rep(' ', 0)
            line = line:gsub(placeholder, replacement)
        end
        table.insert(commented_lines, comment_open .. " " .. line .. " " .. (comment_close or ""))
    end
    return table.concat(commented_lines, "\n")
end

return pad_and_replace
