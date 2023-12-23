-- this must be called BEFORE lazy
vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>u", ":UndotreeShow<CR>")

-- this is for move a selected line up and down (like alt in vscode)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- J: takes the lane below and append it to the current line
vim.keymap.set("n", "J", "mzJ`z")

-- move to half page jumping
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- while searching it keeps the cursor at the beginning
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- it mantains what you have yanked and pasted after pasted
vim.keymap.set("x", "<leader>p", [["_dP]])

-- yank to the + register with is also the system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- switch projects with tmux
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- 😎: format the code
vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format()
end)

-- vertical - horizontal view
vim.keymap.set("n", "<leader>nv", ":Vex <CR>")
vim.keymap.set("n", "<leader>nh", ":Sex <CR>")

-- quickfix navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- global replace the word 
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- this make your current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

-- debugging
vim.keymap.set("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>")
vim.keymap.set("n", "<leader>dr", "<cmd> DapContinue <CR>")

-- terminal window
vim.keymap.set("n", "<leader>tv", ":Vex | term <CR>")
vim.keymap.set("n", "<leader>th", ":Sex | term <CR>")
vim.keymap.set("n", "<leader>tt", ":tabnew | term <CR>")

-- competitest
vim.keymap.set("n", "<leader>tr", ":CompetiTest run <CR>")
vim.keymap.set("n", "<leader>tn", ":CompetiTest add_testcase <CR>")
vim.keymap.set("n", "<leader>td", ":CompetiTest delete_testcase <CR>")
vim.keymap.set("n", "<leader>te", ":CompetiTest edit_testcase <CR>")
