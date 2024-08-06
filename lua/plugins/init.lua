return {
    -- Run Async Shell Commands in Vim 8.0 / NeoVim and Output to the Quickfix Window !!
    { "skywind3000/asyncrun.vim", enabled = false },

    -- A super powerful autopair plugin for Neovim that supports multiple characters.
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        dependencies = { "hrsh7th/nvim-cmp" },
        config = function()
            require("nvim-autopairs").setup {}
            -- If you want to automatically add `(` after selecting a function or method
            local cmp_autopairs = require "nvim-autopairs.completion.cmp"
            local cmp = require "cmp"
            cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end,
    },

    { "folke/twilight.nvim", opts = {} },

    -- <C-t> opens term
    {
        "akinsho/toggleterm.nvim",
        event = "VeryLazy",
        opts = {
            open_mapping = [[<C-t>]],
            direction = "float",
            float_opts = {
                border = "curved",
                winblend = 0,
                highlights = { border = "Normal", background = "Normal" },
            },
        },
    },

    -- auto close/rename html (w/ treesitter)
    { "windwp/nvim-ts-autotag", lazy = true, event = "InsertEnter" },

    -- "gc" & "gb" to comment visual regions/lines
    {
        "numToStr/Comment.nvim",
        lazy = true,
        event = "BufReadPost",
        config = function()
            require("Comment").setup {
                pre_hook = require(
                    "ts_context_commentstring.integrations.comment_nvim"
                ).create_pre_hook(),
            }
        end,
        -- for embedded languages (e.g. Vue or React)
        dependencies = "joosepalviste/nvim-ts-context-commentstring",
    },

    -- Detect tabstop and shiftwidth automatically
    -- { 'tpope/vim-sleuth', event = 'InsertEnter' },

    -- Smooth scrolling neovim
    { "karb94/neoscroll.nvim", lazy = true, event = "BufReadPost", opts = {} },

    -- Add/change/delete surrounding delimiter pairs with ease
    -- { "kylechui/nvim-surround", lazy = true, event = "VeryLazy", opts = {} },
    --[[ Old text                    Command         New text
    surr*ound_words             ysiw)           (surround_words)
    *make strings               ys$"            "make strings"
    [delete ar*ound me!]        ds]             delete around me!
    remove <b>HTML t*ags</b>    dst             remove HTML tags
    'change quot*es'            cs'"            "change quotes"
    <b>or tag* types</b>        csth1<CR>       <h1>or tag types</h1>
    delete(functi*on calls)     dsf             function calls
    ]]

    -- Highlight todo, notes, etc in comments
    {
        "folke/todo-comments.nvim",
        lazy = true,
        event = { "BufReadPost", "BufNewFile" },
        dependencies = "nvim-lua/plenary.nvim",
        opts = function()
            -- signs = false,
            local icons = require "config.icons"
            return {
                keywords = {
                    FIX = {
                        icon = icons.todo.fix,
                        color = "error",
                        alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
                    },
                    TODO = { icon = icons.todo.todo, color = "info" },
                    HACK = { icon = icons.todo.hack, color = "warning" },
                    WARN = {
                        icon = icons.todo.warn,
                        color = "warning",
                        alt = { "WARNING", "XXX" },
                    },
                    PERF = {
                        icon = icons.todo.perf,
                        alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" },
                    },
                    NOTE = {
                        icon = icons.todo.note,
                        color = "hint",
                        alt = { "INFO" },
                    },
                    TEST = {
                        icon = icons.todo.test,
                        color = "test",
                        alt = { "TESTING", "PASSED", "FAILED" },
                    },
                },
            }
        end,
    },

    -- precognition.nvim assists with discovering motions (Both vertical and horizontal) to navigate your current buffer
    {
        "tris203/precognition.nvim",
        enabled = false,
        opts = {
            startVisible = true,
            showBlankVirtLine = true,
            highlightColor = "Comment",
            hints = {
                Caret = { text = "^", prio = 2 },
                Dollar = { text = "$", prio = 1 },
                MatchingPair = { text = "%", prio = 5 },
                Zero = { text = "0", prio = 1 },
                w = { text = "w", prio = 10 },
                b = { text = "b", prio = 9 },
                e = { text = "e", prio = 8 },
                W = { text = "W", prio = 7 },
                B = { text = "B", prio = 6 },
                E = { text = "E", prio = 5 },
            },
            gutterHints = {
                -- prio is not currently used for gutter hints
                G = { text = "G", prio = 1 },
                gg = { text = "gg", prio = 1 },
                PrevParagraph = { text = "{", prio = 1 },
                NextParagraph = { text = "}", prio = 1 },
            },
        },
    },

    -- A Neovim plugin helping you establish good command workflow and habit
    -- {
    --     'm4xshen/hardtime.nvim',
    --     dependencies = { 'MunifTanjim/nui.nvim', 'nvim-lua/plenary.nvim' },
    --     opts = {},
    -- },

    -- Preview Markdown in your modern browser with synchronised scrolling and flexible configuration.
    -- {
    --     'iamcco/markdown-preview.nvim',
    --     cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    --     ft = { 'markdown' },
    --     build = function()
    --         vim.fn['mkdp#util#install']()
    --     end,
    -- },
}
