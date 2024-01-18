local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim" -- path where its going to be installed
vim.opt.rtp:prepend(lazypath)
require "plugins"

local map = vim.keymap.set
local options = { noremap = true, silent = true }
local fzf_lua = require('fzf-lua')
-- local telescope = require('telescope.builtin')

map("n", "<Esc>", "<cmd> :noh <CR>")
map("n", "<leader>d", "<cmd> NvimTreeToggle <CR>") -- Open file explorer
map("n", "<leader>q", "<cmd> :bd! <CR>") -- Close current buffer

-- Move group of lines
map('v', "K", ":m '<-2<CR>gv=gv")
map('v', "J", ":m '>+1<CR>gv=gv")

-- Copy to System Clipboard
map('n', "<leader>z", "\"+y")
map('v', "<leader>z", "\"+y")

-- bufferline
map("n", "<Tab>", "<cmd> BufferLineCycleNext <CR>")
map("n", "<S-Tab>", "<cmd> BufferLineCyclePrev <CR>")
map('n', '<leader>1', '<Cmd>BufferLineGoToBuffer 1<CR>', options)
map('n', '<leader>2', '<Cmd>BufferLineGoToBuffer 2<CR>', options)
map('n', '<leader>3', '<Cmd>BufferLineGoToBuffer 3<CR>', options)
map('n', '<leader>4', '<Cmd>BufferLineGoToBuffer 4<CR>', options)
map('n', '<leader>5', '<Cmd>BufferLineGoToBuffer 5<CR>', options)
map('n', '<leader>6', '<Cmd>BufferLineGoToBuffer 6<CR>', options)
map('n', '<leader>7', '<Cmd>BufferLineGoToBuffer 7<CR>', options)
map('n', '<leader>8', '<Cmd>BufferLineGoToBuffer 8<CR>', options)
map('n', '<leader>n', 'o<Esc>', options , {desc = "Add new line under cursor"})
map('n', '<leader>N', 'O<Esc>', options , {desc = "Add new line above cursor"})



-- Replacing current word with some text
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
map("x", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- comment.nvim
map("n", "<leader>/", function() require("Comment.api").toggle.linewise.current() end)
map("v", "<leader>/", "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>")

-- fzf-lua
map('n', "<leader>ff", function() fzf_lua.files() end ,                 { desc = "Find files"})
map('n', "<leader>rr", function() fzf_lua.registers() end,              { desc = "Show Registers"})
map('n', "<leader>ls", function() fzf_lua.lsp_document_symbols() end,   { desc = "List Document Symbols"})
map('n', "<leader>fo", function() fzf_lua.oldfiles() end,               { desc = "Search old files"})
map('n', "<leader>lr", function() fzf_lua.lsp_references() end,         { desc = "List References"})


-- map('n', "<leader>ff", function() telescope.find_files({ hidden = true }) end , {desc = "Find files"})
-- map('n', "<leader>rr", function() fzf_lua.registers() end,                      {desc = "Show Registers"})
-- map('n', "<leader>ls", function() fzf_lua.lsp_document_symbols() end,           {desc = "List Document Symbols"})
-- map('n', "<leader>fo", function() telescope.oldfiles() end,                       {desc = "Search old files"})
-- map('n', "<leader>lr", function() fzf_lua.lsp_references() end,                 {desc = "List References"})

-- map("n", "<leader>f", vim.lsp.buf.format)

-- MiniIndentscope
map({"n", "v"}, "gt", "<CMD> lua MiniIndentscope.operator('top', true)<CR>")
map({"n", "v"}, "gb", "<CMD> lua MiniIndentscope.operator('bottom', true)<CR>")

-- Git keymaps
map("n", "<leader>gd", "<cmd> Gitsigns diffthis <CR>",                  { desc = "Diff Buffer" })
map("n", "<leader>gr", "<cmd> Gitsigns reset_buffer <CR>",              { desc = "Reset Buffer" })
map("n", "<leader>ga", "<cmd> Gitsigns stage_buffer<CR>",               { desc = "Diff Buffer" })
map("n", "<leader>gs", "<cmd>FzfLua git_status <CR>",                   { desc = "Display git status" })
map("n", "<leader>gc", function() require("tinygit").smartCommit() end, { desc = "git commit " } )
map("n", "<leader>gp", function() require("tinygit").push() end,        { desc = "git push" })



-- <leader>t--> Toggle Horizontal Terminal
-- <leader>v--> Toggle Vertical Terminal
map('n', '<leader>t', function () require("nvterm.terminal").toggle "horizontal" end ,
    { noremap = true, silent = true, desc = "Spwan Horizontal Terminal" })

map('n', '<leader>v', function() require("nvterm.terminal").toggle "vertical" end,
    { noremap = true, silent = true, desc = "Spwan Vertical Terminal" })


-- Allow Navigate Windows from terminal mode
map('t', '<Esc>', '<C-\\><C-n>', options)
map('t', '<C-h>', '<C-\\><C-n><C-w>h', options)
map('t', '<C-j>', '<C-\\><C-n><C-w>j', options)
map('t', '<C-k>', '<C-\\><C-n><C-w>k', options)
map('t', '<C-l>', '<C-\\><C-n><C-w>l', options)

-- Resize Buffers
map("n", "<Up>", ":resize +3<CR>", options)
map("n", "<Down>", ":resize -3<CR>", options)
map("n", "<Right>", ":vertical resize -3<CR>", options)
map("n", "<Left>", ":vertical resize +3<CR>", options)


-- Stay in indent mode
map("v", "<", "<gv", options)
map("v", ">", ">gv", options)

-- To Move through windows
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-k>", "<C-w><C-w>")
map("n", "<C-l>", "<C-w>l")


-- F5 to run current project in horizontal terminal
-- F6 to run current project in vertical terminal
map('n', '.', function() require("nvterm.terminal").send("./run", "horizontal") end,
    options, { desc = "Run Current file in Horizontal Terminal" })
map('n', '<leader>.', function() require("nvterm.terminal").send("./run", "vertical") end,
    options, { desc = "Run Current file in Vertical Terminal" })


map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

require "CustomScripts.build"

map("n", "<F7>", ':lua test()<CR>', options)
