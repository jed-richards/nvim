return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-tree/nvim-web-devicons",
        "nvim-telescope/telescope-ui-select.nvim",
    },

    config = function ()
        local telescope = require("telescope")
        local builtin = require('telescope.builtin')

        telescope.setup({
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown({}),
                },
            },
        })

        pcall(require('telescope').load_extension, 'fzf')
        pcall(require('telescope').load_extension, 'ui-select')

        -- set keymaps
        vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc = "[F]ind [F]iles"})
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {desc = "[F]ind Live [G]rep"})
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {desc = "[F]ind [B]uffers"})
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {desc = "[F]ind [H]elp"})
        vim.keymap.set('n', '<leader>fm', builtin.man_pages, {desc = "[F]ind [M]an Pages"})
    end
}
