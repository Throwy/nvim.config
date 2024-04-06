local config = function()
    local treesitter = require("nvim-treesitter.configs")

    treesitter.setup({
        indent = {
            enable = true,
        },
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
        autotag = {
            enable = true,
        },
        textobjects = {
            select = {
                enable = true,
                lookahead = true,
                keymaps = {
                    ["af"] = { query = "@function.outer", desc = "outer function" },
                    ["if"] = { query = "@function.inner", desc = "inner function" },
                    ["aa"] = { query = "@parameter.outer", desc = "outer argument/parameter" },
                    ["ia"] = { query = "@parameter.inner", desc = "inner argument/parameter" },
                    ["ac"] = { query = "@class.outer", desc = "outer class" },
                    ["ic"] = { query = "@class.inner", desc = "inner class" },
                },
            },
        },
        ensure_installed = {
            "typescript",
            "javascript",
            "lua",
            "c_sharp",
            "python",
            "json",
            "bash",
            "css",
            "html",
            "gitignore",
            "dockerfile",
            "markdown",
            "yaml",
        },
        auto_install = true,
    })
end

return {
    "nvim-treesitter/nvim-treesitter",
    enabled = function()
        return (not vim.g.vscode)
    end,
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    version = nil,
    lazy = false,
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    config = config,
}
