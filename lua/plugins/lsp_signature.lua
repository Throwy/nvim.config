return {
    {
        'ray-x/lsp_signature.nvim',
        event = "VeryLazy",
        opts = {
            floating_window_above_cur_line = true,
        },
        config = function(_, opts)
            require('lsp_signature').setup(opts)
        end
    }
}
