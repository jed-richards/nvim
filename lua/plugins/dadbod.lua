vim.g.db_ui_use_nerd_fonts = 1

local candidates = {
  { name = "dev", var = "DB_DEV_URL" },
  { name = "staging", var = "DB_STAGING_URL" },
  { name = "prod", var = "DB_PROD_URL" },
}

local dbs = {}
for _, conn in ipairs(candidates) do
  local url = os.getenv(conn.var)
  if url then
    table.insert(dbs, { name = conn.name, url = url })
  end
end

if #dbs > 0 then
  vim.g.dbs = dbs
end

vim.keymap.set("n", "<leader>db", function()
  for i = 1, vim.fn.tabpagenr("$") do
    for _, buf in ipairs(vim.fn.tabpagebuflist(i)) do
      if vim.bo[buf].filetype == "dbui" then
        vim.cmd("tabnext " .. i)
        return
      end
    end
  end
  vim.cmd("tabnew | DBUI")
end, { desc = "Open DB UI in tab" })
