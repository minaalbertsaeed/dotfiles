require("lualine").setup {

    options = {
        globalstatus = true,
    },

    sections = {

        -- a b c     x y z 
        lualine_a = {
            "mode",
        },

        lualine_b = { "branch" },

        lualine_c = {
            { "filename", path = 3 },
        },

        lualine_x = {
            {
                'searchcount',
                maxcount = 999,
                timeout = 10000,
            },

            {
                'buffers',
                seperator = '|',
                mode = 2,
            },
        },

        lualine_y = {
            { "filetype", "progress", padding = { left = 1, right = 1 } },
            { "location", padding = { left = 0, right = 1 } },
        },

    },
}
