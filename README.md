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
- [lazy.nvim](./lua/config/lazy.lua) plugin manager bootstrap
- My [lsp config](./lua/config/lsp.lua)

This configuration uses [`lazy.nvim`](https://github.com/folke/lazy.nvim) to
manage plugins. The plugin specifications and configurations are located in the
[`lua/plugins/`](./lua/plugins/) directory.

The [lsp/](./lsp/) directory contains some language server configuration tweaks
that get applied to the language server.

## Requirements

- [Neovim](https://neovim.io/)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [Node.js](https://nodejs.org/en/) (for some LSPs)
- A Nerd Font (for icons)

## Installation

1.  Clone this repository to your Neovim configuration directory:
    ```bash
    git clone https://github.com/jed-richards/nvim.git ~/.config/nvim
    ```
2.  Start Neovim. `lazy.nvim` will automatically install the plugins.
    ```bash
    nvim
    ```
