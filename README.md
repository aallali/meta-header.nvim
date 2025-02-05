# meta-header.nvim

**meta-header.nvim** is a vim plugin to manage and dynamically generate file headers based on customizable environment variables.

### Output Examples:
```
/* ************************************************************************** */
/*   Copyright 2025 <Abdellah A.>                                             */
/*                                                                            */
/*   File    : test.c                                                         */
/*   Project : meta-header.nvim                                               */
/*   license : MIT                                                            */
/*                                                                            */
/*   Created: 2025/01/17 13:37:00 by aallali                                  */
/*   Updated: 2025/01/17 17:11:08 by aallali                                  */
/* ************************************************************************** */

# ************************************************************************** #
#   Meta-Header <email@example.com>                                          #
#                                                                            #
#   File    : test.py                                                        #
#   Project : meta-header.nvim                                               #
#   license : APACHE                                                         #
#                                                                            #
#   Created: 2025/01/17 18:10:59 by username1                                #
#   Updated: 2025/01/17 18:11:00 by username2                                #
# ************************************************************************** #

```

## Installation
### Method 1:
add this to your `LAZY` plugin loader
```lua
require("lazy").setup({
  {
    "aallali/meta-header.nvim",
    config = function()
      require("meta_header").load_mappings()
      require("meta_header").update_plugin()
    end,
  },
})
```
### Method 2:
1. **Clone the Plugin Repository**
    ```bash
    git clone https://github.com/aallali/meta-header.nvim ~/.config/nvim/lua/meta_header
    ```
1. **load the plugin**
    - add this lines to your init.lua file
    ```lua
    require('meta_header').update_plugin() -- basically just git pull latest changes
    require('meta_header').load_mappings() -- bind F2 + OnSave 
    ```
1. **Restart Neovim**

## Usage
- Open a file in Neovim.
- Press `<F2>` (or your configured keybinding).
- If environment variables are missing, the plugin will generate a `hdr_meta.sh` file in the same directory as the file you're editing.
- Edit the `hdr_meta.sh` file with your desired values:

    ```bash
    #!/bin/bash
    export HDR_AUTHOR="Your Name"
    export HDR_USERNAME="Your Username"
    export HDR_PROJECT="Your Project Name"
    export HDR_LICENSE="Your License"
    ```
3. Source the `hdr_meta.sh` file:
    ```bash
    source ./hdr_meta.sh
    ```

### Contribution ?

| :warning: YES |
|:--------------|

## Changelog

- 2025/01/19 - [db8facc](https://github.com/aallali/meta-header.nvim/commit/db8facc) - **`refact`** - split update from insert to run each in correct situation (update only if header exists, insert on demand) + create load_mappings method + update_plugin to run one time on first load

- 2025/01/19 - [1f51bf2](https://github.com/aallali/meta-header.nvim/commit/1f51bf2) - **`fix`** - handle unicode length correctly for pad calculation e.g: `©` _it has length of 2, while visually it should be only 1_
- 2025/01/19 - [a370145](https://github.com/aallali/meta-header.nvim/commit/a370145) - **`refact`** - update get_comment_style() to detect file type using extension 
- 2025/01/18 - [5356ecd](https://github.com/aallali/meta-header.nvim/commit/5356ecd) - **`feature`** - Add mechanism to auto-update plugin code after header generation
- 2025/01/18 - [868787b](https://github.com/aallali/meta-header.nvim/commit/868787b) - **`fix`** - Update import paths to use full plugin path instead of relative imports

- 2025/01/18 - [b381963](https://github.com/aallali/meta-header.nvim/commit/b381963) - **`refact`** - Split code into multiple files and fix header stacking issues
- 2025/01/17 - [d87fbbe](https://github.com/aallali/meta-header.nvim/commit/d87fbbe) - **`fix`** - Update content of `hdr_meta.sh` environment setup script
- 2025/01/17 - [52b506e](https://github.com/aallali/meta-header.nvim/commit/52b506e) - **`refact`** - Reorganize Lua scripts to project root for better structure
- 2025/01/17 - [3565868](https://github.com/aallali/meta-header.nvim/commit/3565868) - **`feature`** - Add comprehensive installation guide with examples
- 2025/01/17 - [9e7f0f2](https://github.com/aallali/meta-header.nvim/commit/9e7f0f2) - **`release`** - [**`0.1.0`**]
