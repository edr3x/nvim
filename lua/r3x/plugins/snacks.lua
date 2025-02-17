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
        { "<leader>bd", "<cmd>lua Snacks.bufdelete()<CR>", desc = "Delete buffer" },
        { "<leader>ba", "<cmd>lua Snacks.bufdelete.other()<CR>", desc = "Delete buffer" },
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
                        action = ":lua require('telescope.builtin').find_files()",
                    },
                    {
                        icon = " ",
                        key = "c",
                        desc = "Config",
                        action = ":cd $HOME/.config/nvim | lua require('telescope.builtin').find_files()",
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
