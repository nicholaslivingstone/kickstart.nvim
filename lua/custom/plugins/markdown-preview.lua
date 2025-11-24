return {
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    build = ':call mkdp#util#install()',
    init = function()
      vim.g.mkdp_filetypes = { 'markdown' }
      vim.g.mkdp_browser = 'C:\\Program Files\\BraveSoftware\\Brave-Browser\\Application\\brave.exe'
    end,
    ft = { 'markdown' },
    keys = {
      { '<leader>mp', '<Plug>MarkdownPreviewToggle', desc = 'Preview Toggle' },
      { '<leader>ms', '<Plug>MarkdownPreview', desc = 'Preview Start' },
      { '<leader>mq', '<Plug>MarkdownPreviewStop', desc = 'Preview Stop' },
    },
    require('which-key').add {
      { '<leader>m', group = 'Markdown' },
    },
  },
}
