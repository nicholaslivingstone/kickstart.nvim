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
    config = function(_, opts)
      require('toggleterm').setup(opts)

      local Terminal = require('toggleterm.terminal').Terminal
      local lazygit = Terminal:new {
        cmd = 'lazygit',
        display_name = ' LazyGit',
        hidden = true,
        direction = 'float',
        close_on_exit = true,
        on_close = function()
          -- Refresh gitsigns after closing lazygit
          vim.defer_fn(function()
            vim.cmd 'silent! Gitsigns refresh'
          end, 100)
        end,
      }

      vim.keymap.set('n', '<leader>g', function()
        lazygit:toggle()
      end, { desc = 'Open LazyGit in Floating Terminal' })
    end,
  },
}
