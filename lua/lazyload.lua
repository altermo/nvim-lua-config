vim.api.nvim_create_autocmd('VimEnter',{callback=function ()
    if vim.api.nvim_buf_line_count(0)>1 or
        vim.api.nvim_buf_get_lines(0,0,-1,false)[1]~='' or
        vim.api.nvim_buf_get_name(0)~='' then return end
    vim.bo.buftype='nofile'
end,once=true})
vim.api.nvim_create_autocmd('BufReadPre',{callback=function (ev)
    if vim.o.buftype~='' then return end
    vim.schedule(function () pcall(vim.cmd.lcd,vim.fs.root(ev.file,'.git') or vim.fs.dirname(ev.file)) end)
end,group=vim.api.nvim_create_augroup('AutoCd',{})})

vim.o.shada=""
vim.api.nvim_create_autocmd({'CmdlineEnter','InsertEnter','SafeState'},{callback=function ()
    require'autocmds'
    vim.o.shada="'500,/9,:50,<50,@9,s10"
    vim.cmd.rshada()
    require'options'
    require'other'
    require'keymaps'
    vim.o.loadplugins=true require'plugins'
    vim.cmd.doau'ColorScheme'
end,once=true})

vim.o.loadplugins=false
local function f(m)
    package.loaders=vim.tbl_filter(function (x) return x~=f end,package.loaders)
    vim.o.loadplugins=true require'plugins'
    local ret=require(m)
    return function () return ret end
end
table.insert(package.loaders,f)
