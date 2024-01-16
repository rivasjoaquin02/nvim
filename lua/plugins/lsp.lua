return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        { "williamboman/mason.nvim",          config = true },
        { "williamboman/mason-lspconfig.nvim" },
        { "j-hui/fidget.nvim",                opts = {} },
        { "folke/neodev.nvim" },
        { "b0o/schemastore.nvim" },
        { "hrsh7th/cmp-nvim-lsp" },
    },
    config = function()
        local icons = require("config.icons")

        require("mason").setup({
            ui = {
                border = "rounded",
                icons = {
                    package_installed = icons.ui.BoxChecked,
                    package_pending = icons.misc.Watch,
                    package_uninstalled = icons.diagnostics.Error,
                },
            },
        })
        require("mason-lspconfig").setup({
            ensure_installed = vim.tbl_keys(require("plugins.lsp.servers")),
        })
        require("lspconfig.ui.windows").default_options.border = "single"

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
        capabilities.offsetEncoding = "utf-16"

        local mason_lspconfig = require("mason-lspconfig")
        mason_lspconfig.setup_handlers({
            function(server_name)
                require("lspconfig")[server_name].setup({
                    capabilities = capabilities,
                    on_attach = require("plugins.lsp.on_attach").on_attach,
                    settings = require("plugins.lsp.servers")[server_name],
                    filetypes = (require("plugins.lsp.servers")[server_name] or {}).filetypes,
                })
            end,
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

        local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end
    end,
}
