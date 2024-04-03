return {
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        enabled = function ()
           return (not vim.g.vscode)
        end,
        opts = {
            open_mapping = [[<F7>]],
            direction = "float",
        }
    }
}

