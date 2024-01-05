return {
    {
        "2nthony/vitesse.nvim",
        priority = 1000,
        lazy = false,
        config = function()
            require("vitesse").setup({
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
            })

            vim.cmd([[colorscheme vitesse]])
        end,
        dependencies = {
            "tjdevries/colorbuddy.nvim",
        },
    },
    {
        "rebelot/kanagawa.nvim",
        config = function()
            -- Default options:
            require("kanagawa").setup({
                compile = false,  -- enable compiling the colorscheme
                undercurl = true, -- enable undercurls
                commentStyle = { italic = true },
                functionStyle = {},
                keywordStyle = { italic = true },
                statementStyle = { bold = true },
                typeStyle = {},
                transparent = false,   -- do not set background color
                dimInactive = false,   -- dim inactive window `:h hl-NormalNC`
                terminalColors = true, -- define vim.g.terminal_color_{0,17}
                colors = {             -- add/modify theme and palette colors
                    palette = {},
                    theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
                },
                overrides = function(colors) -- add/modify highlights
                    return {}
                end,
                theme = "wave",    -- Load "wave" theme when 'background' option is not set
                background = {     -- map the value of 'background' option to a theme
                    dark = "wave", -- try "dragon" !
                    light = "lotus",
                },
            })

            -- setup must be called before loading
            --vim.cmd("colorscheme kanagawa-dragon")
        end,
    },
}
