local GIT = {}

GIT.nvim_GitBranch = function()
  return vim.fn.system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
end

GIT.nvim_StatuslineGit = function()
  local branchname = GIT.nvim_GitBranch()
  return #branchname > 0 and ' Branch: ' .. branchname .. ' ' or ''
end

GIT.nvim_GitStatus = function()
  local a, m, r = unpack(vim.fn.GitGutterGetHunkSummary())
  return string.format(' | +%d ~%d -%d ', a, m, r)
end

return GIT
