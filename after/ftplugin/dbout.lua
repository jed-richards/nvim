vim.keymap.set("n", "<leader>yc", function()
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local csv_lines = {}
  for _, line in ipairs(lines) do
    -- Skip the border lines AND the MySQL warning line
    if not line:match("^+") and not line:match("^mysql: %[Warning%]") then
      local cleaned =
        line:gsub("^%s*|", ""):gsub("|%s*$", ""):gsub("%s*|%s*", ",")
      if cleaned ~= "" then
        table.insert(csv_lines, cleaned)
      end
    end
  end
  vim.fn.setreg("+", table.concat(csv_lines, "\n"))
  print("CSV copied to clipboard!")
end, { buf = true, desc = "Yank to CSV" })

vim.keymap.set("n", "<leader>yj", function()
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local data = {}
  local headers = {}

  for _, line in ipairs(lines) do
    -- Skip borders and MySQL warnings
    if
      not line:match("^+")
      and not line:match("^mysql: %[Warning%]")
      and line:match("|")
    then
      local columns = {}
      for col in line:gmatch("([^|]+)") do
        table.insert(columns, vim.trim(col))
      end

      if #headers == 0 then
        headers = columns
      else
        local row = {}
        for i, val in ipairs(columns) do
          if headers[i] then
            row[headers[i]] = val
          end
        end
        table.insert(data, row)
      end
    end
  end

  if #data > 0 then
    local json_string = vim.json.encode(data)

    -- Use the second argument of system() to pass stdin safely
    if vim.fn.executable("jq") == 1 then
      json_string = vim.fn.system("jq .", json_string)
    end

    vim.fn.setreg("+", json_string)
    print("JSON (shell-safe) copied to clipboard!")
  else
    print("No data found to convert.")
  end
end, { buf = true, desc = "Yank to JSON" })
