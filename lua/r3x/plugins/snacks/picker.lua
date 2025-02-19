return {
    enabled = true,
    ui_select = true,
    reverse = true,
    prompt = "   ",
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
    layout = function()
        return vim.o.columns >= 120 and "my_picker" or "my_picker_vertical"
    end,
    layouts = {
        my_picker = {
            reverse = false,
            layout = {
                box = "horizontal",
                backdrop = false,
                width = 0.90,
                height = 0.85,
                border = "none",
                {
                    box = "vertical",
                    {
                        win = "input",
                        height = 1,
                        border = "rounded",
                        title = "{title}",
                        title_pos = "center",
                    },
                    { win = "list", title = " Results ", title_pos = "center", border = "rounded" },
                },
                {
                    win = "preview",
                    title = "{preview:Preview}",
                    width = 0.60,
                    border = "rounded",
                    title_pos = "center",
                },
            },
        },
        my_picker_vertical = {
            layout = {
                box = "vertical",
                backdrop = false,
                width = 0.5,
                min_width = 80,
                height = 0.8,
                min_height = 30,
                border = "none",
                {
                    win = "input",
                    height = 1,
                    border = "rounded",
                    title = "{title} {live} {flags}",
                    title_pos = "center",
                },
                {
                    win = "list",
                    title = " Results ",
                    title_pos = "center",
                    border = "rounded",
                },
                {
                    win = "preview",
                    title = "{preview:Preview}",
                    title_pos = "center",
                    border = "rounded",
                },
            },
        },
    },
}
