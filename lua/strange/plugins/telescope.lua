return {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    version = false,
    lazy = true,
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "jvgrootveld/telescope-zoxide" },
        { "nvim-telescope/telescope-ui-select.nvim" },
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        { "nvim-telescope/telescope-dap.nvim" },
    },
    keys = {
        { "<C-p>",      ":Telescope git_files<CR>",  desc = "Search the files tracked by git" },
        { "<leader>pf", ":Telescope find_files<CR>", desc = "Search all files" },
        { "<leader>b",  ":Telescope buffers<CR>",    desc = "[b]uffers" },
        {
            "<leader>ps",
            function()
                require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
            end,
            desc = "Grep Search",
        },
    },
    config = function()
        require("telescope").setup({
            defaults = {
                layout_config = {
                    width = 0.85,
                    preview_cutoff = 120,
                    horizontal = {
                        preview_width = function(_, cols, _)
                            if cols < 120 then
                                return math.floor(cols * 0.5)
                            end
                            return math.floor(cols * 0.6)
                        end,
                        mirror = false,
                    },
                    vertical = { mirror = false },
                },
                vimgrep_arguments = {
                    "rg",
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                    "--smart-case",
                    "--hidden",
                },
                file_ignore_patterns = {
                    "node_modules/",
                    "%.git/",
                    "%.DS_Store$",
                    "target/",
                    "build/",
                    "%.o$",
                },
                winblend = 0,
                border = {},
                borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
                color_devicons = true,
                set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
            },
            pickers = {
                find_files = { hidden = true },
                live_grep = {
                    -- @usage don't include the filename in the search results
                    only_sort_text = true,
                },
            },
            extensions = {
                fzf = {
                    fuzzy = true,                   -- false will only do exact matching
                    override_generic_sorter = true, -- override the generic sorter
                    override_file_sorter = true,    -- override the file sorter
                    case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
                },
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown({}),
                },
            },
        })

        require("telescope").load_extension("fzf")
        require("telescope").load_extension("ui-select")
        require("telescope").load_extension("refactoring")
        require("telescope").load_extension("dap")
        require("telescope").load_extension("zoxide")
    end,
}
