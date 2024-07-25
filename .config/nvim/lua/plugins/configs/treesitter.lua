require("nvim-treesitter.configs").setup {
  ensure_installed = { "c", "cpp" },

  highlight = {
    enable = false,
    use_languagetree = true,
  },
  indent = { enable = true },
}
