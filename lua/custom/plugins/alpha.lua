return {
  'goolord/alpha-nvim',
  event = 'VimEnter',
  lazy = true,
  opts = function()
    local dashboard = require 'alpha.themes.dashboard'

    local logo = [[
        _,    _   _    ,_
   .o888P     Y8o8Y     Y888o.
  d88888      88888      88888b
 d888888b_  _d88888b_  _d888888b
 8888888888888888888888888888888
 8888888888888888888888888888888
 YJGS8P"Y888P"Y888P"Y888P"Y8888P
  Y888   '8'   Y8P   '8'   888Y
   '8o          V          o8'
     `                     `
                          ]]
    local icons = require 'config.icons'

    dashboard.section.header.val = vim.split(logo, '\n')
    dashboard.section.buttons.val = {
      dashboard.button('f', icons.ui.Search .. ' Find file', ':Telescope find_files <CR>'),
      dashboard.button('n', icons.ui.File .. ' New file', ':ene <BAR> startinsert <CR>'),
      dashboard.button('r', icons.ui.Files .. ' Recent files', ':Telescope oldfiles <CR>'),
      dashboard.button('g', icons.ui.FindText .. ' Find text', ':Telescope live_grep <CR>'),
      dashboard.button('s', icons.ui.BookMark .. ' Restore Session', '<cmd>lua require("persistence").load()<cr>'),
      dashboard.button('c', icons.ui.Settings .. ' Config', ':e ~/.config/nvim/ <CR>'),
      dashboard.button('l', icons.ui.Lazy .. ' Lazy', ':Lazy<CR>'),
      dashboard.button('q', icons.ui.Exit .. ' Quit', ':qa<CR>'),
    }

    -- Disable folding on alpha buffer
    vim.cmd [[ autocmd FileType alpha setlocal nofoldenable ]]

    return dashboard
  end,
  config = function(_, dashboard)
    -- close lazy and re-open when the dashboard is ready
    if vim.o.filetype == 'lazy' then
      vim.cmd.close()
      vim.api.nvim_create_autocmd('User', {
        pattern = 'AlphaReady',
        callback = function()
          require('lazy').show()
        end,
      })
    end

    require('alpha').setup(dashboard.opts)

    vim.api.nvim_create_autocmd('User', {
      pattern = 'LazyVimStarted',
      callback = function()
        local stats = require('lazy').stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        --dashboard.section.footer.val = "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
        dashboard.section.footer.val = string.format('⚡ Neovim loaded %s plugins on %s', stats.count, ms)
        pcall(vim.cmd.AlphaRedraw)
      end,
    })
  end,
}
