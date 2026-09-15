local default_root = '/home/gustav-j-bruhn/repos/telia/'

local function preserve_encoding()
  local root = vim.g.telia_encoding_root or default_root
  local path = vim.fn.expand '%:p'
  if not vim.startswith(path, root) then
    return
  end
  local f = io.open(path, 'rb')
  if not f then
    return
  end
  local head = f:read(32)
  f:close()
  if not head or #head == 0 then
    return
  end
  local a, b, c = head:byte(1), head:byte(2), head:byte(3)
  vim.bo.bomb = a == 0xEF and b == 0xBB and c == 0xBF
  vim.bo.fileformat = head:find('\r\n', 1, true) and 'dos' or 'unix'
end

local group = vim.api.nvim_create_augroup('telia-preserve-encoding', { clear = true })
vim.api.nvim_create_autocmd({ 'BufReadPost', 'BufNewFile' }, {
  group = group,
  callback = preserve_encoding,
  desc = 'Keep original BOM and line-ending bytes for telia files',
})
vim.api.nvim_create_autocmd('BufWritePre', {
  group = group,
  callback = preserve_encoding,
  desc = 'Restore original BOM and line-ending bytes before saving telia files',
})
