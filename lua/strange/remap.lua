vim.g.mapleader = " "

local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

map("n", "<leader>pv", ":Ex<CR>", opts)
map("n", "<leader>u", ":UndotreeShow<CR>", opts)

-- this is for move a selected line up and down (like alt in vscode)
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)

-- J: takes the lane below and append it to the current line
map("n", "J", "mzJ`z", opts)

-- move to half page jumping
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)

-- while searching it keeps the cursor at the beginning
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)

-- it mantains what you have yanked and pasted after pasted
map("x", "<leader>p", "\"_dP", opts)

-- yank to the + register with is also the system clipboard
map("n", "<leader>y", "\"+y", opts)
map("v", "<leader>y", "\"+y", opts)
map("n", "<leader>Y", "\"+Y", opts)

-- switch projects with tmux
map("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", opts)

-- 😎: format the code
vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format()
end)

-- quickfix navigation
map("n", "<C-k>", "<cmd>cnext<CR>zz", opts)
map("n", "<C-j>", "<cmd>cprev<CR>zz", opts)
map("n", "<leader>k", "<cmd>lnext<CR>zz", opts)
map("n", "<leader>j", "<cmd>lprev<CR>zz", opts)

-- global replace the word 
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- this make your current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
