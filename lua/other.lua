vim.fn.timer_start(100,function() vim.fn.execute('silent! checktime') end,{['repeat']=-1})
vim.fn.timer_start(200,function() vim.cmd"doautocmd User s1" end)

local open=vim.ui.open
rawset(vim.ui,'open',function (path) open(path:gsub('^([a-zA-Z0-9._-]+/[a-zA-Z0-9._-]+)$','https://github.com/%1')) end)

function vim.pprint(...)
    local s,args=pcall(vim.deepcopy,{...})
    if not s then args={...} end
    vim.schedule_wrap(vim.notify)(vim.inspect(#args>1 and args or unpack(args)))
end
function vim.lg(...)
    if vim.in_fast_event() then return vim.schedule_wrap(vim.lg)(...) end
    local d=debug.getinfo(2)
    return vim.fn.writefile(vim.fn.split(
        ':'..d.short_src..':'..d.currentline..':\n'..
        vim.inspect(#{...}>1 and {...} or ...),'\n'
    ),'/tmp/nlog','a')
end
function vim.lgclear()
    vim.fn.writefile({},'/tmp/nlog')
end

vim.api.nvim_create_user_command('Capture',function (opts)
    vim.fn.writefile(vim.split(vim.api.nvim_exec2(opts.args,{output=true}).output,'\n'),'/tmp/nvim_out.capture')
    vim.cmd.split'/tmp/nvim_out.capture'
end,{nargs='*',complete='command'})
