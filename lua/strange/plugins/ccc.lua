return {
    "uga-rosa/ccc.nvim",
    lazy = true,
    keys = {
        { "<leader>cp", "<Cmd>CccPick<CR>",              desc = "[C]olor [P]ick" },
        { "<leader>ct", "<Cmd>CccHighlighterToggle<CR>", desc = "[C]olor [T]oogle" },
        { "<leader>cv", "<Cmd>CccConvert<CR>",           desc = "[C]olor [C]onverter" },
    },
    config = function()
        require("ccc").setup({
            highlighter = {
                auto_enable = true,
                lsp = true,
            },
        })
    end
}
