# My-Linux-System-Setup/.config/nvim

<a href="https://dotfyle.com/minaalbert33/my-linux-system-setup-config-nvim"><img src="https://dotfyle.com/minaalbert33/my-linux-system-setup-config-nvim/badges/plugins?style=flat" /></a>
<a href="https://dotfyle.com/minaalbert33/my-linux-system-setup-config-nvim"><img src="https://dotfyle.com/minaalbert33/my-linux-system-setup-config-nvim/badges/leaderkey?style=flat" /></a>
<a href="https://dotfyle.com/minaalbert33/my-linux-system-setup-config-nvim"><img src="https://dotfyle.com/minaalbert33/my-linux-system-setup-config-nvim/badges/plugin-manager?style=flat" /></a>


## Install Instructions

 > Install requires Neovim 0.9+. Always review the code before installing a configuration.

Clone the repository and install the plugins:

```sh
git clone git@github.com:minaalbert33/My-Linux-System-Setup ~/.config/minaalbert33/My-Linux-System-Setup
NVIM_APPNAME=minaalbert33/My-Linux-System-Setup/.config/nvim nvim --headless +"Lazy! sync" +qa
```

Open Neovim with this config:

```sh
NVIM_APPNAME=minaalbert33/My-Linux-System-Setup/.config/nvim nvim
```

## Plugins

### color

+ [brenoprata10/nvim-highlight-colors](https://dotfyle.com/plugins/brenoprata10/nvim-highlight-colors)
### colorscheme

+ [marko-cerovac/material.nvim](https://dotfyle.com/plugins/marko-cerovac/material.nvim)
### comment

+ [numToStr/Comment.nvim](https://dotfyle.com/plugins/numToStr/Comment.nvim)
### completion

+ [hrsh7th/nvim-cmp](https://dotfyle.com/plugins/hrsh7th/nvim-cmp)
### debugging

+ [rcarriga/nvim-dap-ui](https://dotfyle.com/plugins/rcarriga/nvim-dap-ui)
+ [mfussenegger/nvim-dap](https://dotfyle.com/plugins/mfussenegger/nvim-dap)
### diagnostics

+ [folke/trouble.nvim](https://dotfyle.com/plugins/folke/trouble.nvim)
### editing-support

+ [windwp/nvim-autopairs](https://dotfyle.com/plugins/windwp/nvim-autopairs)
### file-explorer

+ [stevearc/oil.nvim](https://dotfyle.com/plugins/stevearc/oil.nvim)
### formatting

+ [stevearc/conform.nvim](https://dotfyle.com/plugins/stevearc/conform.nvim)
### fuzzy-finder

+ [ibhagwan/fzf-lua](https://dotfyle.com/plugins/ibhagwan/fzf-lua)
+ [nvim-telescope/telescope.nvim](https://dotfyle.com/plugins/nvim-telescope/telescope.nvim)
### git

+ [lewis6991/gitsigns.nvim](https://dotfyle.com/plugins/lewis6991/gitsigns.nvim)
+ [f-person/git-blame.nvim](https://dotfyle.com/plugins/f-person/git-blame.nvim)
### indent

+ [echasnovski/mini.indentscope](https://dotfyle.com/plugins/echasnovski/mini.indentscope)
+ [lukas-reineke/indent-blankline.nvim](https://dotfyle.com/plugins/lukas-reineke/indent-blankline.nvim)
### lsp

+ [simrat39/symbols-outline.nvim](https://dotfyle.com/plugins/simrat39/symbols-outline.nvim)
+ [neovim/nvim-lspconfig](https://dotfyle.com/plugins/neovim/nvim-lspconfig)
+ [mfussenegger/nvim-jdtls](https://dotfyle.com/plugins/mfussenegger/nvim-jdtls)
+ [ray-x/lsp_signature.nvim](https://dotfyle.com/plugins/ray-x/lsp_signature.nvim)
### lsp-installer

+ [williamboman/mason.nvim](https://dotfyle.com/plugins/williamboman/mason.nvim)
### markdown-and-latex

+ [iamcco/markdown-preview.nvim](https://dotfyle.com/plugins/iamcco/markdown-preview.nvim)
### nvim-dev

+ [nvim-lua/plenary.nvim](https://dotfyle.com/plugins/nvim-lua/plenary.nvim)
### plugin-manager

+ [folke/lazy.nvim](https://dotfyle.com/plugins/folke/lazy.nvim)
### snippet

+ [L3MON4D3/LuaSnip](https://dotfyle.com/plugins/L3MON4D3/LuaSnip)
+ [rafamadriz/friendly-snippets](https://dotfyle.com/plugins/rafamadriz/friendly-snippets)
### statusline

+ [nvim-lualine/lualine.nvim](https://dotfyle.com/plugins/nvim-lualine/lualine.nvim)
### syntax

+ [kylechui/nvim-surround](https://dotfyle.com/plugins/kylechui/nvim-surround)
+ [nvim-treesitter/nvim-treesitter](https://dotfyle.com/plugins/nvim-treesitter/nvim-treesitter)
### tabline

+ [akinsho/bufferline.nvim](https://dotfyle.com/plugins/akinsho/bufferline.nvim)
### utility

+ [echasnovski/mini.nvim](https://dotfyle.com/plugins/echasnovski/mini.nvim)
+ [stevearc/dressing.nvim](https://dotfyle.com/plugins/stevearc/dressing.nvim)
## Language Servers

+ clangd
+ jdtls
+ rust_analyzer
+ lua_ls



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
