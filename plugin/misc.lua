vim.pack.add({
    "https://github.com/windwp/nvim-autopairs",
})

vim.keymap.set("n", "<leader>u", function()
    vim.cmd.packadd("nvim.undotree")
    require("undotree").open({
        command = "topleft 35vnew",
    })
end, { desc = "Toggle UndoTree" })
