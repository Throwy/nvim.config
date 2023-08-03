return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.2',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local builtin = require("telescope.builtin")
            local themes = require("telescope.themes")

            vim.keymap.set("n", "<leader>?", builtin.current_buffer_fuzzy_find)
            vim.keymap.set("n", "<leader>/", builtin.live_grep)
            
            vim.keymap.set("n", "<leader>ff", builtin.find_files)
            vim.keymap.set("n", "<leader>fo", builtin.oldfiles)
            vim.keymap.set("n", "<leader>fg", builtin.git_files)
            vim.keymap.set("n", "<leader>fw", builtin.grep_string)
            vim.keymap.set("n", "<leader>fc", builtin.commands)
            vim.keymap.set("n", "<leader>fd", builtin.diagnostics)
        end
    }
}

