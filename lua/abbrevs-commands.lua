----init--
local function command(cmd,bin,opt)
  vim.api.nvim_create_user_command(cmd,bin,opt or {})
end
local function cabbr(key,maps)
  vim.cmd('cabbrev '..key..' '..maps)
end

----cabbrev
cabbr('W','w')
cabbr('Q','q')
cabbr('WQ','wq')
cabbr('Wq','wq')
cabbr('qw','wq')

----commands
command('Fish','lua TermAppRun(\'fish <args>\')',{nargs='*'})
command('Emacs','lua TermAppRun("emacsclient -nw -c -a \'emcas -nw\' <args>")',{nargs='*'})
command('Kak','lua TermAppRun(\'kak <args>\')',{nargs='*'})
command('Resource','so ~/.config/nvim/init.lua')
command('BD',[[command! -bang -nargs=1 BD execute 'bd<bang> ' . join(map(split(execute('filter /<args>/ ls'), "\n"), 'str2nr(v:val)'))]],{nargs=1,bang=true})
