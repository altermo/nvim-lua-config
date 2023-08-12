----init--
local function command(cmd,bin,opt)
    vim.api.nvim_create_user_command(cmd,bin,opt or {})
end
local function cabbr(lhs,rhs)
    vim.keymap.set('ca',lhs,function()
        return vim.fn.getcmdtype()==':' and vim.fn.getcmdline()==lhs and rhs or lhs
    end,{expr=true})
end

----cabbrev
--cabbr('W','w')
--cabbr('w','=vim.fn.input(("PLEAS STOP PRESSING :W\\n"):rep(200))')
cabbr('w','stop')
cabbr('Q','q')
cabbr('WQ','wq')
cabbr('Wq','wq')
cabbr('qw','wq')

----commands
command('Shell',function (opts) require'utils.lib'.termrun('fish '..opts.args) end,{nargs='*'})
command('UpdateRemotePlugins',function ()
    for _,i in ipairs(vim.g.rplugins) do
        ---@diagnostic disable-next-line: undefined-field
        require'packer.load'({i},{},_G.packer_plugins)
    end
    if vim.g.loaded_remote_plugins==1 then
        vim.g.loaded_remote_plugins=nil
        vim.cmd.source('/usr/share/nvim/runtime/plugin/rplugin.vim')
    end
    vim.cmd.UpdateRemotePlugins()
end,{nargs='*'})
vim.api.nvim_create_user_command('L',function (opt)
    if not pcall(vim.cmd['='],opt.args) then
        vim.cmd.lua(opt.args)
    end
end,{complete='lua',nargs='+',})
