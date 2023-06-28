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
cabbr('W','w')
cabbr('Q','q')
cabbr('WQ','wq')
cabbr('Wq','wq')
cabbr('qw','wq')

----commands
command('Fish','lua require("utils.lib").termrun(\'fish <args>\')',{nargs='*'})
command('UpdateRemotePlugins',[[
    for i in g:rplugins
        call luaeval('require"packer.load"({"'.i.'"},{},_G.packer_plugins)')
    endfor
    if g:loaded_remote_plugins==1
        unlet g:loaded_remote_plugins
        source /usr/share/nvim/runtime/plugin/rplugin.vim
    endif
    UpdateRemotePlugins
]])
