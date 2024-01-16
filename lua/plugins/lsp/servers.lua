return {
    lua_ls = {
        Lua = {
            telemetry = { enable = false },
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                -- make language server aware of runtime files
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.stdpath("config") .. "/lua"] = true,
                },
            },
        },
    },
    clangd = {
        cmd = {
            "clangd",
            "--background-index",
            "--pch-storage=memory",
            "--clang-tidy",
            "--suggest-missing-includes",
            "--cross-file-rename",
            "--completion-style=detailed",
        },
        init_options = {
            clangdFileStatus = true,
            usePlaceholders = true,
            completeUnimported = true,
            semanticHighlighting = true,
        },
    },
    pyright = {},
    jsonls = {
        settings = {
            json = {
                schema = require("schemastore").json.schemas(),
                validate = { enable = true },
            },
        },
    },
}
