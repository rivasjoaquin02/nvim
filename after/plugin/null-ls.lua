local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        --formatting
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.clang_format,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.ruff,
        null_ls.builtins.formatting.black,

        --diagnostics
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.diagnostics.ruff,

        --completition
        --null_ls.builtins.completition.spell,
    },
})
