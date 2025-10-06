return {
  'mrcjkb/rustaceanvim',
  version = '^6', -- Recommended
  lazy = false, -- This plugin is already lazy
  ft = { 'rust' },
  config = function()
    -- Persist runnable args per project (cwd)
    local store = {}
    local function key_for_cwd()
      return vim.loop.cwd() or '_global'
    end
    local function get_args()
      return store[key_for_cwd()]
    end
    local function set_args(args)
      store[key_for_cwd()] = args
    end
    local function clear_args()
      store[key_for_cwd()] = nil
    end

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

    -- F5: run last runnable, using args if any
    vim.keymap.set('n', '<F5>', function()
      local args = get_args()
      if args and #args > 0 then
        local cmd = { 'runnables', bang = true }
        vim.list_extend(cmd, args)
        vim.cmd.RustLsp(cmd)
      else
        vim.cmd.RustLsp { 'runnables', bang = true }
      end
    end, { desc = 'Rust: Run last runnable', silent = true, buffer = true })

    -- <leader>rr: open runnables picker
    vim.keymap.set('n', '<leader>rr', function()
      vim.cmd.RustLsp { 'runnables' }
    end, { desc = 'Rust: Open runnables window', silent = true, buffer = true })

    -- <leader>ra: prompt for args, save, run
    vim.keymap.set('n', '<leader>ra', function()
      local new_args = prompt_for_args(get_args())
      if not new_args then
        return
      end
      set_args(new_args)
      local cmd = { 'runnables', bang = true }
      vim.list_extend(cmd, new_args)
      vim.cmd.RustLsp(cmd)
    end, { desc = 'Rust: Runnables with args', silent = true, buffer = true })

    -- <leader>rA: clear args
    vim.keymap.set('n', '<leader>rA', function()
      clear_args()
      vim.notify('Rust runnable args cleared for ' .. key_for_cwd(), vim.log.levels.INFO)
    end, { desc = 'Rust: Clear persisted args', silent = true, buffer = true })
  end,
}
