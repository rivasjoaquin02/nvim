return {
    { "github/copilot.vim",                         event = "VeryLazy" },
    -- nice to have
    { "numToStr/Comment.nvim" },
    { "windwp/nvim-autopairs" },
    { "windwp/nvim-ts-autotag" },
    { "JoosepAlviste/nvim-ts-context-commentstring" },
    { "ThePrimeagen/refactoring.nvim" },

    -- navigation
    { "simrat39/symbols-outline.nvim" },

    -- git
    { "lewis6991/gitsigns.nvim" },


    -- misc
    { "kevinhwang91/nvim-bqf",                      ft = "qf" },
    { "mbbill/undotree" },
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
        init = function()
            vim.g.db_ui_use_nerd_fonts = 1
        end,
    },
}
