require("lualine").setup {
    options = {
        theme = "auto",
        globalstatus = true,
    },
    sections = {
        -- lualine_a = { "mode" },
        -- lualine_b = { "branch" },

        lualine_c = {
            { "filename", path = 1 },
        },
        lualine_y = {
            -- { "progress", separator = " ",                  padding = { left = 1, right = 0 } },
            { "location", padding = { left = 0, right = 1 } },
        },
    },
    -- extensions = { "neo-tree", "lazy" },
}
