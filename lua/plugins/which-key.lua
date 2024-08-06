-- Useful plugin to show you pending keybinds.
return {
    'folke/which-key.nvim',
    lazy = true,
    event = 'VimEnter', -- Loads which-key before all the UI elements are loaded
    -- Events can be
    -- normal autocommands events (`:help autocmd-events`).
    -- Then, because we use the `config` key, the configuration only runs
    -- after the plugin has been loaded:
    config = function() -- This is the function that runs, AFTER loading
        require('which-key').setup()

        -- Document existing key chains
        require('which-key').add {
            { '<leader>c', '[C]ode' },
            { '<leader>t', '[T]est' },
            { '<leader>d', '[D]ocument' },
            { '<leader>r', '[R]ename' },
            { '<leader>s', '[S]earch' },
            { '<leader>w', '[W]orkspace' },
        }
    end,
}
