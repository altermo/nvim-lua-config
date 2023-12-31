vim.fn.timer_start(100,function() vim.fn.execute('silent! checktime') end,{['repeat']=-1})
vim.fn.timer_start(200,function() vim.cmd"doautocmd User s1" end)

local open=vim.ui.open
rawset(vim.ui,'open',function (path) open(path:gsub('^([a-zA-Z0-9._-]+/[a-zA-Z0-9._-]+)$','https://github.com/%1')) end)
--local dep=vim.deprecate
-----@diagnostic disable-next-line: duplicate-set-field
--function vim.deprecate(name,...)
--if vim.tbl_contains({},name) and os.time()<os.time{year=2023,month=11,day=1} then return end
--return dep(name,...)
--end

function vim.pprint(...)
    local s,args=pcall(vim.deepcopy,{...})
    if not s then args={...} end
    vim.schedule_wrap(vim.notify)(vim.inspect(#args>1 and args or unpack(args)))
end
vim.lg=require'utils.log'.log
vim.lgclear=require'utils.log'.log_clear
vim.traceback=require'utils.log'.log_traceback

local function command(cmd,bin,opt) vim.api.nvim_create_user_command(cmd,bin,opt or {}) end
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
    vim.fn.writefile(vim.fn.sort(vim.tbl_keys(vim.api.nvim_get_color_map())),'/tmp/nvim_out.colors')
    vim.cmd.split'/tmp/nvim_out.colors'
end)
vim.opt.runtimepath:prepend('/home/user/.config/nvim/.other/small.nvim') --For testing
require'small.kitty'.conf={padding=20,smartpaddingtabline=true}
require'small.kitty'.setup()
