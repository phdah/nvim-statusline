local CBUFF = {}

CBUFF.nvim_Cbuffer_number = function(number)
  local buffer = vim.fn.getbufinfo({buflisted = 1})[number].bufnr
  return buffer
end

return CBUFF
