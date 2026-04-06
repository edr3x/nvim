return {
    settings = {
        gopls = {
            codelenses = {
                test = true,
                tidy = true,
                vendor = true,
                generate = true,
                gc_details = true,
                upgrade_dependency = true,
            },
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
