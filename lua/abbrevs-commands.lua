----init--
local function command(cmd,bin,opt)
  vim.api.nvim_create_user_command(cmd,bin,opt or {})
end

----cabbrev
vim.cmd.cabbr('W','w')
vim.cmd.cabbr('Q','q')
vim.cmd.cabbr('WQ','wq')
vim.cmd.cabbr('Wq','wq')
vim.cmd.cabbr('qw','wq')

----commands
command('Fish','lua TermAppRun(\'fish <args>\')',{nargs='*'})
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
