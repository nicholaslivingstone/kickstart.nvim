return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = true,
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
  },
}
