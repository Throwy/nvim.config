return {
    {
        'folke/trouble.nvim',
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {},
        config = function(_, opts)
            require('trouble').setup(opts)

            local trouble = require('trouble')
            vim.keymap.set('n', '<leader>tt', function() trouble.toggle() end)
            vim.keymap.set('n', '[t', function() trouble.previous({ skip_groups = true, jump = true }) end)
            vim.keymap.set('n', ']t', function() trouble.next({ skip_groups = true, jump = true }) end)
        end
    },
}
