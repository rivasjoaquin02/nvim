-- You can use this plugin to run HTTP requests directly in your favourite text editor.
-- install python-pynvim python-requests
return {
    'BlackLight/nvim-http',
    enable = false,
    lazy = true,
    keys = {
        { '<leader>rr', '<Cmd>Http<CR>', desc = '[R]un Http Request' },
        { '<leader>rs', '<Cmd>HttpStop<CR>', desc = 'Stop Http Request' },
    },
}
