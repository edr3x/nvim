local signs = {
    { name = "DiagnosticSignError", text = " " },
    { name = "DiagnosticSignWarn", text = " " },
    { name = "DiagnosticSignHint", text = " " },
    { name = "DiagnosticSignInfo", text = " " },
}

for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, {
        texthl = sign.name,
        text = sign.text,
        numhl = "",
    })
end

vim.diagnostic.config({
    virtual_text = true,
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
        focusable = true,
        style = "minimal",
        border = "rounded",
        source = true,
        header = "",
        prefix = "",
    },
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    signs = true,
    underline = true,
    virtual_text = {
        spacing = 5,
        min = vim.diagnostic.severity.HINT,
    },
    update_in_insert = true,
})

vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank({
            higroup = "IncSearch", -- see `:highlight` for more options
            timeout = 200,
        })
    end,
})

-- format on save
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client then
            return
        end

        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = args.buf,
            callback = function()
                if client.supports_method("textDocument/formatting") then
                    vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
                end

                if client.supports_method("textDocument/codeAction") then
                    local function apply_code_action(only)
                        local actions = vim.lsp.buf.code_action({
                            ---@diagnostic disable-next-line
                            context = { only = only },
                            apply = true,
                            return_actions = true,
                        })
                        -- only apply if code action is available
                        if actions and #actions > 0 then
                            ---@diagnostic disable-next-line
                            vim.lsp.buf.code_action({ context = { only = only }, apply = true })
                        end
                    end
                    apply_code_action({ "source.fixAll" })
                    apply_code_action({ "source.organizeImports" })
                end
            end,
        })
    end,
})

vim.cmd([[autocmd FileType * set formatoptions-=ro]])
