vim.pack.add({
    "gh:folke/lazydev.nvim",
    "gh:mason-org/mason.nvim",
    "gh:neovim/nvim-lspconfig",
    "gh:edr3x/vim-illuminate",
})

require("lazydev").setup({
    library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
    },
})

require("mason").setup()

require("illuminate").configure({
    delay = 200,
    large_file_cutoff = 2000,
    large_file_overrides = {
        providers = { "lsp" },
    },
})

---[[ LSP configuration
local registry = require("mason-registry")

local ensure_installed = {
    "buf",
    "gopls",
    "stylua",
    "clangd",
    "yamllint",
    "prettierd",
    "rust-analyzer",
    "lua-language-server",
    "typescript-language-server",
    "dockerfile-language-server",
}

registry.refresh(function()
    for _, name in ipairs(ensure_installed) do
        local ok, pkg = pcall(registry.get_package, name)
        if ok and not pkg:is_installed() then
            pkg:install()
        end
    end

    -- Collect LSPs
    local lspNames = {}

    for _, pkg in ipairs(registry.get_installed_packages()) do
        local spec = pkg.spec
        if spec.neovim and spec.neovim.lspconfig then
            table.insert(lspNames, spec.neovim.lspconfig)
        end
    end

    vim.lsp.enable(lspNames)
end)
---]]

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
    signs = {
        text = {
            [vim.diagnostic.severity.HINT] = " ",
            [vim.diagnostic.severity.INFO] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.ERROR] = " ",
        },
    },
})

vim.api.nvim_create_autocmd("LspAttach", {
    desc = "LSP actions",
    callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        if not client then
            return
        end

        ---[[ Format and autoimport on Save
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = args.buf,
            callback = function()
                if client:supports_method("textDocument/formatting") then
                    vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
                end

                if client:supports_method("textDocument/codeAction") then
                    local function apply_code_action(action_type)
                        local params = {
                            textDocument = vim.lsp.util.make_text_document_params(args.buf),
                            range = {
                                start = { line = 0, character = 0 },
                                ["end"] = { line = vim.api.nvim_buf_line_count(args.buf), character = 0 },
                            },
                        }

                        ---@diagnostic disable-next-line: inject-field
                        params.context = { only = action_type, diagnostics = {} }
                        local result = vim.lsp.buf_request_sync(args.buf, "textDocument/codeAction", params, 1000)
                        for _, res in pairs(result or {}) do
                            for _, action in pairs(res.result or {}) do
                                if action.edit then
                                    vim.lsp.util.apply_workspace_edit(action.edit, client.offset_encoding)
                                elseif action.command then
                                    client:exec_cmd(action.command, { bufnr = args.buf })
                                end
                            end
                        end
                    end

                    apply_code_action({ "source.fixAll" })
                    apply_code_action({ "source.organizeImports" })
                end
            end,
        })
        ---]]

        if client:supports_method("textDocument/codeLens") then
            vim.lsp.codelens.enable()
        end

        ---[[ Disable default formatting
        if client.name == "tsserver" then
            client.server_capabilities.documentFormattingProvider = false
        end

        if client.name == "lua_ls" then
            client.server_capabilities.documentFormattingProvider = false
        end
        ---]]

        ---[[ Lsp Keymaps
        local nmap = function(keys, func, desc)
            if desc then
                desc = "LSP: " .. desc
            end
            vim.keymap.set("n", keys, func, { buffer = args.buf, noremap = true, silent = true, desc = desc })
        end

        nmap("K", vim.lsp.buf.hover, "Open hover")
        nmap("<leader>r", vim.lsp.buf.rename, "Rename")
        nmap("<leader>dr", vim.lsp.buf.references, "References")
        nmap("<leader>ca", vim.lsp.buf.code_action, "Code action")
        nmap("<leader>df", vim.lsp.buf.definition, "Goto definition")
        nmap("<leader>di", vim.lsp.buf.implementation, "Goto implimentation")
        nmap("<leader>ds", "<cmd>vs | lua vim.lsp.buf.definition()<cr>", "Goto definition (v-split)")
        nmap("<leader>dh", "<cmd>sp | lua vim.lsp.buf.definition()<cr>", "Goto definition (h-split)")
        nmap("<leader>cl", vim.lsp.codelens.run, "Open Codelens")

        -- Diagnostic
        nmap("dn", function()
            vim.diagnostic.jump({ count = 1, float = true })
        end, "Goto next diagnostic")
        nmap("dN", function()
            vim.diagnostic.jump({ count = -1, float = true })
        end, "Goto prev diagnostic")
        nmap("<leader>q", vim.diagnostic.setloclist, "Open diagnostics list")
        nmap("<leader>e", vim.diagnostic.open_float, "Open diagnostic float")

        vim.keymap.set("i", "<M-t>", vim.lsp.buf.signature_help, { buffer = args.buf })

        -- inlay hints
        nmap("<leader>lh", function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
        end, "Toggle inlay hints")

        vim.api.nvim_buf_create_user_command(args.buf, "Fmt", function(_)
            vim.lsp.buf.format()
        end, { desc = "Format current buffer with LSP" })
        ---]]
    end,
})
