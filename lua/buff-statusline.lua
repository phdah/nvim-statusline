local M = {}

M.nvim_GitBranch = function()
  return vim.fn.system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
end

M.nvim_StatuslineGit = function()
  local branchname = M.nvim_GitBranch()
  return #branchname > 0 and ' Branch: ' .. branchname .. ' ' or ''
end

M.nvim_GitStatus = function()
  local a, m, r = unpack(vim.fn.GitGutterGetHunkSummary())
  return string.format(' | +%d ~%d -%d ', a, m, r)
end

M.nvim_Cbuffer_number = function(number)
  local buffer = vim.fn.getbufinfo({buflisted = 1})[number].bufnr
  return buffer
end

M.nvim_Buffer_lower = function()
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

M.nvim_Buffer_upper = function()
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

M.nvim_Buffer_current = function()
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

M.setup = function(user_opts)
    -- Git and path/file name
    vim.o.statusline = '%#CursorColumn#%{v:lua.require("buff-statusline").nvim_StatuslineGit()}%{v:lua.require("buff-statusline").nvim_GitStatus()}%#LineNr#'
    vim.o.statusline = vim.o.statusline .. ' %f%m'
    -- Buffers
    vim.o.statusline = vim.o.statusline .. '%='
    vim.o.statusline = vim.o.statusline .. '%{v:lua.require("buff-statusline").nvim_Buffer_lower()}%#CursorColumn#[ %{v:lua.require("buff-statusline").nvim_Buffer_current()} ]%#LineNr#%{v:lua.require("buff-statusline").nvim_Buffer_upper()}'
    -- File format and lines
    vim.o.statusline = vim.o.statusline .. '%='
    vim.o.statusline = vim.o.statusline .. '%#CursorColumn# %y %{&fileencoding?&fileencoding:&encoding}[%{&fileformat}] %p%% %l:%c'

    -- Buffer control related to nvim_Cbuffer_number
    vim.api.nvim_set_keymap('n', '<leader>1', ':lua vim.cmd("b" .. require("buff-statusline").nvim_Cbuffer_number(1))<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>2', ':lua vim.cmd("b" .. require("buff-statusline").nvim_Cbuffer_number(2))<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>3', ':lua vim.cmd("b" .. require("buff-statusline").nvim_Cbuffer_number(3))<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>4', ':lua vim.cmd("b" .. require("buff-statusline").nvim_Cbuffer_number(4))<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>5', ':lua vim.cmd("b" .. require("buff-statusline").nvim_Cbuffer_number(5))<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>6', ':lua vim.cmd("b" .. require("buff-statusline").nvim_Cbuffer_number(6))<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>7', ':lua vim.cmd("b" .. require("buff-statusline").nvim_Cbuffer_number(7))<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>8', ':lua vim.cmd("b" .. require("buff-statusline").nvim_Cbuffer_number(8))<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>9', ':lua vim.cmd("b" .. require("buff-statusline").nvim_Cbuffer_number(9))<CR>', { noremap = true, silent = true })

end

return M
