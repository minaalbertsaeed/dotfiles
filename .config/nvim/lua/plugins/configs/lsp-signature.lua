-- cfg = {…}  -- add you config here
local cfg = {
    floating_window_off_x = 5,                           -- adjust float windows x position.
    floating_window_off_y = function()                   -- adjust float windows y position. e.g. set to -2 can make floating window move up 2 lines
        local linenr = vim.api.nvim_win_get_cursor(0)[1] -- buf line number
        local pumheight = vim.o.pumheight
        local winline = vim.fn.winline()                 -- line number in the window
        local winheight = vim.fn.winheight(0)

        -- window top
        if winline - 1 < pumheight then
            return pumheight
        end

        -- window bottom
        if winheight - winline < pumheight then
            return -pumheight
        end
        return 0
    end,
}
require "lsp_signature".setup(cfg)

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client.server_capabilities.hoverProvider then
            vim.keymap.set('n', '<leader>k', vim.lsp.buf.hover, { buffer = args.buf , desc = "Display keyword description" })
        end
    end,
})
