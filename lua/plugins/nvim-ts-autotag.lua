return {
    "windwp/nvim-ts-autotag",
    enabled = function()
        return (not vim.g.vscode)
    end,
    config = function()
        require("nvim-ts-autotag").setup({
            autotag = {
                enable = true,
            },
        })
    end
}
