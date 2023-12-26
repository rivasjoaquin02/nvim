local lsp = require('lsp-zero').preset("recommended")
lsp.extend_lspconfig()

lsp.on_attach(function(_, bufnr)
    local opts = { buffer = bufnr, remap = false, silent = true }

    vim.keymap.set("n", "<leader>.", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)

    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, opts)
    vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
    vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end)

lsp.format_mapping("<leader>m", {
    format_opts = {
        async = false,
        timeout_ms = 10000,
    },
    servers = {
        ["rust_analyzer"] = { "rust" },
        ["gopls"] = { "go" },
        ["pylsp"] = { "python" },
        ["clangd"] = { "cpp", "c" },
        ["null-ls"] = {
            "lua",
            "json",
            "javascript",
            "typescript",
            "typescriptreact",
            "markdown",
            "css",
            "sass",
            "scss",
            "txt",
            "text",
            "html",
            "tex",
            "plaintex",
        },
    },
})


-- Fix Undefined global 'vim'
lsp.configure('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        },
    },
})

lsp.format_on_save({
    format_opts = {
        async = false,
        timeout_ms = 10000,
    },
    servers = {
        ['oxlint'] = { 'javascript', 'typescript' },
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

require("mason-nvim-dap").setup({
    ensure_installed = { "python", "cpp" },
    automatic_installation = true,
    handlers = {
        function(config) require("mason-nvim-dap").default_setup(config) end,
    },
})

require('mason').setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    },
})

require('mason-lspconfig').setup({
    handlers = {
        lsp.default_setup,
    },
    ensure_installed = {
        --lua
        "lua_ls",
        --c,cpp
        "clangd",
        --ts,js,tsx,jsx
        "tsserver",
        "eslint",
        --py
        "pyright",
        --md
        "marksman",
        "tailwindcss",
        "astro",
        "dockerls",
        "docker_compose_language_service",
        "html",
        "cssls",
        --astro
        --"astro-language-server",
        "jsonls",
        --bash
        "bashls"
    }
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

local lspkind = require("lspkind")
cmp.setup({
    performance = {
        debounce = 0,
        throttle = 0,
        confirm_resolve_timeout = 0,
    },
    preselect = "Item",
    snippet = {
        expand = function(args) require("luasnip").lsp_expand(args.body) end,
    },
    sources = { { name = "nvim_lsp" }, { name = "luasnip" }, { name = "nvim_lua" } },
    view = {},
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = lsp.defaults.cmp_mappings({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
    }),
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol',       -- show only symbol annotations
            maxwidth = 50,         -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)

            -- The function below will be called before any actual modifications from lspkind
            -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
            before = function(entry, vim_item)
                vim_item.kind = lspkind.presets.default[vim_item.kind]
                vim_item.menu = ({
                    nvim_lsp = "[LSP]",
                    look = "[Dict]",
                    buffer = "[Buffer]",
                })[entry.source.name]

                vim_item.kind, vim_item.menu = vim_item.menu, vim_item.kind
                return vim_item
            end
        })
    }
})


vim.diagnostic.config({
    virtual_text = true
})


require("mason-null-ls").setup({
    ensure_installed = nil,
    automatic_installation = false,
    handlers = {},
})
