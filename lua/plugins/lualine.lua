return {
    {
        "nvim-lualine/lualine.nvim",
        enabled = function()
            return (not vim.g.vscode)
        end,
        opts = {
            options = {
                icons_enabled = false,
                theme = "material",
            },
        },
        config = function(_, opts)
            require("lualine").setup(opts)
        end
    }
}
