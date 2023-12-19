<h1 align="center">
  nvim-statusline
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
- TODO: 'airblade/vim-gitgutter'

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
    -- using a 256-color palette
    -- TODO: Fix such one can use hexcodes
    -- colors = {
    --     git = {
    --         fg = "59",
    --         bg = "1",
    --     },
    --     filename = {
    --         fg = "59",
    --         bg = "1",
    --     },
    --     buffers = {
    --         fg = "59",
    --         bg = "100",
    --     },
    --     lines = {
    --         fg = "242",
    --         bg = "100",
    --     },
    --    clear = {
    --         fg = "59",
    --         bg = "59",
    --     },
    -- }
})
````

For moving between buffers, use the default `<leader>1` to jump to buffer `1` in the buffer list. For setting own keymaps, disable them in the `setup()`, and set them to what you want using
````lua
vim.api.nvim_set_keymap('n', '<leader><THE_BUFFER_NR>', ':Cbuffernumber <THE_BUFFER_NR><CR>')
````
for each buffer number.
