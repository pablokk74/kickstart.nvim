-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    enable_git_status = true,
    filesystem = {
      window = {
        mappings = {
          ['\\'] = 'close_window',
          ['o'] = 'system_open',
        },
      },
      renderers = {
        directory = {
          { 'icon', folder_closed = '📁', folder_open = '📂' },
          { 'name' },
        },
        file = {
          { 'git_status' },
          { 'name' },
        },
      },
    },
    commands = {
      system_open = function(state)
        local node = state.tree:get_node()
        local path = node:get_id()
        -- macOS
        if vim.fn.has 'mac' == 1 then
          vim.fn.jobstart({ 'open', path }, { detach = true })
        -- Linux
        elseif vim.fn.has 'unix' == 1 then
          vim.fn.jobstart({ 'xdg-open', path }, { detach = true })
        -- Windows
        elseif vim.fn.has 'win32' == 1 then
          local p
          local lastSlashIndex = path:match '^.+()\\[^\\]*$'
          if lastSlashIndex then
            p = path:sub(1, lastSlashIndex - 1)
          else
            p = path
          end
          vim.cmd('silent !start explorer ' .. p)
        end
      end,
    },
  },
}
