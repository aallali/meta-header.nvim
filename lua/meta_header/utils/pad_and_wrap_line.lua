-- ************************************************************************** --
--   Copyright © 2025 <hi@allali.me>                                          --
--                                                                            --
--   File    : pad_and_wrap_line.lua                                          --
--   Project : meta-header.nvim                                               --
--   License : MIT                                                            --
--                                                                            --
--   Created: 2025/01/18 02:25:19 by aallali                                  --
--   Updated: 2025/01/19 14:51:20 by aallali                                  --
-- ************************************************************************** --
local function pad_and_wrap_line(line, width, prefix, suffix)
    -- Get visual width of line (handles Unicode correctly)
    local display_width = vim.fn.strdisplaywidth(line)
    
    -- Calculate padding needed
    local padding_needed = width - display_width
    
    -- Ensure non-negative padding
    if padding_needed < 0 then padding_needed = 0 end
    
    -- Add padding spaces
    local padded_line = line .. string.rep(" ", padding_needed)
    
    -- Wrap with comment style
    return prefix .. padded_line .. suffix
end

return pad_and_wrap_line
