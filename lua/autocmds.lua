local function autocmd(au,opt)
    return vim.api.nvim_create_autocmd(au,opt)
end
autocmd('BufWinEnter',{command='if &filetype==""|set filetype=txt|endif'})
autocmd('CmdlineEnter',{pattern='/,\\?',command='set hlsearch'})
autocmd('TermOpen',{command='set ft=term'})
autocmd('FileType',{pattern='qf',command='nno <buffer><CR> <CR>'})
autocmd('BufRead',{callback=function()
    pcall(function ()
        if vim.fn.line('\'"')<=vim.fn.line('$') then
            vim.cmd('norm! g`"')
        end
    end)
end})
vim.api.nvim_create_autocmd('VimLeave',{callback=function()
    vim.cmd.mksession({'/tmp/session.vim',bang=true})
end})
vim.api.nvim_create_autocmd('BufRead',{callback=function(ev)
    if _G._DONT_AUTOCD or vim.o.buftype~='' then return end
    local dir=vim.fs.dirname(vim.fs.find('.git',{upward=true,path=vim.fs.dirname(ev.file)})[1])
    if dir then vim.cmd.lcd(dir)
    else pcall(vim.cmd.lcd,vim.fn.expand('%:p:h')) end
end})
vim.api.nvim_create_user_command('AutocdToggle',function() _G._DONT_AUTOCD=not _G._DONT_AUTOCD end,{})
vim.api.nvim_create_autocmd('BufReadPre',{callback=function(args)
    if vim.loop.fs_stat(args.file).size<=1024*1024 then return end
    local buf=vim.api.nvim_create_buf(true,true)
    vim.api.nvim_win_set_buf(0,buf)
    vim.api.nvim_buf_delete(args.buf,{})
    vim.notify('file to big')
    vim.fn.termopen('nvim -n -u NONE -- '..args.file)
end})
vim.api.nvim_create_autocmd({'InsertLeave','TextChanged'},{callback=function ()
    if _AUTO_SAVE_TIMER then vim.fn.timer_stop(_AUTO_SAVE_TIMER) end
	_AUTO_SAVE_TIMER=vim.fn.timer_start(100,function()
        if not vim.o.modified or vim.o.readonly or vim.o.buftype~='' then return end
        _AUTO_SAVE_TIMER=nil
        local s=vim.api.nvim_buf_get_mark(0,'[')
        local e=vim.api.nvim_buf_get_mark(0,']')
        vim.cmd('silent! update ++p')
        vim.cmd.echon(("'AutoSave: saved at "..vim.fn.strftime("%H:%M:%S")):sub(1,vim.o.columns-12).."'")
        pcall(vim.api.nvim_buf_set_mark,0,'[',s[1],s[2],{})
        pcall(vim.api.nvim_buf_set_mark,0,']',e[1],e[2],{})
	end) end})
