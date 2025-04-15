local mod_cache = nil

---@param fname string
---@return string?
local function get_root(fname)
    if mod_cache and fname:sub(1, #mod_cache) == mod_cache then
        local clients = vim.lsp.get_clients({ name = "gopls" })
        if #clients > 0 then
            return clients[#clients].config.root_dir
        end
    end
    return vim.fs.root(fname, { "go.work", "go.mod", ".git" })
end

---@type vim.lsp.Config
return {
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    root_dir = function(bufnr, on_dir)
        local fname = vim.api.nvim_buf_get_name(bufnr)
        -- see: https://github.com/neovim/nvim-lspconfig/issues/804
        if mod_cache then
            on_dir(get_root(fname))
            return
        end
        local cmd = { "go", "env", "GOMODCACHE" }
        vim.system(cmd, { text = true }, function(output)
            if output.code == 0 then
                if output.stdout then
                    mod_cache = vim.trim(output.stdout)
                end
                on_dir(get_root(fname))
            else
                vim.notify(("[gopls] cmd failed with code %d: %s\n%s"):format(output.code, cmd, output.stderr))
            end
        end)
    end,
    settings = {
        gopls = {
            completeUnimported = true,
            usePlaceholders = true,
            gofumpt = true,
            staticcheck = true,
            analyses = {
                unusedparams = true,
            },
            hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
            },
        },
    },
}
