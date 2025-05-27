local style = require("plugins.snacks.picker-style")

return {
    enabled = true,
    ui_select = true,
    reverse = true,
    prompt = "   ",
    matcher = { frecency = true },
    previewers = {
        git = {
            native = true,
            args = {
                "-c",
                "delta.side-by-side=false",
            },
        },
    },
    win = {
        preview = {
            wo = {
                number = false,
                foldcolumn = "0",
                signcolumn = "no",
                relativenumber = false,
            },
        },
    },
    sources = {
        grep = {
            win = {
                input = {
                    keys = {
                        ["<space><space>"] = {
                            "multi_grep",
                            desc = "Add -g flag on ripgrep",
                            mode = { "n", "i" },
                        },
                    },
                },
            },
            actions = {
                ["multi_grep"] = function(picker)
                    local current = picker.input:get()
                    picker.input:set("", current .. " -- -g=")
                    picker:find({ refresh = true })
                end,
            },
        },
    },
    layout = style.layout(),
    layouts = style.layouts,
}
