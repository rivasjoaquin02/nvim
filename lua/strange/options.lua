local options = {
    autoindent = true,
    smartindent = true, -- make indenting smarter again	
    tabstop = 4,
    shiftwidth = 4,
    expandtab = true, -- convert tabs to spaces	
    showtabline = 0,
    showmatch = true,
    breakindent = true, -- wrap lines with indent

    -- SPLIT
    splitbelow = true, -- force all horizontal splits to go below current window
    splitright = true, -- force all vertical splits to go to the right of current window

    number = true,
    relativenumber = true,
    numberwidth = 4,
    incsearch = true, -- make search act like search in modern browsers
    hlsearch = false, -- highlight all matches on previous search pattern
    ignorecase = true,
    smartcase = true,

    termguicolors = true, -- set term gui colors (most terminals support this)	
    hidden = true,
    signcolumn = "yes",   -- always show the sign column, otherwise it would shift the text each time	
    showmode = true,
    errorbells = false,
    wrap = false,        -- display lines as one long line	
    cursorline = true,   -- highlight the current line

    backup = false,      -- creates a backup file
    writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited	
    swapfile = false,
    undodir = os.getenv("HOME") .. "/.vim/undodir",
    undofile = true, -- enable persistent undo

    colorcolumn = "80",
    updatetime = 20,   -- faster completion (4000ms default)
    scrolloff = 8,     -- Makes sure there are always eight lines of context
    sidescrolloff = 8, -- Makes sure there are always eight lines of context
    guicursor = "a:block",

    titlestring = "Neovim - %t",
    --guifont = "MesloLGS NF:h18",
    clipboard = "unnamedplus", -- allows neovim to access the system clipboard
    cmdheight = 0,             -- more space in the neovim command line for displaying messages
    fileencoding = "utf-8",    -- the encoding written to a file
    mouse = "a",               -- allow the mouse to be used in neovim
    guifont = "monospace:h17", -- the font used in graphical neovim applications
    title = true,              -- set the title of window to the value of the titlestring
    confirm = true,            -- confirm to save changes before exiting modified buffer
}

vim.g.mapleader = " "
vim.g.maplocalleader = " "

for k, v in pairs(options) do
    vim.opt[k] = v
end
