-- Enable automatic indentation
vim.opt.autoindent = true
vim.opt.smartindent = true

-- C-style indentation (works for C++)
vim.opt.cindent = true

-- Configure how indentation behaves with braces
vim.opt.cinkeys = '0{,0},0),0],:,0#,!^F,o,O,e'
vim.opt.cinoptions = {
  '(0', -- Align function arguments
  'W4', -- Indent after unclosed parentheses
  'g0', -- C++ scope declarations (public:, private:)
  'N-s', -- Indent inside namespaces
}

-- Use 4 spaces instead of tabs for C++ files
vim.opt_local.expandtab = true -- Convert tabs to spaces
vim.opt_local.shiftwidth = 4 -- Number of spaces for each indent
vim.opt_local.tabstop = 4 -- Number of spaces a <Tab> counts for
vim.opt_local.softtabstop = 4 -- Number of spaces inserted for <Tab>
