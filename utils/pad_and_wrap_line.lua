-- ************************************************************************** --
--   Copyright © 2025 <hi@allali.me>                                         --
--                                                                            --
--   File    : pad_and_wrap_line.lua                                          --
--   Project : meta-header.nvim                                               --
--   License : MIT                                                            --
--                                                                            --
--   Created: 2025/01/18 02:25:19 by aallali                                  --
--   Updated: 2025/01/18 02:27:51 by aallali                                  --
-- ************************************************************************** --
local function pad_and_wrap_line(line, target_width, comment_open, comment_close)
    -- Pad the line content to target width
    local padded = line .. string.rep(" ", target_width - #line)
    -- Wrap with comment markers
    return comment_open .. padded .. comment_close
end

return pad_and_wrap_line
