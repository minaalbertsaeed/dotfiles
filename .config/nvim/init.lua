require "options"
require "mappings"
require "commands"

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
vim.cmd "set guicursor=i:block"

-- vim.cmd "colorscheme oh-lucy"
vim.cmd " colorscheme base16-ayu-dark"
-- vim.cmd "colorscheme base16-gruvbox-material-dark-hard"
vim.cmd "GitBlameDisable"

