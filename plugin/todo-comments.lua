vim.pack.add({
    "gh:folke/todo-comments.nvim",
})

local td = require("todo-comments")

td.setup()

vim.keymap.set("n", "tn", function()
    require("todo-comments").jump_next()
end, { desc = "next marked comment" })

vim.keymap.set("n", "tN", function()
    require("todo-comments").jump_prev()
end, { desc = "prev marked comment" })

vim.keymap.set("n", "<leader>ft", ":lua Snacks.picker.todo_comments()<CR>", { desc = "search todo comments" })
