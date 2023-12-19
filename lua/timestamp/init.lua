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

    local visual_coords = utils.get_visual_selection_coords()
    P(visual_coords)

    local text = utils.get_text(visual_coords)
    P(text)

    return mode
end

return M
