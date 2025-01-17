# meta-header.nvim


**meta-header.nvim** is a vim plugin to manage and dynamically generate file headers based on customizable environment variables.

### Output Examples:
```
/* ************************************************************************** */
/*   Copyright 2025 <Abdellah A.>                                             */
/*                                                                            */
/*   File    : test.c                                                         */
/*   Project : meta-header.nvim                                               */
/*   licence : MIT                                                            */
/*                                                                            */
/*   Created: 2025/01/17 13:37:00 by aallali                                  */
/*   Updated: 2025/01/17 17:11:08 by aallali                                  */
/* ************************************************************************** */

# ************************************************************************** #
#   Meta-Header <email@example.com>                                          #
#                                                                            #
#   File    : test.py                                                        #
#   Project : meta-header.nvim                                               #
#   licence : APACHE                                                         #
#                                                                            #
#   Created: 2025/01/17 18:10:59 by username1                                #
#   Updated: 2025/01/17 18:11:00 by username2                                #
# ************************************************************************** #

```

## Installation

### Using [Lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
    "aallali/meta-header.nvim",
    config = function()
        require("meta_header").update_header()
    end,
}
```

### Using [Packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
    "aallali/meta-header.nvim",
    config = function()
        require("meta_header").update_header()
    end,
}
```

### Without a package manager (direct download into lua folder)

1. **Clone the Plugin Repository**
    Clone the `meta-header.nvim` repository into your Neovim configuration:
    ```bash
    git clone https://github.com/aallali/meta-header.nvim ~/.config/nvim/lua/meta_header
    ```
1. **Load the Plugin**
    Add the following line to your `init.lua`:
    ```lua
    require("meta_header").update_header()
    ```
1. **Keybinding**
    ```lua
    vim.api.nvim_set_keymap("n", "<F2>", ":lua require('meta_header').update_header()<CR>", { noremap = true, silent = true })
    ```
1. **Restart Neovim**

## Usage
- Open a file in Neovim.
- Press `<F2>` (or your configured keybinding) to insert or update the file header dynamically.
- If environment variables are missing, the plugin will generate a `hdr_meta.sh` file in the same directory as the file you're editing.
- Edit the `hdr_meta.sh` file with your desired values:

    ```bash
    #!/bin/bash
    export HDR_AUTHOR="Your Name"
    export HDR_USERNAME="Your Username"
    export HDR_PROJECT="Your Project Name"
    export HDR_LICENCE="Your License"
    ```
3. Source the `hdr_meta.sh` file:
    ```bash
    source ./hdr_meta.sh
    ```

### Contribution ?

| :warning: YES |
|:--------------|
