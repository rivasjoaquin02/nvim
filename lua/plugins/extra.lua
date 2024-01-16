return {
    -- autotags
    {
        "windwp/nvim-ts-autotag",
        event = "InsertEnter",
        opts = {},
    },
    -- Neovim Lua plugin to automatically manage character pairs. Part of 'mini.nvim' library.
    {
        "echasnovski/mini.pairs",
        event = "VeryLazy",
        config = function(_, opts)
            require("mini.pairs").setup(opts)
        end,
    },
    -- nice to have
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {},
    },
    -- comments
    -- TODO: como se usa esto
    {
        "numToStr/Comment.nvim",
        opts = {},
        lazy = false,
    },
    -- useful when there are embedded languages in certain types of files (e.g. Vue or React)
    { "joosepalviste/nvim-ts-context-commentstring", lazy = true },
    -- Neovim plugin to improve the default vim.ui interfaces
    {
        "stevearc/dressing.nvim",
        dependencies = { "MunifTanjim/nui.nvim" },
        opts = {},
        config = function()
            require("dressing").setup()
        end,
    },
    -- Neovim notifications and LSP progress messages
    {
        "j-hui/fidget.nvim",
        branch = "legacy",
        enabled = false,
        config = function()
            require("fidget").setup({
                window = { blend = 0 },
            })
        end,
    },
    -- Smooth scrolling neovim plugin written in lua
    {
        "karb94/neoscroll.nvim",
        config = function()
            require("neoscroll").setup({
                stop_eof = true,
                easing_function = "sine",
                hide_cursor = true,
                cursor_scrolls_alone = true,
            })
        end,
    },
    -- find and replace
    {
        "windwp/nvim-spectre",
        event = "BufRead",
        keys = {
            { "<leader>S",  '<cmd>lua require("spectre").toggle()<CR>',           desc = "Toggle Spectre" },
            {
                "<leader>sw",
                '<cmd>lua require("spectre").open_visual({select_word=true})<CR>',
                desc = "Search current word",
            },
            { "<leader>sw", '<esc><cmd>lua require("spectre").open_visual()<CR>', desc = "Search current word" },
            {
                "<leader>sp",
                '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>',
                desc = "Search on current file",
            },
        },
    },
    -- Add/change/delete surrounding delimiter pairs with ease
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup()
        end,
    },
    -- Neovim setup for init.lua and plugin development with full signature help, docs and completion for the nvim lua API
    { "folke/neodev.nvim" },
    -- editor config support
    --{ "editorconfig/editorconfig-vim" },

    -- breadcrumbs
    {
        "LunarVim/breadcrumbs.nvim",
        config = function()
            require("breadcrumbs").setup()
        end,
    },
    -- Simple winbar/statusline plugin that shows your current code context
    {
        "SmiteshP/nvim-navic",
        config = function()
            local icons = require("config.icons")
            require("nvim-navic").setup({
                highlight = true,
                lsp = {
                    auto_attach = true,
                    preference = { "typescript-tools" },
                },
                click = true,
                separator = " " .. icons.ui.ChevronRight .. " ",
                depth_limit = 0,
                depth_limit_indicator = "..",
                icons = {
                    File = " ",
                    Module = " ",
                    Namespace = " ",
                    Package = " ",
                    Class = " ",
                    Method = " ",
                    Property = " ",
                    Field = " ",
                    Constructor = " ",
                    Enum = " ",
                    Interface = " ",
                    Function = " ",
                    Variable = " ",
                    Constant = " ",
                    String = " ",
                    Number = " ",
                    Boolean = " ",
                    Array = " ",
                    Object = " ",
                    Key = " ",
                    Null = " ",
                    EnumMember = " ",
                    Struct = " ",
                    Event = " ",
                    Operator = " ",
                    TypeParameter = " ",
                },
            })
        end,
        {
            "uga-rosa/ccc.nvim",
            lazy = true,
            keys = {
                { "<leader>cp", "<Cmd>CccPick<CR>",              desc = "[C]olor [P]ick" },
                { "<leader>ct", "<Cmd>CccHighlighterToggle<CR>", desc = "[C]olor [T]oogle" },
                { "<leader>cv", "<Cmd>CccConvert<CR>",           desc = "[C]olor [C]onverter" },
            },
            config = function()
                require("ccc").setup({
                    highlighter = {
                        auto_enable = true,
                        lsp = true,
                    },
                })
            end,
        },
    },

    -- misc
    { "kevinhwang91/nvim-bqf", ft = "qf" },

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
