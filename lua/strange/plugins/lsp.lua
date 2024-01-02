return {
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		config = function()
			local lsp = require("lsp-zero")
			lsp.extend_lspconfig()

			lsp.on_attach(function(_, bufnr)
				local opts = { buffer = bufnr, remap = false }

				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
				vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
				vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
				vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
				vim.keymap.set("n", "<leader>.", vim.lsp.buf.code_action, opts)
				vim.keymap.set("n", "<leader>rr", vim.lsp.buf.references, opts)
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
				vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
			end)

			require("mason").setup({})
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "clangd", "tsserver", "pyright" },
				handlers = {
					lsp.default_setup,
					lua_ls = function()
						local lua_opts = lsp.nvim_lua_ls()
						require("lspconfig").lua_ls.setup(lua_opts)
					end,
				},
			})
		end,
	},
	{ "neovim/nvim-lspconfig" },
	-- lsp server manager
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	-- UI
	{ "j-hui/fidget.nvim", config = true, event = "VeryLazy" },
}
