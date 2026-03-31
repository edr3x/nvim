vim.api.nvim_create_autocmd("PackChanged", {
    callback = function(ev)
        local name, kind = ev.data.spec.name, ev.data.kind
        if name == "nvim-treesitter" and (kind == "install" or kind == "update") then
            vim.system({ "deno task --quiet build:fast" })
        end
    end,
})

vim.pack.add({ "https://github.com/toppair/peek.nvim" })

vim.keymap.set("n", "<leader>md", function()
    local peek = require("peek")
    if peek.is_open() then
        peek.close()
    else
        peek.open()
    end
end, { desc = "Markdown Preview" })

-- lazy.nvim way for reference
-- return {
--     "toppair/peek.nvim",
--     ft = "markdown",
--     build = "deno task --quiet build:fast",
--     keys = {
--         {
--             "<leader>md",
--             function()
--                 local peek = require("peek")
--                 if peek.is_open() then
--                     peek.close()
--                 else
--                     peek.open()
--                 end
--             end,
--             desc = "Markdown Preview",
--         },
--     },
-- }
