local function autocmd(au,callback,opt) return vim.api.nvim_create_autocmd(au,vim.tbl_extend('error',{callback=callback},opt or {})) end
autocmd('BufWinEnter',function () if vim.o.filetype=='' then vim.o.filetype='none' end end)
autocmd('CmdlineEnter',function () vim.o.hlsearch=true end,{pattern='/,\\?'})
autocmd('TermOpen',function() vim.o.filetype='term' end)
autocmd('FileType',function()
    if vim.o.filetype=='toml' or vim.o.filetype=='markdown' then
        vim.wo.foldexpr='v:lua.vim.treesitter.foldexpr()'
    else
        vim.wo.foldexpr='getline(v:lnum)==""?0:1'
    end end)
autocmd('BufRead',function() vim.cmd[[noautocmd norm! g`"]] end)
autocmd('VimLeave',function() vim.cmd.mksession({'/tmp/session.vim',bang=true}) end)
autocmd('BufRead',function(ev)
    if _G._DONT_AUTOCD or vim.o.buftype~='' then return end
    local dir=vim.fs.dirname(vim.fs.find({'.git'},{upward=true,path=vim.fs.dirname(ev.file)})[1])
    if dir then vim.cmd.lcd(dir)
    else pcall(vim.cmd.lcd,vim.fn.expand('%:p:h')) end
end)
vim.api.nvim_create_user_command('AutocdToggle',function() _G._DONT_AUTOCD=not _G._DONT_AUTOCD end,{})
autocmd('BufReadPre',function(args)
    if vim.loop.fs_stat(args.file).size<=1024*1024 then return end
    local buf=vim.api.nvim_create_buf(true,true)
    vim.api.nvim_win_set_buf(0,buf)
    vim.api.nvim_buf_delete(args.buf,{})
    vim.notify('file to big')
    vim.fn.termopen('nvim -n -u NONE -- '..args.file)
end)
autocmd({'InsertLeave','TextChanged'},function (ev)
    if ev.file=='' or not vim.o.modified or vim.o.readonly or vim.o.buftype~='' then return end
    vim.cmd('lockmarks silent! update ++p')
    if vim.o.cmdheight>0 then vim.cmd.echon(("'AutoSave: saved at "..vim.fn.strftime("%H:%M:%S")):sub(1,vim.v.echospace+1).."'") end
    if vim.loop.fs_stat(ev.file).size>1024*100 then return end
    ---@diagnostic disable-next-line: param-type-mismatch
    vim.cmd('lockmarks silent! write! ++p /tmp/nvim-save/'..vim.fn.expand('%:p'):gsub('%/','\\%%'))
end)
autocmd('FileType',function()
  if pcall(vim.treesitter.get_parser) then
    vim.cmd'syntax off'
    vim.defer_fn(function () vim.cmd'syntax on' end,1000)
  else
    vim.cmd"syntax on"
  end
end,{once=true})
autocmd({'BufRead','BufNewFile','StdinReadPost'},
  function()
    vim.filetype.add({extension={bf='bf'}})
    vim.cmd.setf('bf')
  end,{once=true,pattern='*.bf'})
local function bino(lhs,rhs) vim.keymap.set('i',lhs,rhs,{buffer=true}) end
autocmd('FileType',function()
    vim.cmd.iabbrev'<buffer> vpp vim.pprint'
    vim.cmd.iabbrev'<buffer> vl vim.lg'
    bino('ł','local ')
    bino('đ','function ')
    bino('®','return ')
    bino('þ','then return end')
    bino('„','vim.')
    bino('„f','vim.fn.')
    bino('„a','vim.api.nvim_')
    bino('„k','vim.keymap.set')
    bino('M','M.')
    bino('…','M.')
end,{pattern='lua'})
autocmd('FileType',function() bino('…','self->') end,{pattern='c'})
autocmd('FileType',function() bino('…','self.') end,{pattern='python'})
autocmd('FileType',function() vim.keymap.set('n','<cr>','<cr>',{buffer=true}) end,{pattern='qf'})
vim.api.nvim_create_autocmd('UIEnter',{
  callback = function()
    if vim.fn.argc()>0 or
      vim.api.nvim_buf_line_count(0)>1 or
      vim.api.nvim_buf_get_lines(0,0,-1,false)[1]~='' then return end
    vim.bo.buftype='nofile'
  end,once=true})
autocmd('CmdlineEnter',function ()
    if vim.o.cmdheight~=0 then return end
    vim.o.laststatus=0
    vim.cmd.redraw()
end)
autocmd('CmdlineLeave',function ()
    if vim.o.cmdheight~=0 then return end
    vim.o.laststatus=2
    vim.cmd.redraw()
end)
