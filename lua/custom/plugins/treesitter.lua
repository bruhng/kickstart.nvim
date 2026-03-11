return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    local parsers = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc', 'xml' }
    pcall(require('nvim-treesitter').install, parsers)

    local group = vim.api.nvim_create_augroup('treesitter-minimal', { clear = true })
    vim.api.nvim_create_autocmd('FileType', {
      group = group,
      callback = function(event)
        pcall(require('nvim-treesitter').install, vim.bo[event.buf].filetype)
        pcall(vim.treesitter.start, event.buf)
      end,
    })
  end,
}
