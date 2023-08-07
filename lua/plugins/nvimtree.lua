return {
    {
        "nvim-tree/nvim-tree.lua",
        enabled = function ()
           return (not vim.g.vscode)
        end,
        config = function ()
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1

            require("nvim-tree").setup()
            vim.keymap.set("n", "<leader>o", "<cmd>NvimTreeToggle<CR>")
        end
    }
}
