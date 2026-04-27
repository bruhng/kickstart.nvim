local hostname = (vim.uv or vim.loop).os_gethostname()
local copilot_hosts = {
  ACSWDF043647 = true,
}

return {
  'github/copilot.vim',
  enabled = copilot_hosts[hostname] == true,
  config = function()
    vim.g.copilot_no_tab_map = true
    vim.keymap.set('i', '<C-j>', 'copilot#Accept("<CR>")', { expr = true, silent = true, replace_keycodes = false })
  end,
}
