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
    vim.fn.writefile(vim.tbl_keys(vim.api.nvim_get_color_map()),'/tmp/nvim_out.colors')
    vim.cmd.split'/tmp/nvim_out.colors'
end)
