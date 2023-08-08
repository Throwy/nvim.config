return {
    {
        "Mofiqul/vscode.nvim",
        enabled = function ()
           return (not vim.g.vscode)
        end,
        name = "vscode",
        lazy = false,
        priority = 1000,
    },
    {
        "martinsione/darkplus.nvim",
        enabled = function ()
           return (not vim.g.darkplus)
        end,
        name = "darkplus",
        lazy = false,
        priority = 1000,
    },
    {
        "catppuccin/nvim",
        enabled = function ()
           return (not vim.g.vscode)
        end,
        name = "catppuccin",
        lazy = false,
        priority = 1000,
    },
    {
        "AlexvZyl/nordic.nvim",
        enabled = function ()
           return (not vim.g.vscode)
        end,
        name = "nordic",
        lazy = false,
        priority = 1000,
    },
}
