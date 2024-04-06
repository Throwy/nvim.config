return {
    {
        "akinsho/toggleterm.nvim",
        enabled = function()
            return (not vim.g.vscode)
        end,
        version = "*",
        opts = {
            open_mapping = [[<F7>]],
            direction = "float",
        },
    },
}
