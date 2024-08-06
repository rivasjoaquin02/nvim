-- File Manager
return {
    "stevearc/oil.nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        columns = { "icon" },
        view_options = { show_hidden = true },
    },
    keys = {
        { "-", "<CMD>Oil<CR>", desc = "Open parent dir" },
    },
}
