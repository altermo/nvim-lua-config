local M={}
function M.require(name,conf)
    local err,ret=pcall(require,'small_plugins.'..name)
    if err then
        ret.setup(conf)
        return
    end
    vim.opt.runtimepath:append(
        vim.fs.joinpath(vim.fn.stdpath'config','/lua/small_plugins',name)
    )
    if conf then
        require(name).setup(conf)
    end
end
function M.setup(conf)
    for k,v in pairs(conf) do
        if type(k)=='string' and type(v)=='table' then
            M.require(k,v)
        elseif type(k)=='number' and type(v)=='string' then
            M.require(v)
        end
    end
end
return M
