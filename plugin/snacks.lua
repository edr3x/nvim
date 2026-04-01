vim.pack.add({
    "gh:folke/snacks.nvim",
    "gh:folke/persistence.nvim",
})

local dashboard = {
    enabled = true,
    width = math.min(math.max(vim.o.columns - 10, 40), 60),
    preset = {
        keys = {
            { icon = " ", key = "s", desc = "Restore the session", action = ':lua require("persistence").load()' },
            { icon = " ", key = "t", desc = "File Tree", action = ":Oil" },
            { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
            { icon = " ", key = "f", desc = "Find Files", action = ":lua Snacks.picker.files()" },
            { icon = " ", key = "g", desc = "Grep Files", action = ":lua Snacks.picker.grep()" },
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
    },
}

local indent = {
    priority = 1,
    enabled = true,
    scope = { char = "┊" },
    indent = { char = "┊" },
    animate = { enabled = false },
}

local styles = {
    input = {
        col = 0,
        row = -3,
        width = 40,
        relative = "cursor",
    },
}

local style = require("utils.picker-style")

local picker = {
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

require("persistence").setup({})

require("snacks").setup({
    input = { enabled = true },
    image = { enabled = false },
    bigfile = { enabled = true },
    styles = styles,
    indent = indent,
    picker = picker,
    dashboard = dashboard,
})

vim.api.nvim_create_user_command("R", function()
    require("persistence").load()
end, { desc = "restore session" })

vim.keymap.set("n", "<leader>fg", "<cmd>lua Snacks.picker.grep()<CR>", { desc = "Grep" })
vim.keymap.set("n", "<leader>tt", "<cmd>lua Snacks.explorer()<CR>", { desc = "File Explorer" })
vim.keymap.set("n", "<leader>bd", "<cmd>lua Snacks.bufdelete()<CR>", { desc = "Delete buffer" })
vim.keymap.set("n", "<leader>ff", "<cmd>lua Snacks.picker.files()<CR>", { desc = "Find all files" })
vim.keymap.set("n", "<leader>gs", "<cmd>lua Snacks.picker.git_status()<CR>", { desc = "Git status" })
vim.keymap.set("n", "<leader>fr", "<cmd>lua Snacks.picker.resume()<CR>", { desc = "Resume last search" })
vim.keymap.set("n", "<leader>fb", "<cmd>lua Snacks.picker.buffers()<CR>", { desc = "List Opened Buffers" })
vim.keymap.set("n", "<leader>fs", "<cmd>lua Snacks.picker.lsp_symbols() <CR>", { desc = "List lsp symbols" })
vim.keymap.set("n", "<leader>ba", "<cmd>lua Snacks.bufdelete.other()<CR>", { desc = "Delete all other buffer" })

vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = "*",
    callback = function()
        if vim.bo.filetype == "yaml" or vim.bo.filetype == "yaml.helm-values" then
            require("snacks").indent.enable()
            return
        end
        require("snacks").indent.disable()
    end,
})
