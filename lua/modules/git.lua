local M = {}

M.nvim_StatuslineGit = function(gitEngine)
    local branchname = ""
    if gitEngine == "gitsigns" then
        branchname = vim.b.gitsigns_head or ""
    else
        branchname = vim.fn.system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
    end
    return #branchname > 0 and ' Branch: ' .. branchname .. ' ' or ''
end

M.nvim_GitStatus = function(gitEngine)
    if gitEngine == "gitsigns" then
        local amr = vim.b.gitsigns_status or ''
        return #amr > 0 and string.format(' | %s ', amr) or ''
    elseif gitEngine == "gitgutter" then
        local a, m, r = unpack(vim.fn.GitGutterGetHunkSummary())
        return string.format(' | +%d ~%d -%d ', a, m, r)
    end

    return ""

end

return M
