-- mason, write correct names only

vim.api.nvim_create_autocmd('TextYankPost', {
    desc = "Highlight when yanking text",
    group = vim.api.nvim_create_augroup('my-highlight-yank', {clear = true }),
    callback = function ()
       vim.highlight.on_yank() 
    end,
})


