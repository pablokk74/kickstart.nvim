-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'Diogo-ss/42-header.nvim',
    cmd = { 'Stdheader' },
    keys = { '<F1>' },
    opts = {
      default_map = true,
      auto_update = true,
      user = 'pwacker',
      mail = 'pwacker@student.42heilbronn.de',
    },
    config = function(_, opts)
      require('42header').setup(opts)
    end,
  },
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      vim.opt.termguicolors = true
      vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

      require('nvim-tree').setup {
        view = {
          width = 30,
          side = 'left',
        },
        git = {
          enable = true,
          ignore = false,
          timeout = 500,
        },
        renderer = {
          highlight_git = true,
          group_empty = true,
          icons = {
            show = {
              git = true,
            },
            glyphs = {
              default = '→',
              symlink = '⤴',
              git = {
                unstaged = '✗',
                staged = '✓',
                unmerged = '≠',
                renamed = '➜',
                untracked = '★',
                deleted = '🗑',
                ignored = '◌',
              },
              folder = {
                arrow_open = '▾',
                arrow_closed = '▸',
                default = '📁',
                open = '📂',
                empty = '🗃',
                empty_open = '🗃',
                symlink = '🔗',
                symlink_open = '🔗',
              },
            },
          },
        },
        filters = {
          dotfiles = true,
        },
      }
    end,
  },
  {
    'hardyrafael17/norminette42.nvim',
    config = function()
      local norminette = require 'norminette'
      norminette.setup {
        runOnSave = true,
        maxErrorsToShow = 5,
        active = true,
      }
    end,
  },
  -- Add other plugins here as needed
}
