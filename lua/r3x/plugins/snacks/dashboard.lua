return {
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
}
