local silent = { silent = true }

require("lualine").setup({
    options = {
        icons_enabled = true,
        theme = "gruvbox",
        component_separators = "|",
        section_separators = "",
    },
    sections = {
        lualine_x = {
            {
                require("noice").api.statusline.mode.get,
                cond = require("noice").api.statusline.mode.has,
                color = { fg = "#aaf7f0" },
            },
            "filetype",
        },
    },
})

require("nvim-ts-autotag").setup()
require("gitsigns").setup()
require("nvim-autopairs").setup()
require("symbols-outline").setup({
    auto_close = true,
})

require("refactoring").setup()

-- keymaps
vim.keymap.set("n", "<leader>rr", require("refactoring").select_refactor)
vim.keymap.set("n", "<leader>u", "<Cmd>UndotreeToggle<CR>", silent)
--vim.keymap.set("n", "<leader>s", "<Cmd>SymbolsOutline<CR>", silent)
vim.keymap.set("n", "<leader>db", "<Cmd>DBUIToggle<CR>", silent)
