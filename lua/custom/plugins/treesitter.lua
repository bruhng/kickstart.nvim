return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    local parsers = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim',
      'vimdoc', 'xml' }
    pcall(require('nvim-treesitter').install, parsers)

    local group = vim.api.nvim_create_augroup('treesitter-minimal', { clear = true })
    local not_supported = { 'TelescopeResults', 'TelescopePrompt', 'fidget', 'blink-cmp-menu', 'mason', 'neo-tree' }
    vim.api.nvim_create_autocmd('FileType', {
      group = group,
      callback = function(event)
        local lang = vim.bo[event.buf].filetype
        if not vim.tbl_contains(not_supported, lang) then
          pcall(require('nvim-treesitter').install, lang)
          pcall(vim.treesitter.start, event.buf)
        end
      end,
    })
  end,
}
