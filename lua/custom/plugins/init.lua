return {
  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  --    For additional information, see `:help lazy.nvim-lazy.nvim-structuring-your-plugins`
  { import = 'custom.plugins' },

  -- Use treesitter to auto close and auto rename html tag
  { 'windwp/nvim-ts-autotag', event = 'InsertEnter' },

  -- Detect tabstop and shiftwidth automatically
  { 'tpope/vim-sleuth' },

  -- "gc" & "gb" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  -- useful for embedded languages in certain types of files (e.g. Vue or React)
  { 'joosepalviste/nvim-ts-context-commentstring', lazy = true },

  -- Smooth scrolling neovim plugin written in lua
  {
    'karb94/neoscroll.nvim',
    opts = {
      stop_eof = true,
      easing_function = 'sine',
      hide_cursor = true,
      cursor_scrolls_alone = true,
    },
  },

  -- Add/change/delete surrounding delimiter pairs with ease
  { 'kylechui/nvim-surround', event = 'VeryLazy', opts = {} },
  --[[ Old text                    Command         New text
--------------------------------------------------------------------------------
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
    event = 'VeryLazy',
    -- event = { "BufReadPost", "BufNewFile" },
    dependencies = 'nvim-lua/plenary.nvim',
    opts = {
      -- signs = false,
      keywords = {
        FIX = { icon = require('config.icons').todo.fix, color = 'error', alt = { 'FIXME', 'BUG', 'FIXIT', 'ISSUE' } },
        TODO = { icon = require('config.icons').todo.todo, color = 'info' },
        HACK = { icon = require('config.icons').todo.hack, color = 'warning' },
        WARN = { icon = require('config.icons').todo.warn, color = 'warning', alt = { 'WARNING', 'XXX' } },
        PERF = { icon = require('config.icons').todo.perf, alt = { 'OPTIM', 'PERFORMANCE', 'OPTIMIZE' } },
        NOTE = { icon = require('config.icons').todo.note, color = 'hint', alt = { 'INFO' } },
        TEST = { icon = require('config.icons').todo.test, color = 'test', alt = { 'TESTING', 'PASSED', 'FAILED' } },
      },
      gui_style = {
        fg = 'NONE', -- The gui style to use for the fg highlight group.
        bg = 'BOLD', -- The gui style to use for the bg highlight group.
      },
      merge_keywords = true, -- when true, custom keywords will be merged with the defaults
      highlight = {
        multiline = true, -- enable multine todo comments
        multiline_pattern = '^.', -- lua pattern to match the next multiline from the start of the matched keyword
        multiline_context = 10, -- extra lines that will be re-evaluated when changing a line
        before = '', -- "fg" or "bg" or empty
        keyword = 'wide', -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty.
        after = 'fg', -- "fg" or "bg" or empty
        pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlighting (vim regex)
        comments_only = true, -- uses treesitter to match keywords in comments only
        max_line_len = 400, -- ignore lines longer than this
        exclude = {}, -- list of file types to exclude highlighting
      },
      -- list of highlight groups or use the hex color if hl not found as a fallback
      colors = {
        error = { 'DiagnosticError', 'ErrorMsg', '#DC2626' },
        warning = { 'DiagnosticWarn', 'WarningMsg', '#FBBF24' },
        info = { 'DiagnosticInfo', '#2563EB' },
        hint = { 'DiagnosticHint', '#10B981' },
        default = { 'Identifier', '#7C3AED' },
        test = { 'Identifier', '#FF00FF' },
      },
    },
  },
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
}

-- TODO: sddg
-- FIX: sddfg
-- HACK: fdgdfg
-- WARN: fgdggd
-- PERF: fdfgdg
-- NOTE: sdgdfg
-- TEST: dfgdg
