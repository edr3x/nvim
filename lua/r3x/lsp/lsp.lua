return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'williamboman/mason.nvim', -- package manager for lsp, debug-adapters and more
        'williamboman/mason-lspconfig.nvim', -- for automatic installation of lsp servers
        'ray-x/lsp_signature.nvim', -- for hover signature help on insert mode
        'RRethy/vim-illuminate', -- highlight references
    },
    event = "BufReadPre",
    config = function()
        local servers = {
            'gopls',
            'prismals',
            'yamlls',
            'dockerls',
            -- 'rust_analyzer',
            -- 'pyright',
            -- 'graphql',
            -- 'tailwindcss',
            -- 'cssls',
        }

        require("mason").setup()
        require("mason-lspconfig").setup {
            ensure_installed = servers,
            automatic_installation = true,
        }

        for _, lsp in pairs(servers) do
            require("lspconfig")[lsp].setup {
                on_attach = require("r3x.handlers").on_attach,
                capabilities = require("r3x.handlers").capabilities,
            }
        end
        require("r3x.handlers").setup()
    end
}
