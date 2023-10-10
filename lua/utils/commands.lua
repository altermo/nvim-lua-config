local function command(cmd,bin,opt) vim.api.nvim_create_user_command(cmd,bin,opt or {}) end
command('Shell',function (opts) require'small.nterm'.run('fish '..opts.args,true) end,{nargs='*'})
command('L',function (opt)
    if not pcall(vim.cmd['='],opt.args) then
        vim.cmd.lua(opt.args)
    end
end,{complete='lua',nargs='+'})
command('Capture',function (opts)
    vim.fn.writefile(vim.split(vim.api.nvim_exec2(opts.args,{output=true}).output,'\n'),'/tmp/nvim_out.capture')
    vim.cmd.split'/tmp/nvim_out.capture'
end,{nargs='*',complete='command'})
command('Colors',function ()
    vim.cmd.split'/tmp/nvim_out.colors'
    for k,_ in pairs(vim.api.nvim_get_color_map()) do
        vim.api.nvim_buf_set_lines(0,-1,-1,false,{k})
    end
end)
