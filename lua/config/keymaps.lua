local opts = { noremap = true, silent = true }
local map = vim.keymap.set

-- Fast saving
map("n", "<Leader>w", ":write!<CR>", opts)
map("n", "<Leader>q", ":q!<CR>", opts)

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- paste over currently selected text without yanking it
map("v", "p", '"_dp')
map("v", "P", '"_dP')

-- Navigate buffers
map("n", "]b", ":bnext<CR>", opts)
map("n", "[b", ":bprevious<CR>", opts)

-- Create splits
map("n", "\\", "<cmd>split<CR>", { nowait = true, noremap = true })
map("n", "|", "<cmd>vsplit<CR>")

-- Panes resizing
map("n", "+", ":vertical resize +5<CR>")
map("n", "_", ":vertical resize -5<CR>")
map("n", "=", ":resize +5<CR>")
map("n", "-", ":resize -5<CR>")

-- Navigate buffers
map("n", "<Right>", ":bnext<CR>", opts)
map("n", "<Left>", ":bprevious<CR>", opts)

-- this is for move a selected line up and down (like alt in vscode)
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- J: takes the lane below and append it to the current line
map("n", "J", "mzJ`z")

-- move to half page jumping
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- while searching it keeps the cursor at the beginning
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- it mantains what you have yanked and pasted after pasted
map("x", "<leader>p", [["_dP]])

-- yank to the + register with is also the system clipboard
map({ "n", "v" }, "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])

-- 😎: format the code
map("n", "<leader>f", function()
    vim.lsp.buf.format({
        filter = function(client)
            return client.name ~= "tsserver"
        end,
    })
end)

-- quickfix navigation
map("n", "<C-k>", "<cmd>cnext<CR>zz")
map("n", "<C-j>", "<cmd>cprev<CR>zz")
map("n", "<leader>k", "<cmd>lnext<CR>zz")
map("n", "<leader>j", "<cmd>lprev<CR>zz")

-- global replace the word
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

map("n", "<leader><leader>", function()
    vim.cmd("so")
end)

-- Open floating terminal
map("n", "<C-\\>", ":ToggleTerm direction=float<CR>", opts)
map("n", "<leader>tv", ":Vex | term <CR>")
map("n", "<leader>th", ":Sex | term <CR>")
map("n", "<leader>tt", ":tabnew | term <CR>")
map("t", "<Esc>", "<C-\\><C-n>")

-- Select all
map("n", "<C-a>", "ggVG", opts)
