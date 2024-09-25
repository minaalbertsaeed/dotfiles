local bg_dark = "#1f2335"
local bg = "#24283b"
local fg = "#89B4FA"
require("lualine").setup {

    options = {
        globalstatus = true,
        -- theme = 'auto'
    },

    sections = {
        -- a b c     x y z
        lualine_a = {
            "mode",
        },

        lualine_c =  {
            {
                "branch" ,
                use_mode_colors = true,
                buffers_color = {
                    -- active = { bg = '', fg = '#fff' },
                    -- inactive = { bg = '', fg = fg_gutter },
                }
            }
        },

        lualine_b = {
            {
                'buffers',
                mode = 2,
                use_mode_colors = true,
                buffers_color = {
                    active = { bg = '', fg = fg },
                    inactive = { bg = '', fg = "#fff" },
                }

            },
        },

        lualine_x = {
            {
                'searchcount',
                maxcount = 999,
                timeout = 10000,
            },

            { "filename", path = 4 },
        },

        lualine_y = {
            { "filetype" },
            { "progress", padding = { left = 1, right = 1 } },
            -- { "location", padding = { left = 0, right = 1 } },
        },

    },
}
