require "plugins"
local current_directory = vim.fn.expand("%:p:h") --Get the full path of the current file

local filetype = vim.fn.expand("&filetype")

-- function getTerminal(position, cmd)
--     local current_directory = vim.fn.expand("%:p:h") --Get the full path of the current file
--     -- local command = string.format("cd %s ; clear; %s", current_directory, cmd)
--     local command = string.format("cd %s; %s", current_directory, cmd)
--     require("nvterm.terminal").send(command, position)
-- end

-- function Compile()
--     if filetype:lower() == "rust" then
--         local str = string.format("echo %s", filetype)
--         vim.cmd(str)
--         require("nvterm.terminal").send("cargo run", "horizontal")
--     end
-- end
--

function test()
      vim.ui.select({ 'tabs', 'spaces' }, {
         prompt = 'Select tabs or spaces:',
         format_item = function(item)
             return "I'd like to choose " .. item
         end,
     }, function(choice)
         if choice == 'spaces' then
             vim.o.expandtab = true
         else
             vim.o.expandtab = false
         end
     end)
end
