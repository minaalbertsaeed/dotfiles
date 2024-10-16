local M = {}

local group = vim.api.nvim_create_augroup("AbstractAutoCmdsGroup", { clear = true })

----------------------------------------------

function M.create_autocmd(events, opts)
	opts = vim.tbl_extend("force", opts, { group = group })
	vim.api.nvim_create_autocmd(events, opts)
end
----------------------------------------------

function M.opts_extend(default, opts)
	return vim.tbl_extend("force", default, opts ~= nil and opts or {})
end

-- Compile dmenu, dwm, and st after :w in config.def.h || config.h
-- vim.api.nvim_create_autocmd("BufWritePost", {
--     pattern = {"config.def.h", "config.h"},
--     callback = function()
--         local dir = vim.fn.expand('%:p:h')
--         vim.cmd('cd ' .. dir)
--         vim.opt.makeprg = 'rm -rf config.h && doas make install clean'
--         vim.cmd('make')
--         vim.opt.makeprg = 'make'
--     end,
-- })

----------------------------------------------
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = "Highlight when yanking text",
    group = vim.api.nvim_create_augroup('my-highlight-yank', {clear = true }),
    callback = function ()
       vim.highlight.on_yank() 
    end,
})
----------------------------------------------
vim.api.nvim_create_autocmd({ "BufEnter", "FileType" }, {
		desc = "don't auto comment new line",
		pattern = "*",
        group = vim.api.nvim_create_augroup('dont-comment', {clear = true }),
		command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o",
})

return M
