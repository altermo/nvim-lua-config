local function autocmd(au,callback,opt) return vim.api.nvim_create_autocmd(au,vim.tbl_extend('error',{callback=callback},opt or {})) end
autocmd('BufWinEnter',function (ev) if vim.bo[ev.buf].filetype=='' then vim.bo[ev.buf].filetype='none' end end)
autocmd('TermOpen',function(ev) vim.bo[ev.buf].filetype='term' end)
autocmd('FileType',function()
    vim.wo.foldexpr=vim.tbl_contains({'python','lua','fish'},vim.o.filetype)
    and 'getline(v:lnum)==""?0:1' or 'v:lua.vim.treesitter.foldexpr()' end)
autocmd('BufRead',function() pcall(vim.cmd --[[@as function]],[[noautocmd norm! g`"]]) end)
autocmd('VimLeave',function() vim.cmd.mksession{'/tmp/session.vim',bang=true} end)
autocmd('BufWinEnter',function(ev)
    if vim.o.buftype~='' then return end
    pcall(vim.cmd.lcd,vim.fs.root(ev.file,'.git') or vim.fs.dirname(ev.file))
end,{group=vim.api.nvim_create_augroup('CD',{})})
autocmd({'InsertLeave','TextChanged'},function (ev)
    if ev.file=='' or not vim.o.modified or vim.o.readonly or vim.o.buftype~='' then return end
    pcall(vim.fn.mkdir,vim.fs.dirname(ev.file),'p')
    vim.cmd.update{bang=true,mods={emsg_silent=true,lockmarks=true}}
    if vim.o.cmdheight>0 then vim.cmd.echon(("'AutoSave: saved at "..vim.fn.strftime("%H:%M:%S")):sub(1,vim.v.echospace+1).."'") end
end,{group=vim.api.nvim_create_augroup('AutoSave',{})})
local function bino(lhs,rhs) vim.keymap.set('i',lhs,rhs,{buffer=true}) end
autocmd('FileType',function()
    bino('ł','local ')
    bino('đ','function ')
    bino('®','return ')
    bino('þ','then return end')
    bino('„','vim.')
    bino('„a','vim.api.nvim_')
    bino('„ª','vim.api.nvim_')
    bino('M','M.')
    vim.bo.commentstring='--%s'
end,{pattern='lua'})
autocmd('FileType',function ()
    bino('<tab>','<C-T>')
    bino('<S-tab>','<C-D>')
end,{pattern='markdown'})
autocmd('VimEnter',function()
    if vim.api.nvim_buf_line_count(0)>1 or
        vim.api.nvim_buf_get_lines(0,0,-1,false)[1]~='' or
        vim.api.nvim_buf_get_name(0)~='' then return end
    vim.bo.buftype='nofile'
end,{once=true})
autocmd('VimLeave',function () io.stdout:write("\027]111;;\027\\") end)
local function sync_background() io.stdout:write(("\027]11;#%06x\027\\"):format(vim.api.nvim_get_hl(0,{name='Normal',link=false}).bg or 0)) end
autocmd('ColorScheme',vim.schedule_wrap(sync_background))
autocmd('OptionSet',vim.schedule_wrap(sync_background),{pattern='background'})
autocmd('OptionSet',function () vim.o.foldmethod=vim.v.option_new==true and 'diff' or 'expr' end,{pattern='diff'})
autocmd('BufEnter',function ()
    vim.o.tabstop=8
    vim.keymap.set('n','gD',function ()
        local word=vim.fn.expand('<cword>')
        if vim.fn.search('^\\C\\(# \\?define \\?\\)\\?\\<'..word..'\\>','')~=0 then return end
        require('telescope.builtin').live_grep({glob_pattern='*.{c,h}'})
        vim.api.nvim_input((('^(# ?define ?)?\\<'..word..'\\>'):gsub('<','<lt>')))
    end,{buffer=true})
end,{pattern='*/emacs/*.{c,h}'})
autocmd('RecordingLeave',function ()
    if vim.v.event.regcontents=='' then
        vim.notify'empty macro, previous recoding is kept'
        return vim.schedule_wrap(function (prev) vim.fn.setreg('q',prev) end)(vim.fn.getreg'q') end
    vim.notify('Recorded macro: '..vim.fn.keytrans(vim.v.event.regcontents))
end)
