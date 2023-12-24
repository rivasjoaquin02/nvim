return {
    {
        "2nthony/vitesse.nvim",
        dependencies = {
            "tjdevries/colorbuddy.nvim"
        },
    },
    --replaces the UI for messages, cmdline and the popupmenu.
    {
        "folke/noice.nvim",
        dependencies = { { "MunifTanjim/nui.nvim" }, { "rcarriga/nvim-notify" }, { "nvim-lua/plenary.nvim" } },
    },
    --statusline
    { "nvim-lualine/lualine.nvim" },
}
