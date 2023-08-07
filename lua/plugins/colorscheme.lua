return {
    { 
        "nyoom-engineering/oxocarbon.nvim",
        enabled = function ()
           return (not vim.g.vscode)
        end,
        name = "oxocarbon",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("oxocarbon")
        end   
    },
}
