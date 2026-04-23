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

vim.api.nvim_create_user_command("Restart", function()
    local this_session = vim.fs.normalize(vim.v.this_session)
    local del_session = nil
    if this_session == "" then
        local _, filename = vim.loop.fs_mkstemp(vim.fn.stdpath("run") .. "/restart_session_XXXXXX")
        this_session = vim.fs.abspath(filename)
        del_session = this_session
    end

    local session_arg = vim.fn.fnameescape(this_session)
    vim.cmd("mksession! " .. session_arg)

    local lua_path = session_arg:gsub("\\", "\\\\")
    local after = {
        'vim.cmd("source ' .. lua_path .. '")',
        "vim.o.termguicolors = " .. tostring(vim.o.termguicolors),
        'vim.notify("Restarted")',
    }
    if del_session ~= nil then
        table.insert(after, 2, "pcall(vim.fs.rm, " .. vim.inspect(this_session) .. ")")
        table.insert(after, 3, 'vim.v.this_session = ""')
    end

    local ok, err = pcall(vim.cmd --[[@as function]], "restart lua " .. table.concat(after, ";"))
    if not ok then
        if del_session then
            pcall(vim.fs.rm, this_session)
        end
        vim.notify("Restart failed: " .. tostring(err), vim.log.levels.ERROR)
    end
end, { desc = "Restart Neovim" })
