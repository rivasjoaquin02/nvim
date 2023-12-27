return {
	"mbbill/undotree",
	"github/copilot.vim",

	-- nice to have
	{ "numToStr/Comment.nvim" },
	{ "windwp/nvim-autopairs" },
	{ "windwp/nvim-ts-autotag" },
	{ "JoosepAlviste/nvim-ts-context-commentstring" },
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	{ "nvim-treesitter/nvim-treesitter-context" },
	{ "ThePrimeagen/refactoring.nvim" },

	-- navigation
	{
		"kyazdani42/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},
	{ "ThePrimeagen/harpoon", branch = "harpoon2" },
	{ "nvim-telescope/telescope.nvim" },
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	{ "simrat39/symbols-outline.nvim" },

	-- git
	{ "kdheepak/lazygit.nvim" },
	{ "lewis6991/gitsigns.nvim" },

	-- Debugging
	{ "mfussenegger/nvim-dap" },
	{ "rcarriga/nvim-dap-ui" },
	{ "theHamsta/nvim-dap-virtual-text" },
	{ "nvim-telescope/telescope-dap.nvim" },

	-- misc
	{ "kevinhwang91/nvim-bqf", ft = "qf" },
	{ "mbbill/undotree" },
	{ "uga-rosa/ccc.nvim" },
	{
		"kristijanhusak/vim-dadbod-ui",
		dependencies = {
			{ "tpope/vim-dadbod", lazy = true },
			{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
		},
		cmd = {
			"DBUI",
			"DBUIToggle",
			"DBUIAddConnection",
			"DBUIFindBuffer",
		},
		init = function()
			vim.g.db_ui_use_nerd_fonts = 1
		end,
	},
}
