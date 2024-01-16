return {
    "L3MON4D3/LuaSnip",
    event = "VeryLazy",
    config = function()
        local ls = require("luasnip")
        local opts = { silent = true }

        vim.keymap.set({ "i" }, "<C-K>", function()
            ls.expand()
        end, opts)
        vim.keymap.set({ "i", "s" }, "<C-L>", function()
            ls.jump(1)
        end, opts)
        vim.keymap.set({ "i", "s" }, "<C-H>", function()
            ls.jump(-1)
        end, opts)
        vim.keymap.set({ "i", "s" }, "<C-E>", function()
            if ls.choice_active() then
                ls.change_choice(1)
            end
        end, opts)

        require("luasnip.loaders.from_snipmate").lazy_load()
    end,
    dependencies = {
        { "rafamadriz/friendly-snippets" }, --snippets like vscode
        { "saadparwaiz1/cmp_luasnip" },
        { "honza/vim-snippets" },
    },
}
