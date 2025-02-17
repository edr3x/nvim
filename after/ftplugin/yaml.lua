vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

local status_ok, snacks = pcall(require, "snacks")
if not status_ok then
    return
end

snacks.indent.enable()
