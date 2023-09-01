local LIST = {}

LIST.nvim_Buffer_lower = function()
  local bufferinfo = vim.fn.getbufinfo({buflisted = 1})
  local current_buffer = vim.fn.bufnr('%')
  local lower_bound = {}
  local i = 1

  while i <= #bufferinfo and bufferinfo[i].bufnr and bufferinfo[i].bufnr < current_buffer do
    table.insert(lower_bound, i)
    i = i + 1
  end

  return #lower_bound == 0 and '' or ('[' .. table.concat(lower_bound, ", ") .. ']')
end

LIST.nvim_Buffer_upper = function()
  local bufferinfo = vim.fn.getbufinfo({buflisted = 1})
  local current_buffer = vim.fn.bufnr('%')
  local upper_bound = {}
  local i = 1

  while i <= #bufferinfo and bufferinfo[i].bufnr ~= current_buffer do
    i = i + 1
  end

  for j = i+1, #bufferinfo do
    table.insert(upper_bound, j)
  end

  return #upper_bound == 0 and '' or ('[' .. table.concat(upper_bound, ", ") .. ']')
end

LIST.nvim_Buffer_current = function()
  local bufferinfo = vim.fn.getbufinfo({buflisted = 1})
  local current_buffer = vim.fn.bufnr('%')
  local i = 1

  -- Handle case if bufferinfo is empty
  if #bufferinfo == 0 then return "0" end

  -- Check if the first buffer matches
  if bufferinfo[i].bufnr == current_buffer then
    return tostring(i)
  end

  -- Check the subsequent buffers while ensuring we don't go out of bounds
  while i < #bufferinfo and bufferinfo[i].bufnr ~= current_buffer do
    i = i + 1
  end

  -- If the buffer was found, i will be its index; otherwise, i will be greater than #bufferinfo
  if i <= #bufferinfo then
    return tostring(i)
  else
    return "Buffer not found"  -- or any other appropriate error message or value
  end
end

return LIST
