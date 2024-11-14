--- Lazy load shada
vim.o.shada=""
vim.api.nvim_create_autocmd({'CmdlineEnter','InsertEnter','SafeState'},{callback=function ()
    vim.o.shada="'200,/9,:50,<50,@9,s10"
    vim.cmd.rshada()
end,once=true})

--- Lazy load lazy.nvim
if vim.fn.bufname()~='' then
    require'plugins'
    return
end
vim.o.loadplugins=false
local idx=#package.loaders+1
local function f(m)
    assert(package.loaders[idx]==f) table.remove(package.loaders,idx)
    vim.o.loadplugins=true
    require'plugins'
    local ret=require(m)
    return function () return ret end
end
table.insert(package.loaders,f)
vim.api.nvim_create_autocmd({'SafeState'},{callback=function ()
    vim.o.loadplugins=true
    require'plugins'
    vim.cmd.doau'ColorScheme'
end,once=true})
