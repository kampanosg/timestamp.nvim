local utils = require('timestamp.utils')
local M = {
    current_time = os.date,
    format = '%Y-%m-%dT%H:%M:%S',
}

M.setup = function (opts)
    for k, v in pairs(opts) do M[k] = v end
end

M.gen_static_fts = function ()
    local mode = vim.api.nvim_get_mode().mode
    if mode ~= 'v' then
        print('Please select text in visual mode')
        return
    end

    local visual_coords = utils.get_visual_selection_coords()

    local format = utils.get_text(visual_coords)
    if #format == 0 then
        print('Please select text in visual mode')
        return
    end

    local timestamp = M.current_time(format[1])
    utils.set_text(visual_coords, {timestamp})
end

M.gen_fts = function ()
    local mode = vim.api.nvim_get_mode().mode
    if mode ~= 'v' then
        print('Please select text in visual mode')
        return
    end

    local visual_coords = utils.get_visual_selection_coords()

    local format = utils.get_text(visual_coords)
    if #format == 0 then
        print('Please select text in visual mode')
        return
    end

    local timestamp = os.date(format[1])
    utils.set_text(visual_coords, {timestamp})
end

M.gen_static_ts = function ()
    local timestamp = M.current_time(M.format)
    vim.api.nvim_put({timestamp}, 'c', true, true)
end

M.gen_ts = function ()
    local timestamp = os.date(M.format)
    vim.api.nvim_put({timestamp}, 'c', true, true)
end

return M
