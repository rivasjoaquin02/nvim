return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  keys = {
    { '<leader>pv', ':Neotree current<CR>', desc = 'Neotree: Current Dir' },
    { '<leader><tab>', ':Neotree toggle right<CR>', desc = 'Neotree: Right File Explorer' },
  },
  opts = {
    close_if_last_window = true,
    enable_git_status = true,
    enable_diagnostics = true,
  },
}
