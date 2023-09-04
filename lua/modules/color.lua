local COLOR = {}

COLOR.set_colors = function(user_opts)
    -- Set default colors and potentially create custom highlight groups
    if user_opts.colors == nil then user_opts.colors = {} end

    -- Git color
    if user_opts.colors.git == nil then
        user_opts.colors.git = "CursorColumn"
    else
        vim.cmd(string.format("hi CustomGitColor ctermbg=%s", user_opts.colors.git))
        user_opts.colors.git = "CustomGitColor"
    end

    -- Filename color
    if user_opts.colors.filename == nil then
        user_opts.colors.filename = "LineNr"
    else
        vim.cmd(string.format("hi CustomFilenameColor ctermbg=%s", user_opts.colors.filename))
        user_opts.colors.filename = "CustomFilenameColor"
    end

    -- Buffers color
    if user_opts.colors.buffers == nil then
        user_opts.colors.buffers = "CursorColumn"
    else
        vim.cmd(string.format("hi CustomBuffersColor ctermbg=%s", user_opts.colors.buffers))
        user_opts.colors.buffers = "CustomBuffersColor"
    end

    -- Lines color
    if user_opts.colors.lines == nil then
        user_opts.colors.lines = "CursorColumn"
    else
        vim.cmd(string.format("hi CustomLinesColor ctermbg=%s", user_opts.colors.lines))
        user_opts.colors.lines = "CustomLinesColor"
    end

    -- Clear color
    if user_opts.colors.clear == nil then
        user_opts.colors.clear = "LineNr"
    else
        vim.cmd(string.format("hi CustomClearColor ctermbg=%s", user_opts.colors.clear))
        user_opts.colors.clear = "CustomClearColor"
    end

    return user_opts.colors

end

return COLOR
