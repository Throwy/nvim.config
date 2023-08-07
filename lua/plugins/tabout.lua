return {
    {
        "abecodes/tabout.nvim",
        lazy = false,
        priority = 1,
        config = function()
            require("tabout").setup()
        end
    }
}
