local config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    luasnip.config.setup {}

    cmp.setup({
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end,
        },
        completion = { completeopt = 'menu,menuone,noinsert' },
        mapping = cmp.mapping.preset.insert {
            ["<C-n>"] = cmp.mapping.select_next_item(),
            ["<C-p>"] = cmp.mapping.select_prev_item(),
            ["<C-f>"] = cmp.mapping.scroll_docs(-4),
            ["<C-b>"] = cmp.mapping.scroll_docs(4),
            ["<TAB>"] = cmp.mapping.confirm({ select = true }),
            ["<C-e>"] = cmp.mapping.abort(),
            ["<C-.>"] = cmp.mapping.complete(),

            ['<C-l>'] = cmp.mapping(function()
                if luasnip.expand_or_locally_jumpable() then
                    luasnip.expand_or_jump()
                end
            end, { 'i', 's' }),

            ['<C-h>'] = cmp.mapping(function()
                if luasnip.locally_jumpable(-1) then
                    luasnip.jump(-1)
                end
            end, { 'i', 's' }),
        },
        sources = {
            { name = "nvim_lsp" },
            { name = "luasnip" },
            { name = 'path' },
            { name = 'nvim_lsp_signature_help' }
        },
    })
end

return {
    {
        "hrsh7th/nvim-cmp",
        event = 'InsertEnter',
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "L3MON4D3/LuaSnip",
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-nvim-lsp-signature-help',
        },
        config = config,
    },
}
