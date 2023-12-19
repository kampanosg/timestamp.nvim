local utils = {}

function utils.get_visual_selection_coords()
    local v_start = vim.fn.getpos("v")
    local v_end = vim.fn.getpos(".")

    local start_row = v_start[2] - 1
    local start_col = v_start[3] - 1
    local end_row = v_end[2] - 1
    local end_col = v_end[3] - 1

    -- need to check if the selection is reversed
    -- if so, swap the start and end
    if start_row > end_row then
        start_row, end_row = end_row, start_row
    end

    if start_col > end_col then
        start_col, end_col = end_col, start_col
    end

    return {
        start_row = start_row,
        start_col = start_col,
        end_row = end_row,
        end_col = end_col
    }
end

function utils.get_text(coords)
    return vim.api.nvim_buf_get_text(0,
        coords.start_row,
        coords.start_col,
        coords.end_row,
        coords.end_col, {})
end

return utils
