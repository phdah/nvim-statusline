CBUFF = {}

CBUFF.nvim_Cbuffer_number = function(number)
  local idx = tonumber(number)  -- Convert the string argument to a number
  if idx then
    local buffer = vim.fn.getbufinfo({buflisted = 1})[idx]
    if buffer and buffer.bufnr then
      vim.api.nvim_set_current_buf(buffer.bufnr)
    end
  end
end

vim.cmd("command! -nargs=1 Cbuffernumber lua CBUFF.nvim_Cbuffer_number(<args>)")
