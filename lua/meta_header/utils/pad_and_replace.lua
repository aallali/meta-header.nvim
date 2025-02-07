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
            local pattern = placeholder .. "(_*)"
            local start_pos, end_pos, underscores = line:find(pattern)
            
            if start_pos then
                -- Calculate total width using display width
                local total_width = vim.fn.strdisplaywidth(placeholder) + (#underscores or 0)
                local value_width = vim.fn.strdisplaywidth(value)
                
                -- Truncate or pad based on display width
                local formatted_value
                if value_width > total_width then
                    -- Truncate while maintaining correct display width
                    local temp = value
                    while vim.fn.strdisplaywidth(temp) > total_width do
                        temp = temp:sub(1, -2)
                    end
                    formatted_value = temp
                else
                    formatted_value = value .. string.rep(' ', total_width - value_width)
                end
                
                line = line:sub(1, start_pos - 1) .. formatted_value .. line:sub(end_pos + 1)
            else
                line = line:gsub(placeholder, value)
            end
        end
        table.insert(commented_lines, comment_open .. " " .. line .. " " .. (comment_close or ""))
    end
    return table.concat(commented_lines, "\n")
end

return pad_and_replace
