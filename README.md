# meta_header.nvim

**meta_header.nvim** is a neovim plugin to manage and dynamically generate file headers based on customizable environment variables.

### Output Examples:

```
/* ************************************************************************** */
/*   Copyright 2025 <Abdellah A.>                                             */
/*                                                                            */
/*   File    : test.c                                                         */
/*   Project : meta_header.nvim                                               */
/*   License : MIT                                                            */
/*                                                                            */
/*   Created: 2025/01/17 13:37:00 by aallali                                  */
/*   Updated: 2025/01/17 17:11:08 by aallali                                  */
/* ************************************************************************** */

# *********************************************** #
#   meta_header <email@example.com>               #
#                                                 #
#   File    : test.py                             #
#   Project : meta_header.nvim                    #
#   License : APACHE                              #
#                                                 #
#   Created: 2025/01/17 18:10:59 by username1     #
#   Updated: 2025/01/17 18:11:00 by username2     #
# *********************************************** #

# ************************************************************ #
#    Copyright © 2025 <hi@allali.me>                ┏┓ ┏┓ ┏┓   #
#                                                   ┃┫ ┏┛ ┃┫   #
#    File    : test.py                              ┗┛•┗━•┗┛   #
#    Project : meta_header.nvim                                #
#    License : MIT                                             #
#                                                              #
#    Created: 2025/02/07 23:48:43 by aallali                   #
#    Updated: 2025/02/07 23:49:19 by aallali                   #
# ************************************************************ #

/* ************************************************************* */
/*    Copyright © 2025 <hi@allali.me>                |\-^-/|     */
/*                                                   |_____|     */
/*    File    : test.c                                |===|      */
/*    Project : meta_header.nvim                      |   |      */
/*    License : MIT                                   )___(      */
/*                                                   (=====)     */
/*    Created: 2025/02/08 00:20:58 by aallali        }====={     */
/*    Updated: 2025/02/08 00:20:58 by aallali       (_______)    */
/* ************************************************************* */
/* **************************************************************** */
/*    Copyright © 2025 <hi@allali.me>                        ,,__   */
/*                                                  ^  ^    / o._)  */
/*    File    : test.ml                           /--'/--\  \-'||   */
/*    Project : meta_header.nvim                 /        \_/ / |   */
/*    License : MIT                            .'\  \__\  __.'.'    */
/*                                               )\ |  )\ |         */
/*    Created: 2025/02/08 00:20:58 by aallali   // \\ // \\         */
/*    Updated: 2025/02/08 00:20:58 by aallali  ||_  \\|_  \\_       */
/* **************************************************************** */
// ============================================== //
//   By username <email@example.com>              //
//                                                //
//   main.rs                                      //
//                                                //
//   Created: 2025/01/17 18:10:59 by username1    //
//   Updated: 2025/01/17 18:11:00 by username2    //
// ============================================== //
```

## Installation

add this to your plugin loader

```lua
return {
    "aallali/meta_header.nvim",
    config = function()
        require("meta_header").setup({
            template = "template2.txt",
            template_locally = true
        })
        require("meta_header").load_mappings()
    end
}
```

## Usage

- Open a file in Neovim.
- Press `<F2>` (or your configured keybinding).
- If environment variables are missing, the plugin will generate a `hdr_meta.sh` file under `.meta_header` folder as a file you are editing.
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
   source ./.meta_header/hdr_meta.sh
   ```
4. in case you want to customize your template you can set yours in `.meta_header/template.txt`
   the plugin will automatically check for that file if it exists only if `template_locally = true` is set to true in plugin config!

### Contribution ?

| :warning: YES OFC |
| :---------------- |

## Changelog

- **0.2.1** (_14/02/2025_)
  - `ae18f20` **`style`**: format all files
  - `9971fdf` **`fix`**: remove unused arg in update_meta_header
  - `f8dd944` **`fix`**: generate template when not found
  - `16d65c7` **`fix`**: handle created at dates on different templates
- **0.2.0** (_8/02/2025_)
  - `6039c36` **`docs`**: Update guide for `0.2.0` release
  - `a5ce68b` **`feat`**: upload generated `.meta_header`
  - `df59e07` **`feat`**: create `.meta_header` folder in root folder for configs
  - `3ff97f6` **`refact`**: check for small headers `has_header`
  - `300364a` **`feat`**: add more templates
  - `76093e8` **`feat`**: config to use custom templates from user
  - `9b14407` **`feat`**: load templates from folder for more options
  - `2266ffe` **`refact`**: header_width is dynamic based on template
  - `5aceece` **`refact`**: use underscores pattern for padding in var replacements
  - `610a0a0` **`refact`**: match different header styles in `has_header`
  - `950bb6c` **`refact`**: dynamic templaet height sent to `nvim_buf_get_lines`
  - `292be80` **`feat`**: load header from template file
  - `8a37fe6` **`fix`**: correct plugin folder structure for loader compatibility
  - `76578fd` **`feat`**: add comment style for rust files
  - `b035e9a` **`refact`**: add link to plugin in auto-generated file
  - `c0ec919` **`feat`**: add comment style for javascript files
  - `18dae53` **`feat`**: add comment style for golang files
  - `5a24db2` **`refact`**: split insert from update for key bindings
  - `583929b` **`fix`**: handle unicode length correctly for pad calculation
  - `f4d57bb` **`refact`**: detect file type by extension in comment style
  - `1faae56` **`feat`**: Add plugin updater after generation
  - `484f5c8` **`fix`**: Use full path inside plugin code imports
  - `ab6f77c` **`feat`**: Add auto generated env sertter for testing
  - `4489042` **`refact`**: modularize architecture and **`fix`** header bugs
  - `2b3c941` **`fix`**: typo in `license`
- **0.1.0** (_17/01/2024_)
  - `f6c0016` **`release`** - [**`0.1.0`**]
