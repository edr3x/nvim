return {
    "maskudo/devdocs.nvim",
    dependencies = {
        "folke/snacks.nvim",
    },
    lazy = false,
    keys = {
        {
            "<leader>ho",
            mode = "n",
            "<cmd>DevDocs get<cr>",
            desc = "Get Devdocs",
        },
        {
            "<leader>hi",
            mode = "n",
            "<cmd>DevDocs install<cr>",
            desc = "Install Devdocs",
        },
    },
    opts = {
        ensure_installed = {
            "go",
            "http",
            -- "css",
            -- "javascript",
            "lua~5.1",
            "rust",
        },
    },
}
