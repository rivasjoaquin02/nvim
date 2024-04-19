-- [[ Leader Key ]]
-- See `:help mapleader`
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true

-- [[ Setting options ]]
-- See `:help vim.opt` or `:help option-list`
local options = {
  number = true, -- set numbered lines
  relativenumber = true, -- set relative numbered lines

  numberwidth = 4, -- set number column width to 4
  termguicolors = true, -- set term gui colors (most terminals support this)
  cursorline = true, -- highlight the current line

  softtabstop = 4,
  autoindent = true,
  tabstop = 4,
  shiftwidth = 4, -- the number of spaces inserted for each indentation
  expandtab = true, -- convert tabs to spaces
  showmatch = true,
  breakindent = true, -- wrap lines with indent

  -- SEARCH
  incsearch = true, -- make search act like search in modern browsers
  hlsearch = false, -- Set highlight on search, but clear on pressing <Esc> in normal mode
  ignorecase = true, -- ignore case in search patterns

  -- VIM BACKUP
  backup = false, -- creates a backup file
  writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  swapfile = false, -- creates a swapfile
  undofile = true, -- save undo history

  clipboard = 'unnamedplus', -- allows neovim to access the system clipboard
  --cmdheight = 1, -- more space in the neovim command line for displaying messages
  completeopt = { 'menuone', 'noselect' }, -- mostly just for cmp
  conceallevel = 0, -- so that `` is visible in markdown files
  --fileencoding = "utf-8",                  -- the encoding written to a file

  mouse = 'a', -- Enable mouse mode, can be useful for resizing splits for example!
  pumheight = 10, -- pop up menu height
  showmode = false, -- Don't show the mode, since it's already in the status line

  showtabline = 0, -- always show tabs
  smartcase = true, -- smart case
  smartindent = true, -- make indenting smarter again

  -- SPLIT
  splitbelow = true, -- force all horizontal splits to go below current window
  splitright = true, -- force all vertical splits to go to the right of current window

  -- TIME
  -- Displays which-key popup sooner
  timeoutlen = 1000, -- time to wait for a mapped sequence to complete (in milliseconds)
  updatetime = 20, -- faster completion (4000ms default)

  signcolumn = 'yes', -- always show the sign column, otherwise it would shift the text each time
  wrap = false, -- display lines as one long line
  errorbells = false,
  hidden = true,
  showcmd = false, -- Don't show the command in the last line
  ruler = false, -- Don't show the ruler

  colorcolumn = '80',
  scrolloff = 10, -- Minimal number of screen lines to keep above and below the cursor.
  sidescrolloff = 10, -- Makes sure there are always eight lines of context

  titlestring = 'Neovim - %t',
  --guifont = "MesloLGS NF:h18",
  guicursor = 'a:block',
  title = true, -- set the title of window to the value of the titlestring
  confirm = true, -- confirm to save changes before exiting modified buffer
  fillchars = { eob = ' ' }, -- change the character at the end of buffer

  -- Sets how neovim will display certain whitespace characters in the editor.
  --  See `:help 'list'`
  --  and `:help 'listchars'`
  list = true,
  listchars = { tab = '» ', trail = '·', nbsp = '␣' },

  -- Preview substitutions live, as you type!
  inccommand = 'split',

  -- [[ Basic Keymaps ]]
  --  See `:help vim.keymap.set()`
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- -- https://github.com/jose-elias-alvarez/null-ls.nvim/issues/428
local notify = vim.notify
vim.notify = function(msg, ...)
  if msg:match 'warning: multiple different client offset_encodings' then
    return
  end

  notify(msg, ...)
end
