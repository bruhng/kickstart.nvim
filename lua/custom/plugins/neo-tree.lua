-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
    {
      '<leader>tn',
      function()
        require('custom.shorten').toggle()
      end,
      desc = '[t]oggle short [n]amespace dirs',
    },
  },
  opts = {
    filesystem = {
      components = {
        name = function(config, node, state)
          local result = require('neo-tree.sources.common.components').name(config, node, state)
          if node.type == 'directory' and type(result) == 'table' and result.text then
            result.text = require('custom.shorten').shorten_dir(result.text)
          end
          return result
        end,
      },
      window = {
        mappings = {
          ['\\'] = 'close_window',
        },
      },
    },
  },
}
