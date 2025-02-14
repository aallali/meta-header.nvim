-- ************************************************************ --
--    Copyright © 2025 <hi@allali.me>                           --
--                                                              --
--    File    : extract_existing_metadata.lua                   --
--    Project : meta_header.nvim                                --
--    License : MIT                                             --
--                                                              --
--    Created : 2025/01/18 02:48:33 by aallali                  --
--    Updated : 2025/02/14 18:48:29 by aallali                  --
-- ************************************************************ --

local function extract_existing_metadata(lines)
	local existing_created_at, existing_created_by
	local modified_lines = vim.deepcopy(lines)

	for i, line in ipairs(modified_lines) do
		-- Updated pattern to match "Created", "Created:" or "Created :"
		existing_created_at = line:match("%s%s%sCreated%s*:?%s*(.-)%s*by")
		existing_created_by = line:match("by%s*(.-)%s*$")

		if existing_created_at and existing_created_by then
			-- Update the line with existing data
			modified_lines[i] = line:gsub(
				"%s%s%s(Created%s*:?%s*)(.-)(%s*by%s*)(.*)",
				"%1" .. existing_created_at .. "%3" .. existing_created_by
			)
			break
		end
	end

	return existing_created_at, existing_created_by, modified_lines
end

return extract_existing_metadata
