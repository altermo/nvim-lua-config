local function command(cmd,bin,opt)
    vim.api.nvim_create_user_command(cmd,bin,opt or {})
end
local fn=vim.fn
function Ranger(path)
    local currentPath=fn.expand(path,nil,nil)
    local file='/tmp/chosenfile'
    local ranger_command="sleep 0.01;printf '\\e[?1000h';ranger --cmd 'set show_hidden=true' --cmd 'set preview_images=true'"
    vim.cmd('enew')
    local JobArgs={}
    local buf=fn.bufnr()
    function JobArgs.on_exit(_,_,_)
        if fn.filereadable(file)==1 then
            vim.cmd('enew')
            vim.cmd('bdelete! '..buf)
            local f=fn.readfile(file)[1]
            vim.cmd('edit '..f)
            fn.delete(file)
        else
            vim.cmd('bdelete! '..buf)
        end
    end
    while fn.filereadable(currentPath)==0 and fn.isdirectory(currentPath)==0 do
        currentPath=fn.fnamemodify(currentPath,':h')
    end
    fn.termopen(ranger_command..' --choosefiles='..file..' "'..currentPath..'"',JobArgs)
    vim.cmd('startinsert')
end
command('Ranger','lua Ranger("%")')
command('RangerG','lua Ranger(<args>)',{nargs=1})
