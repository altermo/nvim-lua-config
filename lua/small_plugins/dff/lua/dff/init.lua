---@class dff.config
---@field wintype 'current'|'float'--|'split'|'vsplit'|function
---@field wjust number
---@field hjust number
---@field ending string
---@field skipsingle boolean
local default_conf={
    wintype='current',
    wjust=10,
    hjust=3,
    ending='\n',
    skipstring=true,
}

local file_expl=require'dff.file_expl'
local M={default_conf=default_conf,config=default_conf}
---@param config dff.config
function M.setup(config)
    M.config=vim.tbl_extend('force',M.default_conf,config or {})
    vim.api.nvim_create_user_command('Dff',file_expl.com_open,{nargs='?',complete='dir'})
end
return M
