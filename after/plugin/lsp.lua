
require("mason-nvim-dap").setup({
    ensure_installed = { "python", "cpp" },
    automatic_installation = true,
    handlers = {
        function(config) require("mason-nvim-dap").default_setup(config) end,
    },
})

require("mason-null-ls").setup({
    ensure_installed = nil,
    automatic_installation = false,
    handlers = {},
})
