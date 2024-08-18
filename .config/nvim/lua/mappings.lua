local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim" -- path where its going to be installed
vim.opt.rtp:prepend(lazypath)
require "plugins"


local map = vim.keymap.set
local options = { noremap = true, silent = true }
local fzf_lua = require('fzf-lua')
-- local harpoon = require("harpoon")


local telescope = require('telescope.builtin')
map("n", "<Esc>", "<cmd> :noh <CR>")

map("n", "<leader>q", "<cmd> :bd! <CR>",            { desc = "Close current buffer" })           --
map("n", "<leader>e", "<cmd> NvimTreeToggle <CR>",  { desc = "Open file explorer" })

-- Move group of lines
map('v', "K", ":m '<-2<CR>gv=gv", options) 
map('v', "J", ":m '>+1<CR>gv=gv", options)

-- Copy to System Clipboard
map({ 'n', 'v' }, "<leader>z", "\"+y", { desc = "Copy Text to System Clipboard" })

-- keeps what in paste register as is is 
map('v', "<leader>p", "\"_dP" )
map('v', "<leader>p", "\"_dP" )

-- Delete forever !!!
map({ 'n', 'v' }, "<leader>d", "\"_d",{ desc = "Delete Text forever" })

-- buffers
map("n", "<leader><Tab>", "<cmd> bnext <CR>")
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

-- Fzf-lua & Telescope Keymaps 
-- map('n', "<leader>ff",  function () telescope.find_files({ hidden = true, follow= true})  end,{ desc = "Find files" })
map('n', "<leader>ff",  function() fzf_lua.files() end                   , { desc = "Find files" })
map('n', "<leader>lg",  function() fzf_lua.live_grep() end               , { desc = "Live Grep" })
map('n', "<leader>fh",  function() fzf_lua.files({cwd = "~"}) end        , { desc = "Find files from ~" })
map('n', "<leader>lp",  "<cmd> Telescope projects<CR>"                   , { desc = "List Projects" })
map('n', "<leader>b" ,   function() fzf_lua.buffers() end                , { desc = "List Buffers" })
map('n', "<leader>rr",  function() fzf_lua.registers() end               , { desc = "Show Registers" })
map('n', "<leader>ls",  function() fzf_lua.lsp_document_symbols() end    , { desc = "List Document Symbols" })
map('n', "<leader>fo",  function() fzf_lua.oldfiles() end                , { desc = "Search old files" })
-- map('n', "<leader>lr",  function() fzf_lua.lsp_references() end         , { desc = "List References" })
map('n', "<leader>m" ,   function() fzf_lua.man_pages() end              , { desc = "Show man_pages" })
map("n", "<leader>S" , "<cmd>SymbolsOutline <cr>"                        , { desc = "Start SymbolsOutline" })
map("n", "<leader>T" , "<cmd>TroubleToggle <cr>"                         , { desc = "Start Trouble" })
map("n", "gr", vim.lsp.buf.references, opts)

-- harpoon bindings

-- REQUIRED
-- REQUIRED

-- map('n', "<leader>ha", function() harpoon:list():add() end)
-- map('n', "<leader>ht", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
-- map('n', "<leader>h1", function() harpoon:list():select(1) end)
-- map('n', "<leader>h2", function() harpoon:list():select(2) end)
-- map('n', "<leader>h3", function() harpoon:list():select(3) end)
-- map('n', "<leader>h4", function() harpoon:list():select(4) end)

-- MiniIndentscope
map({ "n", "v" }, "gt", "<CMD> lua MiniIndentscope.operator('top', true)<CR>"    , { desc = "Go to begining of the scope" })
map({ "n", "v" }, "gb", "<CMD> lua MiniIndentscope.operator('bottom', true)<CR>" , { desc = "Go to end of the scope" })


-- Git keymaps
map("n", "<leader>gd", "<cmd> Gitsigns diffthis <CR>"                   , { desc = "Diff Buffer" })
map("n", "<leader>gr", "<cmd> Gitsigns reset_buffer <CR>"               , { desc = "Reset Buffer" })
map("n", "<leader>ga", "<cmd> Gitsigns stage_buffer<CR>"                , { desc = "Diff Buffer" })
map("n", "<leader>gs", "<cmd>FzfLua git_status <CR>"                    , { desc = "Display git status" })
map("n", "<leader>gc", function() require("tinygit").smartCommit() end  , { desc = "git commit " })
map("n", "<leader>gp", function() require("tinygit").push() end         , { desc = "git push" })

-- Navigate Windows from terminal mode
map('t', '<Esc>', '<C-\\><C-n>'       , options)
map('t', '<C-h>', '<C-\\><C-n><C-w>h' , options)
map('t', '<C-j>', '<C-\\><C-n><C-w>j' , options)
map('t', '<C-k>', '<C-\\><C-n><C-w>k' , options)
map('t', '<C-l>', '<C-\\><C-n><C-w>l' , options)

-- Resize Buffers
map("n", "<Up>"    , ":resize +3<CR>"      , options)
map("n", "<Down>"  , ":resize -3<CR>"      , options)
map("n", "<Right>" , ":vert resize -3<CR>" , options)
map("n", "<Left>"  , ":vert resize +3<CR>" , options)

-- Stay in indent mode  
map("v", "<", "<gv", options)
map("v", ">", ">gv", options)

-- To Move among windows
map("n", "<C-h>", ":wincmd h <cr>")
map("n", "<C-j>", ":wincmd j <cr>")
map("n", "<C-k>", ":wincmd k <cr>")
map("n", "<C-l>", ":wincmd l <cr>")

-- To Move among nvim and tmux panes
map("n", "<C-h>", ":TmuxNavigateLeft <cr>")
map("n", "<C-j>", ":TmuxNavigateDown <cr>")
map("n", "<C-k>", ":TmuxNavigateUp<cr>")
map("n", "<C-l>", ":TmuxNavigateRight<cr>")

map("n", "<leader>i" ,"<CMD>Oil<CR>", { desc = "Open parent directory as a Buffer" })

require "CustomScripts.build"

map("n", "<F7>", ':lua test()<CR>', options)

local functions = require('my_functions')

-- Opening a termial window from Nvim (just a tmux pane)
map('n', '<leader>,' , function () functions.toggle_quickfix() end,     { desc = "Toggle Quickfix list " }                         , options)
map('n', '<leader>th', function () functions.open_tmux_pane(0) end,     { desc = "Open Horizontal Tmux Pane in current file dir" } , options)
map('n', '<leader>tv', function () functions.open_tmux_pane(1) end,     { desc = "Open Vertical Tmux Pane in current file dir" }   , options)

