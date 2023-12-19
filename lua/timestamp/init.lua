local M = {}

M.setup = function (opts)
end

M.convert = function ()
    local mode = vim.api.nvim_get_mode().mode
    if mode ~= 'v' then
        print('Please select a date first')
        return
    end

    local opts = {}
    local v_selection_start = vim.fn.getpos("v")  -- start of visual selection
    local v_selection_end = vim.fn.getpos(".")  -- end of visual selection

    P(v_selection_start)
    P(v_selection_end)

    local start_row = v_selection_start[2] - 1
    local start_col = v_selection_start[3] - 1
    local end_row = v_selection_end[2] - 1
    local end_col = v_selection_end[3] - 1

    local text = vim.api.nvim_buf_get_text(0, start_row, start_col, end_row, end_col, opts)
    P(text)

    return mode
end

return M
