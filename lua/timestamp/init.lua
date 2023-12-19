local utils = require('timestamp.utils')
local M = {}

M.setup = function (opts)
    for k, v in pairs(opts) do M[k] = v end
end

M.convert = function ()
    local mode = vim.api.nvim_get_mode().mode
    if mode ~= 'v' then
        print('Please select a date first')
        return
    end

    local opts = {}
    local visual_coords = utils.get_visual_selection_coords()

    P(visual_coords)

    local text = vim.api.nvim_buf_get_text(0,
        visual_coords.start_row,
        visual_coords.start_col,
        visual_coords.end_row,
        visual_coords.end_col, opts)
    P(text)

    return mode
end

return M
