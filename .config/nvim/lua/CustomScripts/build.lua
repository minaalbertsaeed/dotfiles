
function test()
    local total_buffers = #vim.fn.getbufinfo({ buflisted = 1 })

    vim.ui.select({ 'test', 'lol', "asd", total_buffers }, {
        prompt = 'Choose something',
        format_item = function(item)
            return "I'd like to choose " .. item
        end,
    }, function(choice)
        if choice == 'test' then
            vim.notify(choice)
        elseif choice == 'lol' then
            vim.notify(choice)
        else
            vim.notify(choice)
        end
    end)
end
