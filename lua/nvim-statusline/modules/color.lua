local COLOR = {}

local function apply_custom_highlights(colors)
    if colors.git and colors.git.color == "CustomGitColor" then
        vim.api.nvim_set_hl(0, "CustomGitColor", { bg = colors.git.bg, fg = colors.git.fg })
    end
    if colors.filename and colors.filename.color == "CustomFilenameColor" then
        vim.api.nvim_set_hl(0, "CustomFilenameColor", { bg = colors.filename.bg, fg = colors.filename.fg })
    end
    if colors.buffers and colors.buffers.color == "CustomBuffersColor" then
        vim.api.nvim_set_hl(0, "CustomBuffersColor", { bg = colors.buffers.bg, fg = colors.buffers.fg })
    end
    if colors.lines and colors.lines.color == "CustomLinesColor" then
        vim.api.nvim_set_hl(0, "CustomLinesColor", { bg = colors.lines.bg, fg = colors.lines.fg })
    end
    if colors.clear and colors.clear.color == "CustomClearColor" then
        vim.api.nvim_set_hl(0, "CustomClearColor", { bg = colors.clear.bg, fg = colors.clear.fg })
    end
end

COLOR.set_colors = function(user_opts)
    -- Set default colors and potentially create custom highlight groups
    if user_opts.colors == nil then user_opts.colors = {} end

    -- Git color
    if user_opts.colors.git == nil then
        user_opts.colors.git = {}
        user_opts.colors.git.color = "CursorColumn"
    else
        user_opts.colors.git.color = "CustomGitColor"
    end

    -- Filename color
    if user_opts.colors.filename == nil then
        user_opts.colors.filename = {}
        user_opts.colors.filename.color = "LineNr"
    else
        user_opts.colors.filename.color = "CustomFilenameColor"
    end

    -- Buffers color
    if user_opts.colors.buffers == nil then
        user_opts.colors.buffers = {}
        user_opts.colors.buffers.color = "CursorColumn"
    else
        user_opts.colors.buffers.color = "CustomBuffersColor"
    end

    -- Lines color
    if user_opts.colors.lines == nil then
        user_opts.colors.lines = {}
        user_opts.colors.lines.color = "CursorColumn"
    else
        user_opts.colors.lines.color = "CustomLinesColor"
    end

    -- Clear color
    if user_opts.colors.clear == nil then
        user_opts.colors.clear = {}
        user_opts.colors.clear.color = "LineNr"
    else
        user_opts.colors.clear.color = "CustomClearColor"
    end

    -- Apply highlights now and re-apply after any colorscheme change
    apply_custom_highlights(user_opts.colors)
    vim.api.nvim_create_autocmd("ColorScheme", {
        callback = function()
            apply_custom_highlights(user_opts.colors)
        end
    })

    return user_opts.colors
end

return COLOR
