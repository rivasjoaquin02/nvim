return {
    "folke/noice.nvim",
    event = "VeryLazy",
    enabled = true,
    dependencies = { "MunifTanjim/nui.nvim" },
    config = function()
        require("noice").setup({
            cmdline = {
                backend = "popup",
                position = {
                    row = "50%",
                    col = "50%",
                },
                format = {
                    search_and_replace = {
                        kind = "replace",
                        pattern = "^:%%?s/",
                        icon = " ",
                        lang = "regex",
                    },
                    search_and_replace_range = {
                        kind = "replace",
                        pattern = "^:'<,'>%%?s/",
                        icon = " ",
                        lang = "regex",
                    },
                },
            },
            lsp = {
                -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
            },
            -- you can enable a preset for easier configuration
            presets = {
                bottom_search = true,         -- use a classic bottom cmdline for search
                command_palette = true,       -- position the cmdline and popupmenu together
                long_message_to_split = true, -- long messages will be sent to a split
                inc_rename = false,           -- enables an input dialog for inc-rename.nvim
                lsp_doc_border = false,       -- add a border to hover docs and signature help
            },
            messages = {
                enabled = false,
            },
            notify = {
                enabled = false,
            },
        })
    end,
}
