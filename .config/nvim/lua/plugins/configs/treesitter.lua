require("nvim-treesitter.configs").setup {
  ensure_installed = { "c", "cpp" , "toml", "python"},

  highlight = {
    enable = false,
    use_languagetree = true,
  },
  indent = { enable = true },
}
