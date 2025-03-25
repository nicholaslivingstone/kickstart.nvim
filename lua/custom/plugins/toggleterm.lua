return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    opts = {
      size = 20,
      open_mapping = [[<c-\>]],
      hide_numbers = true,
      shade_terminals = true,
      shading_factor = 2,
      direction = 'float',
      float_opts = {
        border = 'curved',
      },
    },
    init = function()
      local Terminal = require('toggleterm.terminal').Terminal
      local lazygit = Terminal:new {
        cmd = 'lazygit',
        display_name = ' LazyGit',
        hidden = true,
        direction = 'float',
        close_on_exit = true,
      }

      vim.keymap.set('n', '<leader>g', function()
        lazygit:toggle()
      end, { desc = 'Open LazyGit in Floating Terminal' })
    end,
  },
}
