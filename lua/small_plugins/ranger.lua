local M={}
function M.ranger(path)
    vim.cmd.enew()
    local realpath=vim.fn.fnamemodify(path,':p')
    local file='/tmp/chosenfile'
    local ranger_command='sleep 0.01;printf "\\e[?1000h";ranger --cmd "set show_hidden=true" --cmd "set preview_images=true"'
    local jobargs={}
    local buf
    function jobargs.on_exit(_,_,_)
        if vim.fn.filereadable(file)==1 then
            vim.cmd.enew()
            vim.cmd.bdelete{buf,bang=true}
            vim.cmd.edit(vim.fn.readfile(file)[1])
            vim.fn.delete(file)
        else
            vim.cmd.bdelete{buf,bang=true}
        end
    end
    while vim.fn.filereadable(realpath)==0 and vim.fn.isdirectory(realpath)==0 do
        realpath=vim.fn.fnamemodify(realpath,':h')
    end
    local ranger_full_cmd=ranger_command..' --cmd "map r chain cd ..;open_with" --choosefiles='..file
    if vim.fn.isdirectory(realpath)==1 then
        ranger_full_cmd=ranger_full_cmd..' "'..realpath..'"'
    else
        ranger_full_cmd=ranger_full_cmd..' --cmd "select_file '..realpath..'"'
    end
    vim.fn.termopen(ranger_full_cmd,jobargs)
    buf=vim.fn.bufnr()
    vim.api.nvim_set_option_value('bufhidden','wipe',{buf=buf})
    vim.cmd.startinsert()
end
function M.runranger(args)
    if args.args=='' then
        M.ranger(vim.fn.expand('%'))
    else
        M.ranger(vim.fn.expand(args.args))
    end
end
function M.setup()
    vim.api.nvim_create_user_command('Ranger',M.runranger,{nargs='?'})
end
return M
