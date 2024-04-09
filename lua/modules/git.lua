local M = {}

M.nvim_StatuslineGit = function()
    local branchname = vim.fn.system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
    return #branchname > 0 and ' Branch: ' .. branchname .. ' ' or ''
end

return M
