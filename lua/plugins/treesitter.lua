return {
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {},
    },
    {
        "nvim-treesitter/nvim-treesitter",
        version = false,
        enabled = function ()
           return (not vim.g.vscode)
        end,
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        cmd = { "TSUpdateSync" },
        opts = {
            highlight = {
                enable = true,
            },
            indent = {
                enable = true
            },
            ensure_installed = {
                "typescript",
                "javascript",
                "lua",
                "c_sharp",
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

