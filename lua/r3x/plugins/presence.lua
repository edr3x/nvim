return {
    "vyfor/cord.nvim",
    branch = "client-server",
    build = ":Cord update",
    opts = {
        lsp = {
            show_problem_count = true,
            severity = 3,
        },
    },
}
