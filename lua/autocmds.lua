local function autocmd(au,callback,opt) return vim.api.nvim_create_autocmd(au,vim.tbl_extend('error',{callback=callback},opt or {})) end
autocmd('BufRead',function() pcall(vim.cmd --[[@as function]],[[noautocmd norm! g`"]]) end)
autocmd('VimLeave',function() vim.cmd.mksession{'/tmp/session.vim',bang=true} end)
autocmd({'InsertLeave','TextChanged'},function (ev)
    if ev.file=='' or not vim.o.modified or vim.o.readonly or vim.o.buftype~='' then return end
    pcall(vim.fn.mkdir,vim.fs.dirname(ev.file),'p')
    vim.cmd.update{bang=true,mods={emsg_silent=true,lockmarks=true}}
    if vim.o.cmdheight>0 then vim.cmd.echon(("'AutoSave: saved at "..vim.fn.strftime("%H:%M:%S")):sub(1,vim.v.echospace+1).."'") end
end,{group=vim.api.nvim_create_augroup('AutoSave',{})})
autocmd('FileType',function()
    local function bino(lhs,rhs) vim.keymap.set('i',lhs,rhs,{buffer=true}) end
    bino('ł','local ')
    bino('đ','function ')
    bino('®','return ')
    bino('„','vim.')
    bino('„a','vim.api.nvim_')
    bino('„ª','vim.api.nvim_')
    bino('M','M.')
    vim.bo.commentstring='--%s'
end,{pattern='lua'})
autocmd('VimLeave',function() io.stdout:write("\027]111;;\027\\") end)
local function sync_background() io.stdout:write(("\027]11;#%06x\027\\"):format(vim.api.nvim_get_hl(0,{name='Normal',link=false}).bg or 0)) end
autocmd('ColorScheme',vim.schedule_wrap(sync_background))
--autocmd('OptionSet',vim.schedule_wrap(sync_background),{pattern='background'}) --This causes a CSI recursive loop
autocmd('OptionSet',function () vim.o.foldmethod=vim.v.option_new==true and 'diff' or 'expr' end,{pattern='diff'})
autocmd('BufEnter',function () vim.o.tabstop=8 end,{pattern='*/emacs/*.{c,h}'})
autocmd('RecordingLeave',function ()
    if vim.v.event.regcontents=='' then
        vim.notify'empty macro, previous recoding is kept'
        return vim.schedule_wrap(function (prev) vim.fn.setreg('q',prev) end)(vim.fn.getreg'q') end
    vim.notify('Recorded macro: '..vim.fn.keytrans(vim.v.event.regcontents))
end)
autocmd('InsertCharPre',function ()
    if vim.fn.match(vim.v.char,[[\V\k\|.]])==-1 or vim.fn.state'm'=='m' or vim.fn.pumvisible()~=0 then return end
    if vim.o.omnifunc~='v:lua.vim.lsp.omnifunc' then
        vim.api.nvim_input('<C-x><C-n>')
    else
        vim.api.nvim_input('<C-x><C-o>')
    end
end)
autocmd('InsertCharPre',function () pcall(function ()
    for _,client in ipairs(vim.lsp.get_clients{bufnr=0}) do
        if vim.tbl_contains(client.server_capabilities.signatureHelpProvider.triggerCharacters,vim.v.char) then
            vim.lsp.buf.signature_help{focusable=false,silent=true,max_height=4,anchor_bias='above'}
        end
    end
    end) end)
