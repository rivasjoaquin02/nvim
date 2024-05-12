return {
    -- <C-t> opens term
    {
        'akinsho/toggleterm.nvim',
        opts = {
            open_mapping = [[<C-t>]],
            direction = 'float',
            float_opts = {
                border = 'curved',
                winblend = 0,
                highlights = { border = 'Normal', background = 'Normal' },
            },
        },
    },

    -- auto close/rename html (w/ treesitter)
    { 'windwp/nvim-ts-autotag', lazy = true, event = 'InsertEnter' },

    -- "gc" & "gb" to comment visual regions/lines
    {
        'numToStr/Comment.nvim',
        lazy = true,
        event = 'BufReadPost',
        config = function()
            require('Comment').setup {
                pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
            }
        end,
        -- for embedded languages (e.g. Vue or React)
        dependencies = 'joosepalviste/nvim-ts-context-commentstring',
    },

    -- Detect tabstop and shiftwidth automatically
    -- { 'tpope/vim-sleuth', event = 'InsertEnter' },

    -- Smooth scrolling neovim
    { 'karb94/neoscroll.nvim', lazy = true, event = 'BufReadPost', opts = {} },

    -- Add/change/delete surrounding delimiter pairs with ease
    { 'kylechui/nvim-surround', lazy = true, event = 'VeryLazy', opts = {} },
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
        'folke/todo-comments.nvim',
        lazy = true,
        event = { 'BufReadPost', 'BufNewFile' },
        dependencies = 'nvim-lua/plenary.nvim',
        opts = function()
            -- signs = false,
            local icons = require 'config.icons'
            return {
                keywords = {
                    FIX = { icon = icons.todo.fix, color = 'error', alt = { 'FIXME', 'BUG', 'FIXIT', 'ISSUE' } },
                    TODO = { icon = icons.todo.todo, color = 'info' },
                    HACK = { icon = icons.todo.hack, color = 'warning' },
                    WARN = { icon = icons.todo.warn, color = 'warning', alt = { 'WARNING', 'XXX' } },
                    PERF = { icon = icons.todo.perf, alt = { 'OPTIM', 'PERFORMANCE', 'OPTIMIZE' } },
                    NOTE = { icon = icons.todo.note, color = 'hint', alt = { 'INFO' } },
                    TEST = { icon = icons.todo.test, color = 'test', alt = { 'TESTING', 'PASSED', 'FAILED' } },
                },
            }
        end,
    },
}

-- TODO: sddg
-- FIX: sddfg
-- HACK: fdgdfg
-- WARN: fgdggd
-- PERF: fdfgdg
-- NOTE: sdgdfg
-- TEST: dfgdg
