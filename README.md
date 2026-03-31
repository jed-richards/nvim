# My Neovim Configuration

This is my personal Neovim configuration designed to my liking. It will
continue to change and be refined as my workflow changes and gets refined.

I am a big believer in tooling to make development and life easier.

## Config structure

My personal config is located in in [`lua/config/`](./lua/config/). This
directory contains:

- Neovim [options](./lua/config/options.lua)
- Neovim native [keymaps](./lua/config/keymaps.lua)
- Some quality of life [autocommands](./lua/config/autocommands.lua)
- [vim.pack](./lua/config/pack.lua) plugin manager (builtin, requires Neovim 0.12+)
- My [lsp config](./lua/config/lsp.lua)

This configuration uses [`vim.pack`](https://neovim.io/) (Neovim's builtin
plugin manager, introduced in 0.12) to manage plugins. Each plugin's setup is
located in the [`lua/plugins/`](./lua/plugins/) directory.

The [lsp/](./lsp/) directory contains some language server configuration tweaks
that get applied to the language server.

## Requirements

- [Neovim](https://neovim.io/) **0.12 or later**
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [Node.js](https://nodejs.org/en/) (for some LSPs)
- A Nerd Font (for icons)

### Optional build step

`telescope-fzf-native` requires a C compiler and `make`. After the initial
plugin install, run:

```bash
make -C ~/.local/share/nvim/site/pack/core/opt/telescope-fzf-native.nvim
```

## Installation

1.  Clone this repository to your Neovim configuration directory:
    ```bash
    git clone https://github.com/jed-richards/nvim.git ~/.config/nvim
    ```
2.  Start Neovim. `vim.pack` will automatically install the plugins.
    ```bash
    nvim
    ```
3.  Restart Neovim to load the newly installed plugins.
