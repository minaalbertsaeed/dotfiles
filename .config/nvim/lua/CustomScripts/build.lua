local M = {}
function M.test()
   -- Use vim.fn.expand to get the expanded path of the current file_dir's directory
    local file_path = vim.api.nvim_buf_get_name(0)
    local file_dir = vim.fn.fnamemodify(file_path, ":p:h")
    -- local base = vim.fn.findfile('Makefile', vim.fn.expand("%:p:h") .. ";")
    local base = vim.fn.finddir('nvim', vim.fn.expand("%:p:h") .. ";")

    -- Display the file_dir path in the prompt
    vim.ui.select({ 'test', 'lol', "asd", file_dir , base}, {
        prompt = 'Choose something from ' .. file_dir,
        format_item = function(item)
            return "I'd like to choose " .. item
        end,
    }, function(choice)
        if choice == 'test' then
            vim.notify(base)
        elseif choice == 'lol' then
            vim.notify(choice)
        else
            vim.notify(choice)
        end
    end)
end
return M

