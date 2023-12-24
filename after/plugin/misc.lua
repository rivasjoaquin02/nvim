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

require("nvim-treesitter.configs").setup({
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = { "latex", "markdown" },
        disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
            if lang == "latex" then
                return true
            end
            return false
        end,
    },
    indent = {
        enable = false,
        -- disable = { "cpp", "typescript", "typescriptreact", "rust" },
    },
})

require("nvim-ts-autotag").setup()
require("treesitter-context").setup({
    max_lines = 1,
})

require("gitsigns").setup()
require("nvim-autopairs").setup()
require("ccc").setup({
    highlighter = {
        auto_enable = true,
        lsp = true,
    },
})
require("symbols-outline").setup({
    auto_close = true,
})

require("refactoring").setup()

-- keymaps
vim.keymap.set("n", "<leader>rr", require("refactoring").select_refactor)
vim.keymap.set("n", "<leader>u", "<Cmd>UndotreeToggle<CR>", silent)
vim.keymap.set("n", "<leader>gg", "<Cmd>LazyGit<CR>", silent)
vim.keymap.set("n", "<leader>co", "<Cmd>CccPick<CR>", silent)
vim.keymap.set("n", "<leader>cc", "<Cmd>CccHighlighterToggle<CR>", silent)
vim.keymap.set("n", "<leader>cv", "<Cmd>CccConvert<CR>", silent)
--vim.keymap.set("n", "<leader>s", "<Cmd>SymbolsOutline<CR>", silent)
vim.keymap.set("n", "<leader>db", "<Cmd>DBUIToggle<CR>", silent)
