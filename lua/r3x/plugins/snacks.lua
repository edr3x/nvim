return {
    "folke/snacks.nvim",
    dependencies = {
        {
            "folke/persistence.nvim",
            event = "BufReadPre",
            opts = {},
        },
    },
    priority = 1000,
    lazy = false,
    keys = {
        { "<leader>ntt", "<cmd>lua Snacks.explorer()<CR>", desc = "File Explorer" },
        { "<leader>bd", "<cmd>lua Snacks.bufdelete()<CR>", desc = "Delete buffer" },
        { "<leader>ff", "<cmd>lua Snacks.picker.files()<CR>", desc = "Find all files" },
        { "<leader>gs", "<cmd>lua Snacks.picker.git_status()<CR>", desc = "Git status" },
        { "<leader>fr", "<cmd>lua Snacks.picker.resume()<CR>", desc = "Resume last search" },
        { "<leader>fb", "<cmd>lua Snacks.picker.buffers()<CR>", desc = "List Opened Buffers" },
        { "<leader>fs", "<cmd>lua Snacks.picker.lsp_symbols() <CR>", desc = "List lsp symbols" },
        { "<leader>ba", "<cmd>lua Snacks.bufdelete.other()<CR>", desc = "Delete all other buffer" },
    },
    opts = {
        input = { enabled = true },
        image = { enabled = false },
        bigfile = { enabled = true },
        indent = {
            priority = 1,
            enabled = true,
            scope = { char = "┊" },
            indent = { char = "┊" },
            animate = { enabled = false },
            filter = function(_)
                return vim.bo.filetype == "yaml"
            end,
        },
        picker = {
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
        },
        dashboard = {
            enabled = true,
            width = math.min(math.max(vim.o.columns - 10, 40), 60),
            preset = {
                keys = {
                    { icon = " ", key = "s", desc = "Restore Session", section = "session" },
                    { icon = " ", key = "t", desc = "File Tree", action = ":Oil" },
                    { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
                    {
                        icon = " ",
                        key = "f",
                        desc = "Find Files",
                        action = ":lua Snacks.picker.files()",
                    },
                    {
                        icon = " ",
                        key = "c",
                        desc = "Config",
                        action = ":lua Snacks.picker.files({ cwd = vim.fn.stdpath('config') })",
                    },
                    {
                        icon = "󰒲 ",
                        key = "l",
                        desc = "Lazy",
                        action = ":Lazy",
                        enabled = package.loaded.lazy ~= nil,
                    },
                    { icon = " ", key = "q", desc = "Quit", action = ":qa" },
                },
                header = [[
                
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝



]],
            },
            sections = {
                { section = "header" },
                { section = "keys", gap = 1, padding = 1 },
                { section = "startup" },
            },
        },
    },
}
