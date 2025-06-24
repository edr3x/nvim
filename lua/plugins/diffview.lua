return {
    "sindrets/diffview.nvim",
    command = "DiffviewOpen",
    opts = function()
        return {
            merge_tool = {
                layout = "diff3_Mixed",
            },
        }
    end,
}
