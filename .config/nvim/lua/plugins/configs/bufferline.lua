local bufferline = require("bufferline")

bufferline.setup {
    options = {
        themable = true,
        offsets = {
            {
                filetype = "NvimTree",
                highlight = "NvimTreeNormal"
            },
        },
        separator_style = "thick",

        indicator = {
            style = 'underline',
        },

        -- or you can combine these e.g.
        highlights = {


            buffer_selected = {
                fg = '',
                bg = '#fff',
                bold = true,
                italic = true,
            },
            --     fill = {
            --         bg = {
            --             attribute = "fg",
            --             highlight = "Pmenu"
            --         }
            --     },
        },
    }
}
