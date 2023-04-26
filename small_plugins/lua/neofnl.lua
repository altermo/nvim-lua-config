local M={}
function M.create_fnl_obj()
    local m={}
    function m.__index(_,idx)
        if not M.fennel then
            M.fennel=dofile('/usr/share/lua/5.4/fennel.lua')
        end
        return M.fennel[idx]
    end
    return setmetatable({},m)
end
function M.setup()
    vim.fennel=M.create_fnl_obj()
    vim.api.nvim_create_user_command('FnlFile',function(args)
        M.create_fnl_obj().dofile(vim.fn.expand(args.args))
    end,{nargs=1})
end
return M
