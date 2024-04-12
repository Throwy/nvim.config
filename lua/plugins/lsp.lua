local keymap = vim.keymap
local keymap_options = require("utils.core").keymap_options

local mason_opts = {
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
}

local ensure_installed = {
    "omnisharp",
    "lua_ls",
    "jsonls",
    "html",
    "cssls",
    "bashls",
    "tsserver",
}

local config = function()
    vim.api.nvim_create_autocmd("LspAttach", {
        desc = "Lsp Actions",
        callback = function(event)
            local map = function(keys, func, desc)
                vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
            end

            local builtin = require('telescope.builtin')

            map('K', vim.lsp.buf.hover, 'Hover documentation')

            map('gd', vim.lsp.buf.definition, 'Go to definition')

            map('gD', vim.lsp.buf.declaration, 'Go to declaration')

            map('gi', vim.lsp.buf.implementation, 'Go to implementation')

            map('go', vim.lsp.buf.type_definition, 'Go to type definition')

            map('gr', vim.lsp.buf.references, 'Go to references')

            map('gs', vim.lsp.buf.signature_help, 'Go to signature')

            map('rn', vim.lsp.buf.rename, 'Rename')

            map('<F3>', vim.lsp.buf.format, 'Format')

            map('ca', vim.lsp.buf.code_action, 'Code actions')

            map('gl', vim.diagnostic.open_float, 'Open diagnostics float')

            map('[d', vim.diagnostic.goto_prev, 'Go to prev diagnostic')

            map(']d', vim.diagnostic.goto_next, 'Go to next diagnostic')

            local client = vim.lsp.get_client_by_id(event.data.client_id)
            if client and client.server_capabilities.documentHighlightProvider then
                vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                    buffer = event.buf,
                    callback = vim.lsp.buf.document_highlight,
                })

                vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                    buffer = event.buf,
                    callback = vim.lsp.buf.clear_references,
                })
            end
        end,
    })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

    local default_setup = function(server)
        require("lspconfig")[server].setup({
            capabilities = capabilities,
        })
    end

    -- Set up Mason
    require("mason").setup(mason_opts)
    require("mason-lspconfig").setup({
        ensure_installed = ensure_installed,
        handlers = {
            default_setup,
        },
    })
end

return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            { 'j-hui/fidget.nvim', opts = {} },
            { 'folke/neodev.nvim', opts = {} },
        },
        -- lazy = false,
        config = config,
    },
}
