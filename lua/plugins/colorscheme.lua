return {
    {
        "Mofiqul/vscode.nvim",
        enabled = function()
            return (not vim.g.vscode)
        end,
        name = "vscode",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("vscode")
        end
    },
}
