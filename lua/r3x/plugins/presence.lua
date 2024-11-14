return {
    "vyfor/cord.nvim",
    build = "./build || .\\build",
    event = "VeryLazy",
    opts = {
        lsp = {
            show_problem_count = true,
            severity = 3,
        },
    },
}
