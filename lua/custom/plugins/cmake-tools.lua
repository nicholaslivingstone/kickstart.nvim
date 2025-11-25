return {
  {
    'Civitasv/cmake-tools.nvim',
    dependencies = {
      'folke/which-key.nvim',
      'echasnovski/mini.icons',
    },
    ft = { 'c', 'cpp', 'cmake' },
    config = function()
      local function make_icon(glyph, color)
        return { icon = glyph, hl = 'WhichKeyIcon' .. color }
      end

      require('cmake-tools').setup {
        cmake_executor = {
          name = 'toggleterm',
        },
        cmake_runner = {
          name = 'toggleterm',
        },
      }

      -- Get icon from mini.icons

      -- Register all keymaps and group with which-key
      require('which-key').add {
        { '<leader>cm', group = '[CM]ake', icon = make_icon('', 'orange') },

        -- Generation & Configuration
        { '<leader>cmg', '<cmd>CMakeGenerate<cr>', desc = 'Generate', icon = make_icon('󰒓', 'Blue') },
        { '<leader>cmG', '<cmd>CMakeGenerate!<cr>', desc = 'Clean & Generate', icon = make_icon('󰩹', 'Red') },
        { '<leader>cmx', '<cmd>CMakeGenerate<cr><cmd>CMakeBuild<cr>', desc = 'Configure & Build', icon = make_icon('󱌣', 'Red') },

        -- Building
        { '<leader>cmb', '<cmd>CMakeBuild<cr>', desc = 'Build', icon = make_icon('󰣪', 'Yellow') },
        { '<leader>cmB', '<cmd>CMakeBuild!<cr>', desc = 'Clean & Build', icon = make_icon('󰃢', 'Orange') },
        { '<leader>cmq', '<cmd>CMakeQuickBuild<cr>', desc = 'Quick Build', icon = make_icon('󰉁', 'Yellow') },

        -- Running & Debugging
        { '<leader>cmr', '<cmd>CMakeRun<cr>', desc = 'Run', icon = make_icon('', 'Green') },
        { '<leader>cmR', '<cmd>CMakeQuickRun<cr>', desc = 'Quick Run', icon = make_icon('󰣿', 'Green') },
        { '<leader>cmd', '<cmd>CMakeDebug<cr>', desc = 'Debug', icon = make_icon('󰃤', 'Red') },
        { '<leader>cma', '<cmd>CMakeLaunchArgs<cr>', desc = 'Launch Args', icon = make_icon('󰆍', 'Grey') },

        -- Selection
        { '<leader>cmt', '<cmd>CMakeSelectBuildTarget<cr>', desc = 'Select Build Target', icon = make_icon('󰓾', 'Cyan') },
        { '<leader>cml', '<cmd>CMakeSelectLaunchTarget<cr>', desc = 'Select Launch Target', icon = make_icon('󰑣', 'Purple') },
        { '<leader>cmy', '<cmd>CMakeSelectBuildType<cr>', desc = 'Select Build Type', icon = make_icon('󰉹', 'Cyan') },
        { '<leader>cmp', '<cmd>CMakeSelectConfigurePreset<cr>', desc = 'Select Configure Preset', icon = make_icon('󱚚', 'Blue') },
        { '<leader>cmP', '<cmd>CMakeSelectBuildPreset<cr>', desc = 'Select Build Preset', icon = make_icon('󱚊', 'Blue') },

        -- Testing
        { '<leader>cmT', '<cmd>CMakeRunTest<cr>', desc = 'Run Tests', icon = make_icon('󰙨', 'Purple') },

        -- Utilities
        { '<leader>cmi', '<cmd>CMakeInstall<cr>', desc = 'Install', icon = make_icon('󰇚', 'Green') },
        { '<leader>cmc', '<cmd>CMakeClean<cr>', desc = 'Clean', icon = make_icon('󰆴', 'Orange') },
        { '<leader>cmo', '<cmd>CMakeOpen<cr>', desc = 'Open Build Dir', icon = make_icon('󰝰', 'Yellow') },
        { '<leader>cms', '<cmd>CMakeSettings<cr>', desc = 'Settings', icon = make_icon('󰒓', 'Grey') },
        { '<leader>cmS', '<cmd>CMakeTargetSettings<cr>', desc = 'Target Settings', icon = make_icon('󰢻', 'Grey') },

        -- Stop current job
        { '<leader>cmX', '<cmd>CMakeStop<cr>', desc = 'Stop', icon = make_icon('󰓛', 'Red') },
      }
    end,
  },
}
