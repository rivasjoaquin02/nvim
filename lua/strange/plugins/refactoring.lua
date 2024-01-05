return {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    event = "VeryLazy",
    config = function()
        local refactoring = require("refactoring")
        local telescope = require("telescope")

        refactoring.setup({
            printf_statements = {
                c = { 'printf("%%s %s", %s)' },
                cpp = { 'std:cout << "%s";' },
                py = { "print(%s)" },
                ts = { "console.log(%s)" },
                js = { "console.log(%s)" },
            },
        })

        vim.keymap.set({ "n", "x" }, "<leader>rr", telescope.extensions.refactoring.refactors)
        vim.keymap.set({ "x", "n" }, "<leader>rv", refactoring.debug.print_var)
    end,
}
