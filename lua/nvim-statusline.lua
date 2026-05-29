require('nvim-statusline.modules.cbuffer')

local M = {}

local _opts = {}

local git = require('nvim-statusline.modules.git')
M.nvim_StatuslineGit = git.nvim_StatuslineGit

local lbuff = require('nvim-statusline.modules.buffer_list')
M.nvim_Buffer_lower = lbuff.nvim_Buffer_lower
M.nvim_Buffer_upper = lbuff.nvim_Buffer_upper
M.nvim_Buffer_current = lbuff.nvim_Buffer_current

local color = require('nvim-statusline.modules.color')

M.render = function()
    local opts = _opts
    local sl = ''

    -- Git and path/file name
    if opts.git then
        sl = sl .. '%#' .. opts.colors.git.color .. '#' .. git.nvim_StatuslineGit()
        sl = sl .. '%#' .. opts.colors.clear.color .. '#'
    end

    -- Filename
    if opts.filename then
        sl = sl .. '%#' .. opts.colors.filename.color .. '# %t%m'
        sl = sl .. '%#' .. opts.colors.clear.color .. '#'
    end

    -- Buffers
    if opts.buffers then
        sl = sl .. '%='
        sl = sl .. lbuff.nvim_Buffer_lower()
        sl = sl .. '%#' .. opts.colors.buffers.color .. '#[ ' .. lbuff.nvim_Buffer_current() .. ' ]'
        sl = sl .. '%#' .. opts.colors.clear.color .. '#'
        sl = sl .. lbuff.nvim_Buffer_upper()
        sl = sl .. '%#' .. opts.colors.clear.color .. '#'
    end

    -- Lines
    if opts.lines then
        local filetype = vim.bo.filetype ~= '' and '[' .. vim.bo.filetype .. ']' or ''
        local encoding = vim.bo.fileencoding ~= '' and vim.bo.fileencoding or vim.o.encoding
        local fileformat = vim.bo.fileformat
        local lnum = vim.fn.line('.')
        local col = vim.fn.col('.')
        local total = vim.fn.line('$')
        local pct = total > 0 and math.floor(lnum / total * 100) or 0

        sl = sl .. '%='
        sl = sl .. '%#' .. opts.colors.lines.color .. '# '
            .. filetype .. ' ' .. encoding .. '[' .. fileformat .. '] '
            .. pct .. '%% ' .. lnum .. ':' .. col
    end

    -- Clear all colors
    sl = sl .. '%#' .. opts.colors.clear.color .. '#'

    return sl
end

M.setup = function(user_opts)
    -- Set default values if not provided
    user_opts = user_opts or {}  -- ensure user_opts is a table

    -- All defaults to true
    if user_opts.enable == nil then user_opts.enable = true end

    if user_opts.enable then
        if user_opts.git == nil then user_opts.git = true end
        if user_opts.filename == nil then user_opts.filename = true end
        if user_opts.buffers == nil then user_opts.buffers = true end
        if user_opts.file_format == nil then user_opts.file_format = true end
        if user_opts.lines == nil then user_opts.lines = true end
        if user_opts.keymaps == nil then user_opts.keymaps = true end

        -- Set default colors
        user_opts.colors = color.set_colors(user_opts)

        -- Store opts for render()
        _opts = user_opts

        -- Set statusline via a single Lua render function
        vim.o.statusline = "%{%v:lua.require('nvim-statusline').render()%}"

        -- Buffer control related to nvim_Cbuffer_number
        if user_opts.keymaps then
            for i = 1, 9 do
                vim.keymap.set('n', '<leader>' .. i, ':Cbuffernumber ' .. i .. '<CR>', { noremap = true, silent = true })
            end
        end
    end
end

return M
