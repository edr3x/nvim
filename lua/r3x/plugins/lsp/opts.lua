local M = {}

M.capabilities = require("blink.cmp").get_lsp_capabilities()

M.on_attach = function(client, bufnr)
    if client.name == "tsserver" then
        client.server_capabilities.documentFormattingProvider = false
    end

    if client.name == "lua_ls" then
        client.server_capabilities.documentFormattingProvider = false
    end

    local nmap = function(keys, func, desc)
        if desc then
            desc = "LSP: " .. desc
        end
        vim.keymap.set("n", keys, func, { buffer = bufnr, noremap = true, silent = true, desc = desc })
    end

    nmap("K", vim.lsp.buf.hover, "Open hover")
    nmap("<leader>r", vim.lsp.buf.rename, "Rename")
    nmap("<leader>dr", vim.lsp.buf.references, "References")
    nmap("<leader>ca", vim.lsp.buf.code_action, "Code action")
    nmap("<leader>df", vim.lsp.buf.definition, "Goto definition")
    nmap("<leader>ds", "<cmd>vs | lua vim.lsp.buf.definition()<cr>", "Goto definition (v-split)")
    nmap("<leader>dh", "<cmd>sp | lua vim.lsp.buf.definition()<cr>", "Goto definition (h-split)")

    -- Diagnostic
    nmap("dn", vim.diagnostic.goto_next, "Goto next diagnostic")
    nmap("dN", vim.diagnostic.goto_prev, "Goto prev diagnostic")
    nmap("<leader>q", vim.diagnostic.setloclist, "Open diagnostics list")
    nmap("<leader>e", vim.diagnostic.open_float, "Open diagnostic float")

    vim.keymap.set("i", "<M-t>", vim.lsp.buf.signature_help, { buffer = bufnr })

    -- inlay hints
    nmap("<leader>lh", function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    end, "Toggle inlay hints")

    require("illuminate").configure({
        delay = 200,
        large_file_cutoff = 2000,
        large_file_overrides = {
            providers = { "lsp" },
        },
    })

    vim.api.nvim_buf_create_user_command(bufnr, "Fmt", function(_)
        vim.lsp.buf.format()
    end, { desc = "Format current buffer with LSP" })

    require("illuminate").on_attach(client)
end

return M
