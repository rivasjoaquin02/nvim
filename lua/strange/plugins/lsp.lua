return {
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        config = false,
        init = function()
            -- Disable automatic setup, we are doing it manually
            vim.g.lsp_zero_extend_cmp = 0
            vim.g.lsp_zero_extend_lspconfig = 0
        end,
    },
    {
        "neovim/nvim-lspconfig",
        cmd = { "LspInfo", "LspInstall", "LspStart" },
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            { "williamboman/mason-lspconfig.nvim" },
        },
        opts = {
            inlay_hints = { enabled = true },
            ---@type lspconfig.options
            servers = {
                cssls = {},
                tailwindcss = {
                    root_dir = function(...)
                        return require("lspconfig.util").root_pattern(".git")(...)
                    end,
                },
                tsserver = {
                    root_dir = function(...)
                        return require("lspconfig.util").root_pattern(".git")(...)
                    end,
                    single_file_support = false,
                    settings = {
                        typescript = {
                            inlayHints = {
                                includeInlayParameterNameHints = "literal",
                                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                                includeInlayFunctionParameterTypeHints = true,
                                includeInlayVariableTypeHints = false,
                                includeInlayPropertyDeclarationTypeHints = true,
                                includeInlayFunctionLikeReturnTypeHints = true,
                                includeInlayEnumMemberValueHints = true,
                            },
                        },
                        javascript = {
                            inlayHints = {
                                includeInlayParameterNameHints = "all",
                                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                                includeInlayFunctionParameterTypeHints = true,
                                includeInlayVariableTypeHints = true,
                                includeInlayPropertyDeclarationTypeHints = true,
                                includeInlayFunctionLikeReturnTypeHints = true,
                                includeInlayEnumMemberValueHints = true,
                            },
                        },
                    },
                },
                eslint = {
                    filetypes = {
                        "javascript",
                        "javascriptreact",
                        "typescript",
                        "typescriptreact",
                        "astro",
                    },
                    settings = {
                        workingDirectory = { mode = "auto" },
                        format = { enable = true },
                        lint = { enable = true },
                    },
                },
                html = {},
                yamlls = {
                    settings = {
                        yaml = {
                            keyOrdering = false,
                        },
                    },
                },
                lua_ls = {
                    -- enabled = false,
                    single_file_support = true,
                    settings = {
                        Lua = {
                            workspace = {
                                checkThirdParty = false,
                            },
                            completion = {
                                workspaceWord = true,
                                callSnippet = "Both",
                            },
                            misc = {
                                parameters = {
                                    -- "--log-level=trace",
                                },
                            },
                            hint = {
                                enable = true,
                                setType = false,
                                paramType = true,
                                paramName = "Disable",
                                semicolon = "Disable",
                                arrayIndex = "Disable",
                            },
                            doc = {
                                privateName = { "^_" },
                            },
                            type = {
                                castNumberToInteger = true,
                            },
                            diagnostics = {
                                disable = { "incomplete-signature-doc", "trailing-space" },
                                -- enable = false,
                                groupSeverity = {
                                    strong = "Warning",
                                    strict = "Warning",
                                },
                                groupFileStatus = {
                                    ["ambiguity"] = "Opened",
                                    ["await"] = "Opened",
                                    ["codestyle"] = "None",
                                    ["duplicate"] = "Opened",
                                    ["global"] = "Opened",
                                    ["luadoc"] = "Opened",
                                    ["redefined"] = "Opened",
                                    ["strict"] = "Opened",
                                    ["strong"] = "Opened",
                                    ["type-check"] = "Opened",
                                    ["unbalanced"] = "Opened",
                                    ["unused"] = "Opened",
                                },
                                unusedLocalExclude = { "_*" },
                            },
                            format = {
                                enable = false,
                                defaultConfig = {
                                    indent_style = "space",
                                    indent_size = "2",
                                    continuation_indent_size = "2",
                                },
                            },
                        },
                    },
                },
            },
            setup = {},
        },
        config = function()
            local lsp = require("lsp-zero")
            lsp.extend_lspconfig()

            lsp.on_attach(function(_, bufnr)
                lsp.default_keymaps({ buffer = bufnr })
                local opts = { buffer = bufnr, silent = true, remap = false }
                local map = vim.keymap.set

                map("n", "gd", vim.lsp.buf.definition, opts)
                map("n", "K", vim.lsp.buf.hover, opts)
                map("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
                map("n", "<leader>vd", vim.diagnostic.open_float, opts)
                map("n", "[d", vim.diagnostic.goto_next, opts)
                map("n", "]d", vim.diagnostic.goto_prev, opts)
                map("n", "<leader>.", vim.lsp.buf.code_action, opts)
                map("n", "<leader>rr", vim.lsp.buf.references, opts)
                map("n", "<leader>rn", vim.lsp.buf.rename, opts)
                map("i", "<C-h>", vim.lsp.buf.signature_help, opts)
            end)

            require("mason").setup({})
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "clangd",
                    "tsserver",
                    "eslint",
                    "pyright",
                    "tailwindcss",
                },
                handlers = {
                    lsp.default_setup,
                    lua_ls = function()
                        local lua_opts = lsp.nvim_lua_ls()
                        require("lspconfig").lua_ls.setup(lua_opts)
                    end,
                },
            })

            lsp.format_on_save({
                format_opts = { async = false, timeout_ms = 10000 },
                servers = {
                    ["lua_ls"] = { "lua" },
                    ["tsserver"] = { "javascript", "typescript" },
                    ["pyright"] = { "python" },
                    ["clang"] = { "c", "cpp" },
                },
            })

            lsp.set_preferences({ suggest_lsp_servers = false })

            local icons = require("strange.icons")
            lsp.set_sign_icons({
                error = icons.diagnostics.BoldError,
                warn = icons.diagnostics.BoldWarning,
                hint = icons.diagnostics.BoldHint,
                info = icons.diagnostics.BoldInformation,
            })

            vim.diagnostic.config({
                title = false,
                underline = true,
                virtual_text = true,
                signs = true,
                update_in_insert = false,
                severity_sort = true,
                float = {
                    source = "always",
                    style = "minimal",
                    border = "rounded",
                    header = "",
                    prefix = "",
                },
            })

            require("lspconfig").tailwindcss.setup({})

            -- show inline diagnostic in Hover windows
            vim.o.updatetime = 250
            vim.cmd [[autocmd! CursorHold, CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
        end,
    },
    -- lsp server manager
    { "williamboman/mason.nvim", lazy = false,  config = true },
    -- UI
    { "j-hui/fidget.nvim",       config = true, event = "VeryLazy" },
}
