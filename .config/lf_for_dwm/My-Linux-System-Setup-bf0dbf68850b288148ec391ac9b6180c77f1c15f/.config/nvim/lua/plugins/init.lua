local plugins = {

    { lazy = true,                 "nvim-lua/plenary.nvim" },

    -- Themes
    { "tinted-theming/base16-vim", lazy = false },

    {
        "loctvl842/monokai-pro.nvim",
        config = function()
            require("monokai-pro").setup()
        end
    },

    { 'yazeed1s/oh-lucy.nvim' },

    {
        'stevearc/dressing.nvim',
        config = function()
            require('plugins.configs.dressing')
        end
    },
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },
    {
        'marko-cerovac/material.nvim'
    },


    -- {
    --     "folke/trouble.nvim",
    --     dependencies = { "nvim-tree/nvim-web-devicons" },
    --     opts = {
    --         -- your configuration comes here
    --         -- or leave it empty to use the default settings
    --         -- refer to the configuration section below
    --     },
    -- },
    {
        "rcarriga/nvim-dap-ui",
        event = "VeryLazy",
        dependencies = "mfussenegger/nvim-dap",
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            dapui.setup()
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end
    },

    {
        "jay-babu/mason-nvim-dap.nvim",
        event = "VeryLazy",
        dependencies = {
            "mason.nvim",
            "mfussenegger/nvim-dap",
        },
        cmd = { "DapInstall", "DapUninstall" },
        opts = {
            -- Makes a best effort to setup the various debuggers with
            -- reasonable debug configurations
            automatic_installation = true,

            -- You can provide additional configuration to the handlers,
            -- see mason-nvim-dap README for more information
            handlers = {},

            -- You'll need to check that you have the required things installed
            -- online, please don't ask me how to install them :)
            ensure_installed = {
                -- Update this to ensure that you have the debuggers for the langs you want
            },
        },
    },

    {
        'brenoprata10/nvim-highlight-colors',
        config = function()
            require('nvim-highlight-colors').setup {}
        end
    },

    { 'mfussenegger/nvim-jdtls' },


    {
        'simrat39/symbols-outline.nvim',
        config = function()
            require("symbols-outline").setup()
        end,
    },

    {
        "echasnovski/mini.indentscope",
        version = false, -- wait till new 0.7.0 release to put it back on semver
        event = "VeryLazy",
        opts = {
            -- symbol = "▏",
            symbol = "│",
            options = { try_as_border = true },
        },
        init = function()
            vim.api.nvim_create_autocmd("FileType", {
                pattern = {
                    "help",
                    "alpha",
                    "dashboard",
                    "neo-tree",
                    "Trouble",
                    "trouble",
                    "lazy",
                    "mason",
                    "notify",
                    "toggleterm",
                    "lazyterm",
                },
                callback = function()
                    vim.b.miniindentscope_disable = true
                end,
            })
        end,
    },


    {
        'stevearc/oil.nvim',

        config = function()
            require("oil").setup()
        end,
    },

    {
        "NvChad/nvterm",
        config = function()
            require("nvterm").setup()
        end,
    },

    {
        "iamcco/markdown-preview.nvim",
        config = function()
            vim.fn["mkdp#util#install"]()
        end,
    },

    -- file tree
    {
        "nvim-tree/nvim-tree.lua",
        cmd = { "NvimTreeToggle", "NvimTreeFocus" },
        config = function()
            require("plugins.configs.nvim-tree");
        end,
    },

    -- icons, for UI related plugins
    {
        "nvim-tree/nvim-web-devicons",
        config = function()
            require("nvim-web-devicons").setup()
        end,
    },

    -- syntax highlighting
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require "plugins.configs.treesitter"
        end,
    },

    -- buffer + tab line
    {
        "akinsho/bufferline.nvim",
        event = "BufReadPre",
        config = function()
            require "plugins.configs.bufferline"
        end,
    },


    {
        'echasnovski/mini.nvim',
        version = false,
    },

    {
        'f-person/git-blame.nvim',
        -- enabled = false,
        config = function()
            require('gitblame').setup()
        end,
    },

    -- statusline
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        config = function()
            require "plugins.configs.lualine"
        end,
    },

    -- we use cmp plugin only when in insert mode
    -- so lets lazyload it at InsertEnter event, to know all the events check h-events
    -- completion , now all of these plugins are dependent on cmp, we load them after cmp
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            -- cmp sources
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lsp",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lua",

            -- snippets
            --list of default snippets
            "rafamadriz/friendly-snippets",

            -- snippets engine
            {
                "L3MON4D3/LuaSnip",
                config = function()
                    require("luasnip.loaders.from_vscode").lazy_load()
                end,
            },

            -- autopairs , autocompletes ()[] etc
            -- "windwp/nvim-autopairs",
            -- {
            --     config = function()
            --         require("nvim-autopairs").setup()
            --
            --         --  cmp integration
            --         local cmp_autopairs = require "nvim-autopairs.completion.cmp"
            --         local cmp = require "cmp"
            --         cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
            --     end,
            -- },
        },
        config = function()
            require "plugins.configs.cmp"
        end,
    },

    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        cmd = { "Mason", "MasonInstall" },
        config = function()
            require("mason").setup()
        end,
    },

    -- lsp
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require "plugins.configs.lspconfig"
        end,
    },

    -- formatting , linting
    {
        "stevearc/conform.nvim",
        lazy = true,
        config = function()
            require "plugins.configs.conform"
        end,
    },

    -- indent lines
    {
        "lukas-reineke/indent-blankline.nvim",
        event = { "BufReadPre", "BufNewFile" },
        char = "|",
        tab_char = { "a", "b", "c" },
        highlight = { "Function", "Label" },
        smart_indent_cap = true,
        priority = 2,
        config = function()
            require("ibl").setup()
        end,
    },

    {
        "ibhagwan/fzf-lua",
        -- optional for icon support
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            -- calling `setup` is optional for customization
            require("plugins.configs.fzf-lua")
        end,
    },

    -- files finder etc
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        config = function()
            require "plugins.configs.telescope"
        end,
    },

    -- git status on signcolumn etc
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("gitsigns").setup()
        end,
    },

    -- comment plugin
    {
        "numToStr/Comment.nvim",
        lazy = true,
        config = function()
            require("Comment").setup()
        end,
    },

    {
        "ray-x/lsp_signature.nvim",
        event = "BufRead",
        config = function() 
            require "lsp_signature".on_attach() 
        end,
    },
}

require("lazy").setup(plugins, require "plugins.configs.lazy")

require("plugins.configs.lsp-signature")
