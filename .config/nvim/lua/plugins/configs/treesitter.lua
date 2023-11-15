require("nvim-treesitter.configs").setup {
  ensure_installed = { "lua", "vim", "vimdoc", "java", "c", "cpp" },

  highlight = {
    enable = true,
    use_languagetree = true,
  },
  indent = { enable = true },
}
