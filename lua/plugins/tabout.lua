return {
    {
        "abecodes/tabout.nvim",
        enabled = function ()
            return (not vim.g.vscode)
        end,
        lazy = false,
        priority = 1,
        config = function()
            require("tabout").setup()
        end
    }
}
