-- ************************************************************************** --
--   Copyright © 2025 <hi@allali.me>                                         --
--                                                                            --
--   File    : insert_header.lua                                              --
--   Project : meta-header.nvim                                               --
--   License : MIT                                                            --
--                                                                            --
--   Created: 2025/01/18 03:08:41 by aallali                                  --
--   Updated: 2025/01/18 03:39:24 by aallali                                  --
-- ************************************************************************** --
local function insert_header(lines, header_lines)
    -- Insert or update the header
    if #lines >= 10 and lines[1]:match("%*+") then
        -- Update the first lines with the new header content
        vim.api.nvim_buf_set_lines(0, 0, #header_lines, false, header_lines)
    else
        -- Insert new header if none exists
        vim.api.nvim_buf_set_lines(0, 0, 0, false, header_lines)
    end
end

return insert_header
