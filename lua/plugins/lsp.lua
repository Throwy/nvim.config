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
                local opts = { buffer = bufnr }

                -- use all active/attached servers to format the current buffer
                vim.keymap.set("n", "<leader>lf", function()
                    vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
                end, opts)
            end)

            lsp.ensure_installed({
                "tsserver",
                "csharp_ls",
                "bashls",
                "cssls",
                "html",
                "jsonls",
                "lua_ls",
                "eslint",
                "sqlls",
                "yamlls",
                "pyre",
            })

            lsp.setup()

            local cmp = require("cmp")

            cmp.setup({
                preselect = "item",
                completion = {
                    completeopt = 'menu,menuone,noinsert'
                },
                mapping = {
                    ["<TAB>"] = cmp.mapping.confirm({ select = false })
                }
            })
        end
    }
}
