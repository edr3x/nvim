vim.api.nvim_create_autocmd("PackChanged", {
    callback = function(ev)
        local name, kind = ev.data.spec.name, ev.data.kind
        if name == "cord" and kind == "update" then
            if not ev.data.active then
                vim.cmd.packadd("cord")
            end
            vim.cmd("Cord update")
        end
    end,
})

vim.pack.add({
    "https://github.com/vyfor/cord.nvim",
})

require("cord").setup({
    lsp = {
        show_problem_count = true,
        severity = 3,
    },
})
