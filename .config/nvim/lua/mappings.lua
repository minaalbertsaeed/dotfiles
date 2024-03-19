local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim" -- path where its going to be installed
vim.opt.rtp:prepend(lazypath)
require "plugins"


local map = vim.keymap.set
local options = { noremap = true, silent = true }
local fzf_lua = require('fzf-lua')
local telescope = require('telescope.builtin')

map("n", "<leader>e", "<cmd> NvimTreeToggle <CR>",  { desc = "Open file explorer" })
map("n", "<leader>q", "<cmd> :bd! <CR>",            { desc = "Close current buffer" })           --
map("n", "<Esc>", "<cmd> :noh <CR>")


-- Move group of lines
map('v', "K", ":m '<-2<CR>gv=gv", options)
map('v', "J", ":m '>+1<CR>gv=gv", options)

-- Copy to System Clipboard
map({ 'n', 'v' }, "<leader>z", "\"+y", { desc = "Copy Text to System Clipboard" })

-- keeps what in paste register as is is 
map('v', "<leader>p", "\"_dP" )

-- Delete forever !!!
map({ 'n', 'v' }, "<leader>d", "\"_d",{ desc = "Delete Text forever" })

-- buffers
map("n", "<Tab>", "<cmd> bnext <CR>")
map('n', '<leader>1', '<Cmd>LualineBuffersJum 1<CR>', options)
map('n', '<leader>2', '<Cmd>LualineBuffersJum 2<CR>', options)
map('n', '<leader>3', '<Cmd>LualineBuffersJum 3<CR>', options)
map('n', '<leader>4', '<Cmd>LualineBuffersJum 4<CR>', options)
map('n', '<leader>5', '<Cmd>LualineBuffersJum 5<CR>', options)
map('n', '<leader>6', '<Cmd>LualineBuffersJum 6<CR>', options)
map('n', '<leader>7', '<Cmd>LualineBuffersJum 7<CR>', options)
map('n', '<leader>8', '<Cmd>LualineBuffersJum 8<CR>', options)

map('n', '<leader>n', 'o<Esc>', options, { desc = "Add new line under cursor" })
map('n', '<leader>N', 'O<Esc>', options, { desc = "Add new line above cursor" })

-- Replacing current word with some another
map({'n',  'x'}, "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],  { desc = "Replace Word Under cursor" })

-- comment.nvim
map("n", "<leader>/", function() require("Comment.api").toggle.linewise.current() end ,                 { desc = "Comment Current line" })
map("v", "<leader>/", "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>" , { desc = "Comment Current Block" })

-- fzf-lua
map('n', "<leader>ff", function() fzf_lua.files() end,                { desc = "Find files" })
map('n', "<leader>fh", function() fzf_lua.files({cwd = "~"}) end,     { desc = "Find files from ~" })
map('n', "<leader>sp", "<cmd> Telescope projects<CR>",                { desc = "List Projects" })
map('n', "<leader>b", function() fzf_lua.buffers() end,               { desc = "List Buffers" })
map('n', "<leader>rr", function() fzf_lua.registers() end,            { desc = "Show Registers" })
map('n', "<leader>ls", function() fzf_lua.lsp_document_symbols() end, { desc = "List Document Symbols" })
map('n', "<leader>fo", function() fzf_lua.oldfiles() end,             { desc = "Search old files" })
map('n', "<leader>lr", function() fzf_lua.lsp_references() end,       { desc = "List References" })
map("n", "<leader>S", "<cmd>SymbolsOutline <cr>" ,                    { desc = "List SymbolsOutline" })


-- MiniIndentscope
map({ "n", "v" }, "gt", "<CMD> lua MiniIndentscope.operator('top', true)<CR>" ,     { desc = "Go to begining of the scope" })
map({ "n", "v" }, "gb", "<CMD> lua MiniIndentscope.operator('bottom', true)<CR>" ,  { desc = "Go to end of the scope" })


-- Git keymaps
map("n", "<leader>gd", "<cmd> Gitsigns diffthis <CR>",                  { desc = "Diff Buffer" })
map("n", "<leader>gr", "<cmd> Gitsigns reset_buffer <CR>",              { desc = "Reset Buffer" })
map("n", "<leader>ga", "<cmd> Gitsigns stage_buffer<CR>",               { desc = "Diff Buffer" })
map("n", "<leader>gs", "<cmd>FzfLua git_status <CR>",                   { desc = "Display git status" })
map("n", "<leader>gc", function() require("tinygit").smartCommit() end, { desc = "git commit " })
map("n", "<leader>gp", function() require("tinygit").push() end,        { desc = "git push" })



function get_dir ()
   local dir = vim.fn.expand('%:p:h')
   local res = string.format('<cmd> ToggleTerm  dir=%s size=17 direction=horizontal<cr>', vim.fn.expand('%:p:h'))
   print(res)
   return res
end

--Terminal keymaps
map('n', '<leader>t','<cmd> ToggleTerm  size=17 direction=horizontal<cr> ',
    { desc = "Spwan Horizontal Terminal" }, options)

function getTerminal(position)
    local current_directory = vim.fn.expand("%:p:h") -- Get the full path of the current file
    local command = string.format("cd %s ; clear", current_directory)
    require("nvterm.terminal").send(command, position)
end

map('n', '<leader>c', ':lua getTerminal("horizontal")<CR>', { noremap = true, silent = true })

map('n', '<leader>v','<cmd> ToggleTerm  size=100 direction=vertical<cr> ',
    { desc = "Spwan Vertical Terminal" }, options )

-- Navigate Windows from terminal mode
map('t', '<Esc>', '<C-\\><C-n>', options)
map('t', '<C-h>', '<C-\\><C-n><C-w>h', options)
map('t', '<C-j>', '<C-\\><C-n><C-w>j', options)
map('t', '<C-k>', '<C-\\><C-n><C-w>k', options)
map('t', '<C-l>', '<C-\\><C-n><C-w>l', options)

-- Resize Buffers
map("n", "<Up>", ":resize +3<CR>", options)
map("n", "<Down>", ":resize -3<CR>", options)
map("n", "<Right>", ":vert resize -3<CR>", options)
map("n", "<Left>", ":vert resize +3<CR>", options)


-- Stay in indent mode
map("v", "<", "<gv", options)
map("v", ">", ">gv", options)

-- To Move through windows
map("n", "<C-h>", "<cmd> wincmd h <cr>")
map("n", "<C-j>" ,"<cmd> wincmd j <cr>")
map("n", "<C-k>", "<cmd> wincmd k <cr>")
map("n", "<C-l>", "<cmd> wincmd l <cr>")


-- Compiling Projects and files 
map('n', '.', '<cmd> TermExec  cmd="./run" size=20 direction=horizontal go_back=0 <cr>',
     { desc = "Run Current Projects in Horizontal Terminal" },options)

map('n', '<leader>.', '<cmd> TermExec  cmd="./run" size=100  direction=vertical go_back=0 <cr>' ,
     { desc = "Run Current Projects in Vertical Terminal" },options)


map("n", "<leader>i" ,"<CMD>Oil<CR>", { desc = "Open parent directory as a Buffer" })

require "CustomScripts.build"

-- Lua configuration to open terminal in current buffer's directory
vim.api.nvim_set_keymap('n', '<F11>', ':lua require("toggleterm").exec("cd " .. vim.fn.expand("%:p:h"))<CR>', {noremap = true, silent = true})


map("n", "<F7>", ':lua test()<CR>', options)
