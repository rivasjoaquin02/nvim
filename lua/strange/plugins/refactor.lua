return {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    event = "VeryLazy",
    config = function()
        require("refactoring").setup({
            printf_statements = {
                c = { 'printf("%%s %s", %s)' },
                cpp = { 'std:cout << "%s";' },
                py = { "print(%s)" },
                ts = { "console.log(%s)" },
                js = { "console.log(%s)" }
            }
        })

        vim.keymap.set({ "n", "x" }, "<leader>rr", require("telescope").extensions.refactoring.refactors)
        vim.keymap.set({ "x", "n" }, "<leader>rv", require('refactoring').debug.print_var)
    end
}
