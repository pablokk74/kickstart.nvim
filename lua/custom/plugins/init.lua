-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  --  42-header plugin
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
  --  norminette plugin
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
