local COLOR = {}

COLOR.set_colors = function(user_opts)
    -- Set default colors and potentially create custom highlight groups
    if user_opts.colors == nil then user_opts.colors = {} end

    -- Git color
    if user_opts.colors.git == nil then
        user_opts.colors.git = {}
        user_opts.colors.git.color = "CursorColumn"
    else
        vim.api.nvim_set_hl(0, "CustomGitColor", { bg = user_opts.colors.git.bg, fg = user_opts.colors.git.fg })
        user_opts.colors.git.color = "CustomGitColor"
    end

    -- Filename color
    if user_opts.colors.filename == nil then
        user_opts.colors.filename = {}
        user_opts.colors.filename.color = "LineNr"
    else
        vim.api.nvim_set_hl(0, "CustomFilenameColor", { bg = user_opts.colors.filename.bg, fg = user_opts.colors.filename.fg })
        user_opts.colors.filename.color = "CustomFilenameColor"
    end

    -- Buffers color
    if user_opts.colors.buffers == nil then
        user_opts.colors.buffers = {}
        user_opts.colors.buffers.color = "CursorColumn"
    else
        vim.api.nvim_set_hl(0, "CustomBuffersColor", { bg = user_opts.colors.buffers.bg, fg = user_opts.colors.buffers.fg })
        user_opts.colors.buffers.color = "CustomBuffersColor"
    end

    -- Lines color
    if user_opts.colors.lines == nil then
        user_opts.colors.lines = {}
        user_opts.colors.lines.color = "CursorColumn"
    else
        vim.api.nvim_set_hl(0, "CustomLinesColor", { bg = user_opts.colors.lines.bg, fg = user_opts.colors.lines.fg })
        user_opts.colors.lines.color = "CustomLinesColor"
    end

    -- Clear color
    if user_opts.colors.clear == nil then
        user_opts.colors.clear = {}
        user_opts.colors.clear.color = "LineNr"
    else
        vim.api.nvim_set_hl(0, "CustomClearColor", { bg = user_opts.colors.clear.bg, fg = user_opts.colors.clear.fg })
        user_opts.colors.clear.color = "CustomClearColor"
    end

    return user_opts.colors
end

return COLOR
