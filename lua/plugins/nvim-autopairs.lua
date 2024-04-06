return {
    {
        "windwp/nvim-autopairs",
        enabled = function()
            return (not vim.g.vscode)
        end,
        event = "InsertEnter",
        opts = {},
    }
}
