# meta-header.nvim


Meta Header.nvim is a Neovim plugin to manage and dynamically generate file headers based on customizable environment variables.

## Installation

### Using [Lazy.nvim](https://github.com/folke/lazy.nvim)
Add the following to your Lazy.nvim configuration:

```lua
{
    "aallali/meta-header.nvim",
    config = function()
        require("meta_header").update_header()
    end,
}
```

### Using [Packer.nvim](https://github.com/wbthomason/packer.nvim)
Add this to your Packer setup:

```lua
use {
    "aallali/meta-header.nvim",
    config = function()
        require("meta_header").update_header()
    end,
}
```
To proceed with using Lua without Lazy.nvim, here's what you need to do:

### Without a package manager (direct download into lua folder)

#### **1. Clone the Plugin Repository**
Clone the `meta-header.nvim` repository into your Neovim configuration:
```bash
git clone https://github.com/allali/meta-header.nvim ~/.config/nvim/lua/meta_header
```

#### **2. Load the Plugin**
Add the following line to your `init.lua`:
```lua
require("meta_header").update_header()
```

---

### **3. Keybinding**
To bind the `update_header` function to a key (e.g., `<F2>`), add this line to your `init.lua`:
```lua
vim.api.nvim_set_keymap("n", "<F2>", ":lua require('meta_header').update_header()<CR>", { noremap = true, silent = true })
```

---

### **4. Restart Neovim**
Close and reopen Neovim to load the plugin.


## Usage

### Setting Up Environment Variables
1. If environment variables are missing, the plugin will generate a `hdr_meta.sh` file in the same directory as the file you're editing.
2. Edit the `hdr_meta.sh` file with your desired values:

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

### Generating a Header
- Open a file in Neovim.
- Press `<F2>` (or your configured keybinding) to insert or update the file header dynamically.


### Output Example:
```
/* ************************************************************************** */
/*   Copyright 2025 <Abdellah ALLALI>                                         */
/*                                                                            */
/*   File    : test.c                                                         */
/*   Project : meta-header.nvim                                               */
/*   licence : MIT                                                            */
/*                                                                            */
/*   Created: 2025/01/17 13:37:00 by aallali                                  */
/*   Updated: 2025/01/17 17:11:08 by aallali                                  */
/* ************************************************************************** */
```