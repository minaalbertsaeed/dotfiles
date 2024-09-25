local M = {}

local group = vim.api.nvim_create_augroup("AbstractAutoCmdsGroup", { clear = true })

-- --------------------------------------------

function M.create_autocmd(events, opts)
	opts = vim.tbl_extend("force", opts, { group = group })
	vim.api.nvim_create_autocmd(events, opts)
end
-- --------------------------------------------

function M.opts_extend(default, opts)
	return vim.tbl_extend("force", default, opts ~= nil and opts or {})
end
-- --------------------------------------------
vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = {"config.def.h", "config.h"},
    callback = function()
        local dir = vim.fn.expand('%:p:h')
        vim.cmd('cd ' .. dir)
        vim.opt.makeprg = 'rm -rf config.h && doas make install clean'
        vim.cmd('make')
        vim.opt.makeprg = 'make'
    end,
})

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "toml",
--   callback = function()
--     vim.cmd("highlight tomlTable guifg=#89B4FA")
--     vim.cmd("highlight tomlTableArray guifg=#89B4FA")
--   end,
-- })

return M
