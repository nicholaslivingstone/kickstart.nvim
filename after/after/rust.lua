-- Persist runnable args per project (cwd)
local M = {}
M.store = vim.g.rust_runnable_args_by_cwd or {}
vim.g.rust_runnable_args_by_cwd = M.store

local function key_for_cwd()
  return vim.loop.cwd() or '_global'
end

local function get_args()
  local k = key_for_cwd()
  return M.store[k]
end

local function set_args(args)
  local k = key_for_cwd()
  M.store[k] = args
end

local function clear_args()
  local k = key_for_cwd()
  M.store[k] = nil
end

-- Helpers: prompt for args and split on whitespace
local function prompt_for_args(default)
  local default_str = default and table.concat(default, ' ') or ''
  local input = vim.fn.input('Args: ', default_str)
  if input == nil then
    return nil
  end
  local out = {}
  for a in string.gmatch(input, '%S+') do
    table.insert(out, a)
  end
  return out
end

-- Keymaps:
-- <F5> -> run last runnable using persisted args if present, else bang=true (re-run last)
vim.keymap.set('n', '<F5>', function()
  local args = get_args()
  if args and #args > 0 then
    -- Use the previous runnable, but override its args
    -- (strings are passed as args; bang=true tells it to re-use the last runnable)
    local cmd = { 'runnables', bang = true }
    for _, a in ipairs(args) do
      table.insert(cmd, a)
    end
    vim.cmd.RustLsp(cmd)
  else
    -- No saved args: just re-run the previous runnable as-is
    vim.cmd.RustLsp { 'runnables', bang = true }
  end
end, { desc = 'Rust: Run last runnable (persisted args if any)', silent = true })

-- <leader>rr -> open runnables picker
vim.keymap.set('n', '<leader>rr', function()
  vim.cmd.RustLsp { 'runnables' }
end, { desc = 'Rust: Open runnables picker', silent = true })

-- <leader>ra -> prompt for args, save them, and run using those args
vim.keymap.set('n', '<leader>ra', function()
  local new_args = prompt_for_args(get_args())
  if not new_args then
    return
  end
  set_args(new_args)
  local cmd = { 'runnables', bang = true }
  for _, a in ipairs(new_args) do
    table.insert(cmd, a)
  end
  vim.cmd.RustLsp(cmd)
end, { desc = 'Rust: Run with custom args (persist)', silent = true })

-- <leader>rA -> clear persisted args for this project
vim.keymap.set('n', '<leader>rA', function()
  clear_args()
  vim.notify('Rust runnable args cleared for ' .. key_for_cwd(), vim.log.levels.INFO)
end, { desc = 'Rust: Clear persisted args', silent = true })
