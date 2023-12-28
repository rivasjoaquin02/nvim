return {
    "VonHeikemen/lsp-zero.nvim",
    event = "VeryLazy",
    config = function()
        local lsp = require('lsp-zero')
        lsp.preset("recommended")

        -- disable defaults mappings
        --lsp.set_preferences({ set_lsp_keymaps = false })
        --
        lsp.on_attach(function(_, bufnr)
            lsp.default_keymaps({ buffer = bufnr })
        end)

        lsp.format_on_save({
            format_opts = {
                async = false,
                timeout_ms = 10000,
            },
            servers = {
                ['clangd'] = { 'c', 'cpp' },
            }
        })

        lsp.set_sign_icons({
            error = '✘',
            warn = '▲',
            hint = '⚑',
            info = '»'
        })

        lsp.setup()
    end,
    dependencies = {
        -- LSP servers manager
        {
            "neovim/nvim-lspconfig",
            event = "VeryLazy",
            config = function()
                local lspconfig = require("lspconfig")
                lspconfig.lua_ls.setup({})
                lspconfig.tsserver.setup({})
                lspconfig.pyright.setup({})

                vim.api.nvim_create_autocmd('LspAttach', {
                    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
                    callback = function(ev)
                        -- Enable completion triggered by <c-x><c-o>
                        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                        -- Buffer local mappings.
                        -- See `:help vim.lsp.*` for documentation on any of the below functions
                        local opts = { buffer = ev.buf }
                        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
                        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
                        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
                        vim.keymap.set('n', '<space>wl', function()
                            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                        end, opts)
                        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
                        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
                        vim.keymap.set({ 'n', 'v' }, '<space>.', vim.lsp.buf.code_action, opts)
                        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                        vim.keymap.set('n', '<space>f', function()
                            vim.lsp.buf.format { async = true }
                        end, opts)
                    end
                })
            end
        },
        -- LSP Support
        {
            "williamboman/mason.nvim",
            event = "VeryLazy",
            config = function()
                require('mason').setup({
                    ui = {
                        icons = {
                            package_installed = "✓",
                            package_pending = "➜",
                            package_uninstalled = "✗"
                        }
                    },
                })
            end
        },
        {
            "williamboman/mason-lspconfig.nvim",
            event = "VeryLazy",
            config = function()
                local lsp = require("lsp-zero")
                lsp.extend_lspconfig()

                require("mason-lspconfig").setup {
                    handlers = {
                        lsp.default_setup,
                        lua_ls = function()
                            local lua_opts = lsp.nvim_lua_ls()
                            require("lspconfig").lua_ls.setup(lua_opts)
                        end
                    },
                    ensure_installed = {
                        "lua_ls",
                        "clangd",
                        "tsserver",
                        "eslint",
                        "pyright",
                        "html",
                        "cssls",
                        "astro",
                        "dockerls",
                        "docker_compose_language_service",
                        "tailwindcss",
                    }
                }
            end
        },
        -- Autocompletion
        {
            "hrsh7th/nvim-cmp",
            event = "VeryLazy",
            config = function()
                local cmp = require('cmp')
                cmp.setup({
                    window = {
                        completion = cmp.config.window.bordered(),
                        documentation = cmp.config.window.bordered(),
                    },
                    snippet = {
                        -- REQUIRED - you must specify a snippet engine
                        expand = function(args)
                            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                            -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
                            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
                        end,
                    },
                    mapping = cmp.mapping.preset.insert({
                        ['<C-Space>'] = cmp.mapping.complete(),
                        ['<C-f>'] = cmp.mapping.scroll_docs(4),
                        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                        ['<C-e>'] = cmp.mapping.abort(),
                        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                        --["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
                        --["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
                    }),
                    sources = cmp.config.sources({
                        { name = 'nvim_lsp' },
                        { name = 'vsnip' }, -- For vsnip users.
                        -- { name = 'luasnip' }, -- For luasnip users.
                        -- { name = 'ultisnips' }, -- For ultisnips users.
                        -- { name = 'snippy' }, -- For snippy users.
                    }, {
                        { name = 'buffer' },
                    })
                })
                -- Set up lspconfig.
                local capabilities = require('cmp_nvim_lsp').default_capabilities()
                -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
                require('lspconfig')['lua_ls'].setup {
                    capabilities = capabilities
                }
            end,
            dependencies = {
                { "hrsh7th/cmp-buffer",   event = "VeryLazy" },
                { "hrsh7th/cmp-path",     event = "VeryLazy" },
                { "hrsh7th/cmp-nvim-lsp", event = "VeryLazy" },
                { "hrsh7th/cmp-nvim-lua", event = "VeryLazy" },
            }
        },
        -- icons to lsp
        { "onsails/lspkind.nvim",              event = "VeryLazy" },
        -- debugging
        { "mfussenegger/nvim-dap",             event = "VeryLazy" },
        { "rcarriga/nvim-dap-ui",              event = "VeryLazy" },
        { "theHamsta/nvim-dap-virtual-text",   event = "VeryLazy" },
        { "nvim-telescope/telescope-dap.nvim", event = "VeryLazy" },
        { "jay-babu/mason-nvim-dap.nvim",      event = "VeryLazy" },
        -- UI
        { "j-hui/fidget.nvim",                 config = true,     event = "VeryLazy" },
    },
}
