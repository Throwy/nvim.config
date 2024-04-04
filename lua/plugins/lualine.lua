return {
    {
        "nvim-lualine/lualine.nvim",
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
