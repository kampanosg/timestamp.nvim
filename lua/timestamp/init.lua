local utils = require('timestamp.utils')
local M = {
    current_time = os.date,
    format = '%Y-%m-%dT%H:%M:%S',
}

M.setup = function (opts)
    for k, v in pairs(opts) do M[k] = v end
end

M.convert = function ()
    local mode = vim.api.nvim_get_mode().mode
    if mode ~= 'v' then
        print('Please select a date first')
        return
    end

    local visual_coords = utils.get_visual_selection_coords()
    P(visual_coords)

    local text = utils.get_text(visual_coords)
    P(text)

    return mode
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
