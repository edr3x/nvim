vim.api.nvim_create_autocmd("PackChanged", {
    callback = function(ev)
        local name, kind = ev.data.spec.name, ev.data.kind
        if name == "peek.nvim" and (kind == "install" or kind == "update") then
            if not ev.data.active then
                vim.cmd.packadd("peek.nvim")
            end
            vim.system({ "deno", "task", "--quiet", "build:fast" }, { cwd = ev.data.path }):wait()
        end
    end,
})

vim.pack.add({ "gh:toppair/peek.nvim" })

vim.keymap.set("n", "<leader>md", function()
    local peek = require("peek")
    if peek.is_open() then
        peek.close()
    else
        peek.open()
    end
end, { desc = "Markdown Preview" })
