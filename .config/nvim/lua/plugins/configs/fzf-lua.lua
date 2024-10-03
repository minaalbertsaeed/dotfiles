require("fzf-lua").setup({
    'fzf-tmux',
    preview_wrap = 'nowrap:hidden',
    vim.api.nvim_set_hl(0, "FzfLuaBorder", { link = "FloatBorder" })
})

