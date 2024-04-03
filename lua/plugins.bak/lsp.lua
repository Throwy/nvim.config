return {
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        },
        config = function()
            local lsp = require("lsp-zero").preset({})

            lsp.on_attach(function(client, bufnr)
                lsp.default_keymaps({ buffer = bufnr })
            end)

            require("mason").setup({})
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "omnisharp"
                },
                handlers = {
                    lsp.default_setup
                }
            })

            -- lsp.ensure_installed({
            --     "omnisharp",
            -- })

            lsp.setup()

            local cmp = require("cmp")

            cmp.setup({
                preselect = "item",
                completion = {
                    completeopt = 'menu,menuone,noinsert',
                    autocomplete = false
                },
                mapping = cmp.mapping.preset.insert({
                    ["<TAB>"] = cmp.mapping.confirm({ select = false }),
                    ["<C-Space>"] = cmp.mapping.complete(),
                }),
            })
        end
    }
}
