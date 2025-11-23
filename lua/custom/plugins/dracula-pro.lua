return {
  {
    dir = vim.fn.stdpath 'data' .. '/site/pack/themes/start/dracula_pro',
    name = 'dracula_pro',
    priority = 1000,
    config = function()
      vim.opt.termguicolors = true
      vim.g.dracula_colorterm = 0
      vim.cmd.colorscheme 'dracula_pro'
    end,
  },
}
