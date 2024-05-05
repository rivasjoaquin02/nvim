-- https://github.com/windwp/nvim-autopairs
-- A super powerful autopair plugin for Neovim that supports multiple characters.
return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  dependencies = { 'hrsh7th/nvim-cmp' },
  opts = {
    disable_filetype = { 'TelescopePrompt', 'vim' },
  },
}
