return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        { "hrsh7th/cmp-nvim-lsp" },
        { "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
    },
    config = function()
        local lsp = require("lsp-zero")
        lsp.extend_cmp()

        local cmp = require("cmp")
        local cmp_action = lsp.cmp_action()
        local icons = require("strange.icons")

        cmp.setup({
            formatting = {
                format = function(entry, item)
                    item.kind = icons.kind[item.kind] .. " " .. item.kind
                    --return item
                    return require("tailwindcss-colorizer-cmp").formatter(entry, item)
                end,
                --require("tailwindcss-colorizer-cmp").formatter,
            },
            mapping = cmp.mapping.preset.insert({
                ["<Tab>"] = cmp_action.luasnip_supertab(),
                ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                ["<C-d>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            }),
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "nvim_lua" },
                { name = "luasnip" },
                { name = "buffer" },
                { name = "path" },
                { name = "calc" },
                { name = "emoji" },
                { name = "treesitter" },
                { name = "tmux" },
            }),
        })
    end,
}
