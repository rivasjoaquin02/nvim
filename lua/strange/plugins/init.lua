return {
    { "github/copilot.vim",                         event = "VeryLazy" },

    -- nice to have
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {},
    },
    {
        "windwp/nvim-ts-autotag",
        event = "InsertEnter",
        opts = {},
    },
    { "JoosepAlviste/nvim-ts-context-commentstring" },

    -- misc
    { "kevinhwang91/nvim-bqf",                      ft = "qf" },

    -- db ui
    {
        "kristijanhusak/vim-dadbod-ui",
        event = "VeryLazy",
        dependencies = {
            { "tpope/vim-dadbod",                     lazy = true },
            { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
        },
        cmd = {
            "DBUI",
            "DBUIToggle",
            "DBUIAddConnection",
            "DBUIFindBuffer",
        },
        keys = {
            { "<leader>db", "<Cmd>DBUIToggle<CR>", desc = "[D]e[B]ug" },
        },
        init = function()
            vim.g.db_ui_use_nerd_fonts = 1
        end,
    },
}
