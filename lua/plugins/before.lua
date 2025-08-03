return {
    "bloznelis/before.nvim",
    event = "BufReadPre",
    config = function()
        local before = require("before")
        before.setup({
            history_size = 30,
        })

        vim.keymap.set("n", "gh", before.jump_to_last_edit, {})

        vim.keymap.set("n", "gl", before.jump_to_next_edit, {})
    end,
}
