return {
  {
    'jpalardy/vim-slime',
    init = function()
      vim.g.slime_target = 'tmux'
      vim.g.slime_bracketed_paste = 1
      vim.g.slime_default_config = { socket_name = 'default', target_pane = '{last}' }
      vim.g.slime_no_mappings = true
    end,
    keys = {
      { '<leader>sls', '<Plug>SlimeRegionSend',    mode = 'x', remap = true, desc = 'Send selection' },
      { '<leader>sls', '<Plug>SlimeParagraphSend', mode = 'n', remap = true, desc = 'Send paragraph' },
      { '<leader>sll', '<Plug>SlimeLineSend',      mode = 'n', remap = true, desc = 'Send line' },
      { '<leader>slc', '<Plug>SlimeConfig',        mode = 'n', remap = true, desc = 'Configure target' },
    },
    require('which-key').add {
      { '<leader>sl', group = 'Slime' },
    },
  },
}
