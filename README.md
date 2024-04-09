<h1 align="center">
  nvim-statusline (0.2.0-beta)
</h1>
<p align="center">
A simple, minimalistic, easily navigated and anti-bloat buffer statusline.
</p>

<p align="center">
Standard statusline
</p>

![Demo Image](https://github.com/phdah/nvim-statusline/raw/main/images/clean.png)
<p align="center">
nvim-statusline statusline
</p>

![Demo Image](https://github.com/phdah/nvim-statusline/raw/main/images/demo.png)

<!-- badges: start -->
[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/phdah/nvim-statusline/blob/main/LICENSE)
<!-- badges: end -->

## Requirements

- Neovim 0.X
- `git`

If you want to set your own colors, you also need
- `set termguicolors` in your config

## Installation

Use your favorite package manager, e.g., `packer`:
````lua
use {'phdah/nvim-statusline'}
````
and in your `init.lua`, put
````lua
require('nvim-statusline').setup()
````

## Configurations

For adding configs, copy these default
````lua
require('nvim-statusline').setup({
    enable = true,         -- Enables the entire statusline
    git = true,            -- Enables the git status
    filename = true,       -- Enables showing the filename
    buffers = true,        -- Enables showing the buffers
    lines = true,          -- Enables showing line details
    keymaps = true,        -- Enables the keymaps for buffer switching
    -- Colors can be set for each object, and both foreground and background
    -- using hex colors
    colors = {
        git = {
            fg = "#D8DEE9",
            bg = "#4C566A",
        },
        filename = {
            fg = "#D8DEE9",
            bg = "#4C566A",
        },
        buffers = {
            fg = "#D8DEE9",
            bg = "#4C566A",
        },
        lines = {
            fg = "#D8DEE9",
            bg = "#4C566A",
        },
        clear = {
            fg = "#D8DEE9",
            bg = "#2E3440",
        },
    },
    -- }
})
````

For moving between buffers, use the default `<leader>1` to jump to buffer `1` in the buffer list. For setting own keymaps, disable them in the `setup()`, and set them to what you want using
````lua
vim.api.nvim_set_keymap('n', '<leader><THE_BUFFER_NR>', ':Cbuffernumber <THE_BUFFER_NR><CR>')
````
for each buffer number.
