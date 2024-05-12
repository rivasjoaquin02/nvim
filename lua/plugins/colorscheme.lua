return {
    {
        'https://github.com/JoshPorterDev/nvim-base16',
        priority = 1000,
        init = function()
            vim.cmd.colorscheme 'base16-ayu-dark'
        end,
    },
    {
        '2nthony/vitesse.nvim',
        priority = 1000,
        enabled = false,
        init = function()
            vim.cmd.colorscheme 'vitesse'

            -- You can configure highlights by doing something like:
            vim.cmd.hi 'Comment gui=none'
        end,
        dependencies = {
            'tjdevries/colorbuddy.nvim',
        },
        opts = {
            comment_italics = true,
            transparent_background = true,
            transparent_float_background = true, -- aka pum(popup menu) background
            reverse_visual = false,
            dim_nc = false,
            cmp_cmdline_disable_search_highlight_group = false, -- disable search highlight group for cmp item
            -- if `transparent_float_background` false, make telescope border color same as float background
            telescope_border_follow_float_background = false,
            -- similar to above, but for lspsaga
            lspsaga_border_follow_float_background = false,
            -- diagnostic virtual text background, like error lens
            diagnostic_virtual_text_background = false,

            -- override the `lua/vitesse/palette.lua`, go to file see fields
            colors = {},
            themes = {},
        },
    },
}
