require "plugins"
local current_directory = vim.fn.expand("%:p:h") --Get the full path of the current file



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

local Run = function(pat, command)
    vim.api.nvim_create_autocmd("BufWritePost", {
        group = vim.api.nvim_create_augroup("lol", { clear = true }),
        pattern = pat,

        callback = function()
            -- vim.fn.jobstart("", {
            --     stdout_buffered = true,
            --     on_stdout = function(_, data)
            --         if data then
            --             -- vim.api.
            --         end
            --     end,
            --
            --     -- if there is error in the job
            --     on_stderr = function(_, data)
            --         if data then
            --             -- vim.api.
            --         end
            --     end
            -- })
            print("asdsad")
        end

    })
end
--
vim.api.nvim_create_user_command("Zobry", function ()
    local test = vim.fn.input("asdsad: ")
end, {})
-- goto_def = function()
--     local ft = vim.api.nvim_buf_get_option(0, 'filetype')
--     if ft == 'man' then
--         vim.api.nvim_command(':Man ' .. vim.fn.expand('<cWORD>'))
--     elseif ft == 'help' then
--         vim.api.nvim_command(':help ' .. vim.fn.expand('<cword>'))
--     else
--         require'telescope.builtin'.lsp_definitions()
--     end
-- end
--
--
-- vim.keymap.set("n", "<F1>", goto_def())
