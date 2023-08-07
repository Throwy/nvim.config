return {
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {},
    },
    {
        "nvim-treesitter/nvim-treesitter",
        enabled = function ()
           return (not vim.g.vscode)
        end,
        build = ":TSUpdate",
        opts = {
            highlight = {
                enable = true,
            },
            indent = {
                enable = truem
            },
            ensure_installed = {
                "typescript",
                "javascript",
                "lua",
            },
            sync_install = false,
            auto_install = true,
            autotag = {
                enable = true
            },
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end
    },
}

