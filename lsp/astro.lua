local function get_node_modules_typescript_server_path(root_dir)
  local project_roots = vim.fs.find(
    "node_modules",
    { path = root_dir, upward = true, limit = math.huge }
  )
  for _, project_root in ipairs(project_roots) do
    local typescript_path = project_root .. "/typescript"
    local stat = vim.loop.fs_stat(typescript_path)
    if stat and stat.type == "directory" then
      return typescript_path .. "/lib"
    end
  end

  return ""
end

local function get_nix_typescript_server_path()
  local tsc_bin_path = vim.fn.trim(vim.fn.system("command -v tsc"))

  -- Return early if the command failed or the path is empty
  if vim.v.shell_error ~= 0 or tsc_bin_path == "" then
    return ""
  end

  -- If the tsc_path is a symlink we need to resolve it to where it actually
  -- lives in the nix store. If it is not a symlink, then this is basically
  -- the identity function.
  tsc_bin_path = vim.fn.trim(
    vim.fn.system("readlink -f " .. vim.fn.shellescape(tsc_bin_path))
  )

  -- Return early if the command failed or the path is empty
  if vim.v.shell_error ~= 0 or tsc_bin_path == "" then
    return ""
  end

  -- /nix/store/HASH-typescript-VERSION/bin/tsc
  local nix_store_path_parts = vim.fn.split(tsc_bin_path, "/")

  -- Remove the last two elements from the table
  table.remove(nix_store_path_parts) -- Removes "tsc"
  table.remove(nix_store_path_parts) -- Removes "bin"

  -- /nix/store/HASH-typescript-VERSION
  local nix_store_path = "/" .. table.concat(nix_store_path_parts, "/")

  -- /nix/store/HASH-typescript-VERSION/lib/node_modules/typescript/lib
  local tsdk_path = nix_store_path .. "/lib/node_modules/typescript/lib"

  -- Only return the path if it exists and is a directory
  if vim.fn.isdirectory(tsdk_path) == 1 then
    return tsdk_path
  end

  return ""
end

---@type vim.lsp.Config
return {
  cmd = { "astro-ls", "--stdio" },
  filetypes = { "astro" },
  root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git" },
  init_options = {
    typescript = {},
  },

  before_init = function(_, config)
    if
      vim.tbl_get(config.init_options, "typescript")
      and not config.init_options.typescript.tsdk
    then
      -- If not in a nix shell, then get server path like normal
      if not vim.env.IN_NIX_SHELL then
        config.init_options.typescript["tsdk"] =
          get_node_modules_typescript_server_path(config.root_dir)
      else
        config.init_options.typescript["tsdk"] =
          get_nix_typescript_server_path()
      end
    end
  end,
}
