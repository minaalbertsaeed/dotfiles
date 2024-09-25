require("oil").setup({
    columns = {
        "icon",
        "permissions",
        "size",
        "mtime",
    },
    float = {
        -- Padding around the floating window
        padding = 2,
        max_width = 150,
        max_height = 50,
        border = "rounded",
        win_options = {
            winblend = 0,
        },
        constrain_cursor = "name",
    }
})
