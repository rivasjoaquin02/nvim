-- [[ Leader Key ]]
-- See `:help mapleader`
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- [[ Setting options ]]
-- See `:help vim.opt` or `:help option-list`

-- encoding
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.g.have_nerd_font = true
vim.opt.termguicolors = true -- set term gui colors (most terminals support this)
vim.opt.cursorline = true -- highlight the current line

vim.opt.number = true -- set numbered lines
vim.opt.relativenumber = true -- set relative numbered lines

vim.opt.title = true -- use the current buffer name as the window title

-- indentation
vim.opt.autoindent = true
vim.opt.smartcase = true -- smart case
vim.opt.smartindent = true -- make indenting smarter again
vim.opt.smarttab = true
vim.opt.breakindent = true -- wrap lines with indent
vim.opt.shiftwidth = 4 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 4
vim.opt.numberwidth = 4 -- set number column width to 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.wrap = false -- display lines as one long line
vim.opt.backspace = { "start", "eol", "indent" }

-- search
vim.opt.incsearch = true -- make search act like search in modern browsers
vim.opt.hlsearch = false -- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.path:append { "**" }
vim.opt.wildignore:append { "*/node_modules/*" }

-- backup
vim.opt.backup = false -- creates a backup file
vim.opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.opt.swapfile = false -- creates a swapfile
vim.opt.undofile = true -- save undo history

-- split
vim.opt.splitbelow = true -- force all horizontal splits to go below current window
vim.opt.splitright = true -- force all vertical splits to go to the right of current window

vim.opt.colorcolumn = "80"
vim.opt.scrolloff = 8 -- Minimal number of screen lines to keep above and below the cursor.
vim.opt.sidescrolloff = 8 -- Makes sure there are always eight lines of context

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- how neovim will display certain whitespace characters in the editor.
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

local options = {
    showmatch = true,

    -- clipboard = 'unnamedplus', -- allows neovim to access the system clipboard
    --cmdheight = 1, -- more space in the neovim command line for displaying messages
    completeopt = { "menuone", "noselect" }, -- mostly just for cmp
    conceallevel = 0, -- so that `` is visible in markdown files
    --fileencoding = "utf-8",                  -- the encoding written to a file

    mouse = "a", -- Enable mouse mode, can be useful for resizing splits for example!
    pumheight = 10, -- pop up menu height
    showmode = false, -- Don't show the mode, since it's already in the status line

    showtabline = 0, -- always show tabs

    -- TIME
    -- Displays which-key popup sooner
    timeoutlen = 1000, -- time to wait for a mapped sequence to complete (in milliseconds)
    updatetime = 20, -- faster completion (4000ms default)

    signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
    errorbells = false,
    hidden = true,
    showcmd = false, -- Don't show the command in the last line
    ruler = false, -- Don't show the ruler

    --guifont = "MesloLGS NF:h18",
    guicursor = "a:block",
    confirm = true, -- confirm to save changes before exiting modified buffer
    fillchars = { eob = " " }, -- change the character at the end of buffer
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/issues/428
-- local notify = vim.notify
-- vim.notify = function(msg, ...)
--     if msg:match 'warning: multiple different client offset_encodings' then
--         return
--     end
--
--     notify(msg, ...)
-- end
