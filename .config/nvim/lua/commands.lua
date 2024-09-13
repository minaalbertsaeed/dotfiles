-- mason, write correct names only

vim.api.nvim_create_autocmd('TextYankPost', {
    desc = "Highlight when yanking text",
    group = vim.api.nvim_create_augroup('my-highlight-yank', {clear = true }),
    callback = function ()
       vim.highlight.on_yank() 
    end,
})
--
vim.api.nvim_create_autocmd({ "BufEnter", "FileType" }, {
		desc = "don't auto comment new line",
		pattern = "*",
        group = vim.api.nvim_create_augroup('dont-comment', {clear = true }),
		command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o",
})

