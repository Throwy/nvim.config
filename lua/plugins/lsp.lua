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
            local client = vim.lsp.get_client_by_id(event.data.client_id)
            if client.server_capabilities.signatureHelpProvider then
                require("lsp-overloads").setup(client, {})
            end

            keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>",
                keymap_options({ buffer = event.buf, desc = "Lsp Hover" }))
            keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>",
                keymap_options({ buffer = event.buf, desc = "(LSP) Go to definition" }))
            keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>",
                keymap_options({ buffer = event.buf, desc = "(LSP) Go to declaration" }))
            keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>",
                keymap_options({ buffer = event.buf, desc = "(LSP) Go to implementation" }))
            keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>",
                keymap_options({ buffer = event.buf, desc = "(LSP) Go to type definition" }))
            keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>",
                keymap_options({ buffer = event.buf, desc = "(LSP) Go to references" }))
            keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>",
                keymap_options({ buffer = event.buf, desc = "(LSP) Go to signature" }))
            keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>",
                keymap_options({ buffer = event.buf, desc = "(LSP) Rename" }))
            keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>",
                keymap_options({ buffer = event.buf, desc = "(LSP) Format" }))
            keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>",
                keymap_options({ buffer = event.buf, desc = "(LSP) Code actions" }))

            keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>",
                keymap_options({ buffer = event.buf, desc = "(LSP) Open diagnostics float" }))
            keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>",
                keymap_options({ buffer = event.buf, desc = "(LSP) Go to prev diagnostic" }))
            keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>",
                keymap_options({ buffer = event.buf, desc = "(LSP) Go to next diagnostic" }))
        end,
    })

    local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
    local default_setup = function(server)
        require("lspconfig")[server].setup({
            capabilities = lsp_capabilities,
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

    local cmp = require("cmp")
    local luasnip = require("luasnip")

    cmp.setup({
        sources = {
            { name = "nvim_lsp" },
            { name = "luasnip" },
        },
        mapping = cmp.mapping.preset.insert({
            ["<TAB>"] = cmp.mapping.confirm({ select = true }),
            ["<C-.>"] = cmp.mapping.complete(),
        }),
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end,
        },
    })
end

return {
    {
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
            "L3MON4D3/LuaSnip",
            "Issafalcon/lsp-overloads.nvim"
        },
        lazy = false,
        config = config,
    },
}
