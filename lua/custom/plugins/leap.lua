return {
  'andyg/leap.nvim',
  url = 'https://codeberg.org/andyg/leap.nvim',
  dependencies = {
    'tpope/vim-repeat',
  },
  config = function()
    require 'leap'
    vim.keymap.set({ 'n', 'x', 'o' }, 's', '<Plug>(leap)')
    vim.keymap.set('n', 'S', '<Plug>(leap-from-window)')
  end,
}
