-- beautiful notifications & better command
return {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
        "MunifTanjim/nui.nvim",
        -- 'rcarriga/nvim-notify'
    },
    opts = {
        cmdline = {
            backend = "popup",
            position = {
                row = "50%",
                col = "50%",
            },
            ---@type table<string, CmdlineFormat>
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
                ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
            },
        },
        -- you can enable a preset for easier configuration
        presets = {
            bottom_search = true, -- use a classic bottom cmdline for search
            command_palette = true, -- position the cmdline and popupmenu together
            long_message_to_split = true, -- long messages will be sent to a split
            inc_rename = false, -- enables an input dialog for inc-rename.nvim
            lsp_doc_border = true, -- add a border to hover docs and signature help
        },
        -- Messages shown by lsp servers
        messages = { enabled = true },
        notify = { enabled = false },
    },
}
