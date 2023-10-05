local function command(cmd,bin,opt) vim.api.nvim_create_user_command(cmd,bin,opt or {}) end
command('Shell',function (opts) require'utils.lib'.termrun('fish '..opts.args,true) end,{nargs='*'})
command('L',function (opt)
    if not pcall(vim.cmd['='],opt.args) then
        vim.cmd.lua(opt.args)
    end
end,{complete='lua',nargs='+'})
command('Capture',function (opts)
    vim.cmd'redir! >/tmp/nvim_out.capture'
    vim.cmd('silent '..opts.args)
    vim.cmd'redir! END'
    vim.cmd.split'/tmp/nvim_out.capture'
    --TODO: use `nvim_exec2` instead
end,{nargs='*'})
command('Colors',function ()
    vim.cmd.new()
    vim.o.buftype='nofile'
    for k,_ in pairs(vim.api.nvim_get_color_map()) do
        vim.api.nvim_buf_set_lines(0,-1,-1,false,{k})
    end
end)
