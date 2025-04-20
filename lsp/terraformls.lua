---@type vim.lsp.Config
return {
    cmd = { "terraform-ls", "serve" },
    filetypes = { "terraform", "terraform-vars", "tf" },
    root_markers = { ".terraform", ".git" },
}
