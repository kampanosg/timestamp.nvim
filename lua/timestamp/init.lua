local utils = require('timestamp.utils')
local M = {
    current_time = os.date,
    format = '%Y-%m-%dT%H:%M:%S',
}

M.setup = function (opts)
    for k, v in pairs(opts) do M[k] = v end
end

M.generate_formatted_static_timestamp = function ()
    local mode = vim.api.nvim_get_mode().mode
    if mode ~= 'v' then
        print('Please select text in visual mode')
        return
    end

    local visual_coords = utils.get_visual_selection_coords()

    local format = utils.get_text(visual_coords)
    if table.getn(format) == 0 then
        print('Please select text in visual mode')
        return
    end

    local timestamp = M.current_time(format[1])
    vim.api.nvim_buf_set_text(0, visual_coords.start_row, visual_coords.start_col, visual_coords.end_row, visual_coords.end_col, {timestamp})
end

M.generate_static_timestamp = function ()
    local timestamp = M.current_time(M.format)
    vim.api.nvim_put({timestamp}, 'c', true, true)
end

M.generate_current_timestamp = function ()
    local timestamp = os.date(M.format)
    vim.api.nvim_put({timestamp}, 'c', true, true)
end

return M
