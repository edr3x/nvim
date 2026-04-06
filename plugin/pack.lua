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
