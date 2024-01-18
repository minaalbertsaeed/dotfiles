require "plugins"
local current_directory = vim.fn.expand("%:p:h") --Get the full path of the current file



function test()
    vim.ui.select({ 'test', 'lol', "asd" }, {
        prompt = 'Choose something',
        format_item = function(item)
            return "I'd like to choose " .. item
        end,
    }, function(choice)
        if choice == 'test' then
            vim.notify(choice, "INFO")
        elseif choice == 'lol' then
            vim.notify(choice, "ERROR")
        else
            vim.notify(choice, "WARN")
        end
    end)
end
