return {
    -- lsp
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'neovim/nvim-lspconfig',            event = "VeryLazy" },
    { 'VonHeikemen/lsp-zero.nvim',        branch = 'v3.x' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/nvim-cmp' },
    { 'L3MON4D3/LuaSnip' },
    -- debugging
    { 'mfussenegger/nvim-dap' },
    {
        'rcarriga/nvim-dap-ui',
        event = "VeryLazy",
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            dapui.setup()
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end
    },
    {
        'jay-babu/mason-nvim-dap.nvim',
        dependencies = { "williamboman/mason.nvim", "mfussenegger/nvim-dap" },
        event = "VeryLazy",
        opts = { handlers = {} }
    },
    -- linters
    { 'mfussenegger/nvim-lint' },
    -- formatters
    { 'mhartington/formatter.nvim' },
}
