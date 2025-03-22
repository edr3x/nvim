return {
    "vyfor/cord.nvim",
    event = "BufReadPre",
    build = ":Cord update",
    opts = {
        lsp = {
            show_problem_count = true,
            severity = 3,
        },
    },
}
