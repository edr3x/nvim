vim.api.nvim_create_user_command("PackClean", function()
    local to_delete = vim.iter(vim.pack.get())
        :filter(function(x)
            return not x.active
        end)
        :map(function(x)
            return x.spec.name
        end)
        :totable()

    if #to_delete == 0 then
        print("No inactive plugins to remove")
        return
    end

    vim.pack.del(to_delete)
    print("Removed plugins: " .. table.concat(to_delete, ", "))
end, {})

vim.api.nvim_create_user_command("Reboot", function()
    local session = vim.fn.stdpath("state") .. "/restart_session.vim"
    vim.cmd("mksession! " .. vim.fn.fnameescape(session))
    vim.cmd("restart source " .. vim.fn.fnameescape(session))
end, { desc = "Restart Neovim" })
