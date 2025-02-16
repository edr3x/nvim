return {
    "vyfor/cord.nvim",
    build = ":Cord update",
    opts = {
        lsp = {
            show_problem_count = true,
            severity = 3,
        },
    },
}
