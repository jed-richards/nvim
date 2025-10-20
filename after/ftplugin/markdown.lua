-- [[
--
-- Use visual-mode and `gq` to format text.
--
-- ]]
vim.opt_local.wrap = true
--vim.opt.linebreak = true
vim.opt_local.textwidth = 79
--vim.cmd([[ set formatoptions+=a ]])

-- Use 2 spaces for tabs in Markdown
vim.opt_local.tabstop = 2
vim.opt_local.softtabstop = 2
vim.opt_local.shiftwidth = 2

-- Spell check
vim.opt_local.spell = true
vim.opt_local.spelllang = "en_us"

-- Folding - headers only
--
-- See `:h fold-commands` for full list of fold commands.
--
-- NOTE: I am not sure how I feel about this yet. I like the ability to manually
-- create folds, i.e. foldmethod = "manual"
vim.opt_local.foldmethod = "expr"
vim.opt_local.foldexpr = "v:lua.MarkdownFold(v:lnum)"
vim.opt_local.foldenable = true
vim.opt_local.foldlevel = 2

-- Custom fold function for markdown headers only
function MarkdownFold(lnum)
  local line = vim.fn.getline(lnum)
  local next_line = vim.fn.getline(lnum + 1)

  -- Check if current line is a header (starts with #)
  local header_level = string.match(line, "^(#+)")
  if header_level then
    return ">" .. #header_level
  end

  -- Check if next line is setext header (underlined with = or -)
  if string.match(next_line, "^=+$") then
    return ">1"
  elseif string.match(next_line, "^-+$") then
    return ">2"
  end

  return "="
end
