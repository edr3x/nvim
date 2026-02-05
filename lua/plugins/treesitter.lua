local ts_init = function()
    local ensure_installed = {
        "bash",
        "c",
        "cpp",
        "css",
        "dart",
        "dockerfile",
        "fish",
        "go",
        "graphql",
        "hcl",
        "helm",
        "html",
        "java",
        "javascript",
        "json",
        "llvm",
        "lua",
        "make",
        "markdown",
        "prisma",
        "proto",
        "python",
        "query",
        "rust",
        "scss",
        "svelte",
        "sql",
        "terraform",
        "toml",
        "tsx",
        "typescript",
        "vimdoc",
        "vue",
        "yaml",
        "zig",
    }

    local isnt_installed = function(lang)
        return #vim.api.nvim_get_runtime_file("parser/" .. lang .. ".*", false) == 0
    end

    local to_install = vim.tbl_filter(isnt_installed, ensure_installed)
    if #to_install > 0 then
        require("nvim-treesitter").install(to_install)
    end

    -- Ensure tree-sitter enabled after opening a file for target language
    local filetypes = {}
    for _, lang in ipairs(ensure_installed) do
        for _, ft in ipairs(vim.treesitter.language.get_filetypes(lang)) do
            table.insert(filetypes, ft)
        end
    end

    vim.api.nvim_create_autocmd("FileType", {
        desc = "Start treesitter",
        group = vim.api.nvim_create_augroup("start_treesitter", { clear = true }),
        pattern = filetypes,
        callback = function(ev)
            vim.treesitter.start(ev.buf)
        end,
    })
end

return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    branch = "main",
    build = ":TSUpdate",
    dependencies = {
        { "nvim-treesitter/nvim-treesitter-context", config = true },
    },
    init = ts_init(),
}
