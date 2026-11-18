local M = {}

M.min_segments = 3
M.enabled = true

function M.toggle()
  M.enabled = not M.enabled
  vim.notify('Short namespace dirs: ' .. (M.enabled and 'on' or 'off'))
  local ok, manager = pcall(require, 'neo-tree.sources.manager')
  if ok then
    manager.refresh 'filesystem'
  end
end

function M.shorten_dir(name)
  if not M.enabled then
    return name
  end
  local parts = vim.split(name, '.', { plain = true })
  if #parts >= M.min_segments then
    return parts[#parts]
  end
  return name
end

function M.shorten_path_dirs(path)
  local parts = vim.split(path, '/', { plain = true })
  for i = 1, #parts - 1 do
    parts[i] = M.shorten_dir(parts[i])
  end
  return table.concat(parts, '/')
end

return M
