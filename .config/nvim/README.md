<!-- # TinyVim -->
<!-- - Minimal Neovim config meant to be a starting point for new neovim users. -->
<!---->
<!-- ![2023-09-26-133901_2560x1440_scrot](https://github.com/NvChad/tinyvim/assets/59060246/ce143ca2-07f1-4d54-971d-0f8304c50b58) -->

# Install
 * First, clone NvChad/tinyvim repo as this is the base config

    ```bash
    git clone https://github.com/NvChad/tinyvim ~/.config/nvim && nvim
    ```

 * Second 

    ```bash
    # clone this repo
    git clone https://github.com/minaalbert33/dotfiles.git 

    # copy my nvim config to ~/.config/nvim/
    cp -rf dotfiles/.config/nvim ~/.config/nvim 
    ```


# Dir structure
```bash
├── init.lua
├── lua
    ├── commands.lua
    ├── mappings.lua
    ├── options.lua
    └── plugins
        ├── init.lua
        ├── configs
            ├── cmp.lua
            ├── telescope.lua
            └── ( more ... )
```

### Notes
all the plugins are located in lua/plugins/init.lua

<!-- | Name             | Description                                  | -->
<!-- |-------------------------|----------------------------------------------| -->
<!-- | nvim-tree.lua           | File tree                                    | -->
<!-- | Nvim-web-devicons       | Icons provider                               | -->
<!-- | nvim-treesitter         | Configure treesitter                         | -->
<!-- | nvim-cmp                | Autocompletion                               | -->
<!-- | Luasnip & friendly snippets               | Snippets                                      | -->
<!-- | mason.nvim              | Download binaries of various lsps, formatters, debuggers, etc. | -->
<!-- | gitsigns.nvim                | Git-related features                         | -->
<!-- | comment.nvim            | Commenting                                   | -->
<!-- | telescope.nvim          | Fuzzy finder                                 | -->
<!-- | fzf-lua                 | Blazingly Fast Fuzzy finder                                 | -->
<!-- | conform.nvim            | Formatter                                    | -->
<!-- | lualine.nvim            | Statusline                                    | -->

