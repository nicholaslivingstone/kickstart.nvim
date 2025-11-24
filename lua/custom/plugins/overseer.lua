return {
  'stevearc/overseer.nvim',
  opts = {
    templates = { 'builtin' },
    dap = false,
  },
  cmd = { 'OverseerRun', 'OverseerToggle', 'OverseerInfo' },
  keys = {
    { '<leader>or', '<cmd>OverseerRun<cr>', desc = 'Run task' },
    { '<leader>ot', '<cmd>OverseerToggle<cr>', desc = 'Toggle task list' },
    { '<leader>oi', '<cmd>OverseerInfo<cr>', desc = 'Overseer Info' },
  },
}
