require("options")
require("mappings")
require("commands")
require("colors.gruber")

-- --------------------------------------------
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
M.create_autocmd({ "BufEnter", "FileType" }, {
		desc = "don't auto comment new line",
		pattern = "*",
		command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o",
	})

-- bootstrap plugins & lazy.nvim
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim" -- path where its going to be installed

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    }
end

vim.opt.rtp:prepend(lazypath)


-- vim.cmd "colorscheme monochrome"
vim.cmd("set guicursor=i:block")
vim.cmd('set nofoldenable')
vim.cmd("setlocal formatoptions-=c formatoptions-=r formatoptions-=o")-- Dont auto comment new line 
-- vim.cmd("colorscheme gruber")
vim.cmd("GitBlameDisable")

return M
