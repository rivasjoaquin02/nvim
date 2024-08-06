-- Neovim plugin for automatically highlighting other uses of the word under
-- the cursor using either LSP, Tree-sitter, or regex matching.
return {
    'RRethy/vim-illuminate',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = {
        -- providers: provider used to get references in the buffer, ordered by priority
        providers = {
            'treesitter',
            'lsp',
            'regex',
        },
        -- delay: delay in milliseconds
        delay = 100,
        -- filetype_overrides: filetype specific overrides.
        -- The keys are strings to represent the filetype while the values are tables that
        -- supports the same keys passed to .configure except for filetypes_denylist and filetypes_allowlist
        filetype_overrides = {},
        -- filetypes_denylist: filetypes to not illuminate, this overrides filetypes_allowlist
        filetypes_denylist = { 'dirbuf', 'dirvish', 'fugitive' },
        -- under_cursor: whether or not to illuminate under the cursor
        under_cursor = true,
    },
    config = function(_, opts)
        require('illuminate').configure(opts)

        local function map(key, dir, buffer)
            vim.keymap.set('n', key, function()
                require('illuminate')['goto_' .. dir .. '_reference'](false)
            end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. ' Reference', buffer = buffer })
        end

        vim.api.nvim_create_autocmd('FileType', {
            callback = function()
                local buffer = vim.api.nvim_get_current_buf()
                map(']]', 'next', buffer)
                map('[[', 'prev', buffer)
            end,
        })
    end,
    keys = {
        { ']w', desc = 'Next Reference' },
        { '[w', desc = 'Prev Reference' },
    },
}
