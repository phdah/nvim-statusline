local M = {}

local git = require('modules/git')
M.nvim_StatuslineGit = git.nvim_StatuslineGit
M.nvim_GitStatus = git.nvim_GitStatus

local cbuff = require('modules/cbuffer')
M.nvim_Cbuffer_number = cbuff.nvim_Cbuffer_number

local lbuff = require('modules/buffer_list')
M.nvim_Buffer_lower = lbuff.nvim_Buffer_lower
M.nvim_Buffer_upper = lbuff.nvim_Buffer_upper
M.nvim_Buffer_current = lbuff.nvim_Buffer_current


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

        -- Git and path/file name
        if user_opts.git then
            vim.o.statusline = '%#CursorColumn#%{v:lua.require("buff-statusline").nvim_StatuslineGit()}%{v:lua.require("buff-statusline").nvim_GitStatus()}%#LineNr#'
        end

        -- Filename
        if user_opts.filename then
            vim.o.statusline = vim.o.statusline .. ' %f%m'
        end

        -- Buffers
        if user_opts.buffers then
            vim.o.statusline = vim.o.statusline .. '%='
            vim.o.statusline = vim.o.statusline .. '%{v:lua.require("buff-statusline").nvim_Buffer_lower()}%#CursorColumn#[ %{v:lua.require("buff-statusline").nvim_Buffer_current()} ]%#LineNr#%{v:lua.require("buff-statusline").nvim_Buffer_upper()}'
        end

        -- File format
        if user_opts.file_format then
            vim.o.statusline = vim.o.statusline .. '%='
        end

        -- Lines
        if user_opts.lines then
            vim.o.statusline = vim.o.statusline .. '%#CursorColumn# %y %{&fileencoding?&fileencoding:&encoding}[%{&fileformat}] %p%% %l:%c'
        end

        -- Buffer control related to nvim_Cbuffer_number
        if user_opts.keymaps then
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

    end

end

return M
