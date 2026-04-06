require("vim._core.ui2").enable({ enable = true }) -- `:h ui2` for more options

local progress_win = nil
local progress_buf = nil

local function close_progress()
    if progress_win and vim.api.nvim_win_is_valid(progress_win) then
        vim.api.nvim_win_close(progress_win, true)
    end
    progress_win = nil
    progress_buf = nil
end

local function show_progress(msg)
    if not progress_buf or not vim.api.nvim_buf_is_valid(progress_buf) then
        progress_buf = vim.api.nvim_create_buf(false, true)
        vim.bo[progress_buf].bufhidden = "wipe"
    end

    vim.api.nvim_buf_set_lines(progress_buf, 0, -1, false, { " " .. msg .. " " })

    local width = #msg + 2
    local row = vim.o.lines - 5
    local col = vim.o.columns - width - 4

    local opts = {
        relative = "editor",
        row = row,
        col = col,
        width = width,
        height = 1,
        style = "minimal",
        focusable = false,
        zindex = 50,
    }

    if progress_win and vim.api.nvim_win_is_valid(progress_win) then
        vim.api.nvim_win_set_config(progress_win, opts)
    else
        progress_win = vim.api.nvim_open_win(progress_buf, false, opts)

        -- Ghost-text feel: blend into background
        vim.wo[progress_win].winblend = 40
        vim.wo[progress_win].winhighlight = "Normal:Comment"
    end
end

vim.api.nvim_create_autocmd("LspProgress", {
    callback = function(ev)
        local value = ev.data.params.value

        if value.kind == "end" then
            -- Show "done" briefly, then close
            show_progress("✓ " .. (value.title or "LSP") .. " done")
            vim.defer_fn(close_progress, 1500)
        else
            local msg = (value.title or "LSP")
            if value.message then
                msg = msg .. ": " .. value.message
            end
            if value.percentage then
                msg = msg .. " " .. value.percentage .. "%"
            end
            show_progress("⟳ " .. msg)
        end
    end,
})
