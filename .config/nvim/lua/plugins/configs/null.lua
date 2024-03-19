local null_ls = require "null-ls"
local format = null_ls.builtins.formatting

null_ls.setup {
    sources = {
        null_ls.builtins.formatting.clang_format,
    },
}
