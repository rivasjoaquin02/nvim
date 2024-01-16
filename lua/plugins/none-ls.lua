return {
    "nvimtools/none-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "jay-babu/mason-null-ls.nvim",
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
            on_init = function(new_client, _)
                new_client.offset_encoding = "utf-32"
            end,
            sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.prettier,
                null_ls.builtins.formatting.black,
                null_ls.builtins.diagnostics.eslint_d,
                null_ls.builtins.diagnostics.mypy,
                null_ls.builtins.diagnostics.ruff,
                --null_ls.builtins.completion.spell,
            },
        })
    end,
}
