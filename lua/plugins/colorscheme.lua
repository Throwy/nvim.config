return {
    {
        "Mofiqul/vscode.nvim",
        name = "vscode",
        priority = 1000,
        config = true
    },
    {
        "ellisonleao/gruvbox.nvim",
        name = "gruvbox",
        lazy = false,
        priority = 1000,
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme tokyonight-night]])
        end,
    },
    {
        "catppuccin/nvim",
        lazy = false,
        priority = 1000,
        -- config = function()
        --     vim.cmd([[colorscheme catppuccin]])
        -- end,
    },
}
