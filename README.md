<h1 align="center">
  buff-statusline.nvim
</h1>
<p align="center">
A simple, minimalistic, easily navigated and anti-bloat buffer statusline.
</p>

<p align="center">
Standard statusline
</p>

![Demo Image](https://github.com/phdah/buff-statusline.nvim/raw/main/images/clean.png)
<p align="center">
buff-statusline.nvim statusline
</p>

![Demo Image](https://github.com/phdah/buff-statusline.nvim/raw/main/images/demo.png)

<!-- badges: start -->
[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/phdah/buff-statusline.nvim/blob/main/LICENSE)
<!-- badges: end -->

## Requirements

- Neovim 0.X
- TODO: 'airblade/vim-gitgutter'

## Installation

Use your favorite package manager, e.g., `packer`:
````lua
use {'phdah/buff-statusline.nvim'}
````
and in your `init.lua``, put
````lua
require('buff-statusline.nvim').setup()
````

For adding configs, copy these default
````lua
require('buff-statusline').setup({
    enable = true,         -- Enables the entire statusline
    git = true,            -- Enables the git status
    filename = true,       -- Enables showing the filename
    buffers = true,        -- Enables showing the buffers
    lines = true,          -- Enables showing line details
    keymaps = true,        -- Enables the keymaps for buffer switching
    colors = {
        git = "CursorColumn",      -- Color for git related status
        filename = "CursorColumn", -- Color for filename
        buffers = "CursorColumn",  -- Color for buffers
        lines = "LineNr"           -- Color for line details
        clear = "LineNr"           -- Color between fields
    }
})
````
