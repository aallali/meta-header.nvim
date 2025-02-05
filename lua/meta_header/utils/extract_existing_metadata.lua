local function extract_existing_metadata(lines)
    local existing_created_at, existing_created_by
    local modified_lines = vim.deepcopy(lines)

    for i, line in ipairs(modified_lines) do
        existing_created_at = line:match("%s%s%sCreated:%s*(.-)%s*by")
        existing_created_by = line:match("by%s*(.-)%s*$")

        if existing_created_at and existing_created_by then
            -- Update the line with existing data
            modified_lines[i] = line:gsub("%s%s%s(Created:%s*)(.-)(%s*by%s*)(.*)",
                "%1" .. existing_created_at .. "%3" .. existing_created_by)
            break
        end
    end

    return existing_created_at, existing_created_by, modified_lines
end

return extract_existing_metadata
