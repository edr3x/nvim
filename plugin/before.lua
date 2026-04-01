vim.pack.add({ "gh:bloznelis/before.nvim" })

local status_ok, before = pcall(require, "before")
if not status_ok then
    return
end

before.setup({
    history_size = 30,
})

vim.keymap.set("n", "gh", before.jump_to_last_edit, {})

vim.keymap.set("n", "gl", before.jump_to_next_edit, {})
