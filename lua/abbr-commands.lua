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
cabbr('TSU','TSUpdate')
cabbr('TSIA','TSInstall all')

----commands
command('Shell',function (opts) require'utils.lib'.termrun('fish '..opts.args,{close_single=true}) end,{nargs='*'})
vim.api.nvim_create_user_command('L',function (opt)
    if not pcall(vim.cmd['='],opt.args) then
        vim.cmd.lua(opt.args)
    end
end,{complete='lua',nargs='+'})
command('Capture',function (opts)
    vim.cmd'redir! >/tmp/nvim_out.capture'
    vim.cmd('silent '..opts.args)
    vim.cmd'redir! END'
    vim.cmd.split'/tmp/nvim_out.capture'
end,{nargs='*'})
