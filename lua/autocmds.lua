local function autocmd(au,opt)
    return vim.api.nvim_create_autocmd(au,opt)
end
autocmd('BufWinEnter',{command='if &filetype==""|set filetype=txt|endif'})
autocmd('CmdlineEnter',{pattern='/,\\?',command='set hlsearch'})
autocmd('TermOpen',{command='set ft=term'})
autocmd('FileType',{pattern='qf',command='nno <buffer><CR> <CR>'})
autocmd('FileType',{callback=function()
    if vim.o.filetype=='toml' or vim.o.filetype=='markdown' then
        vim.wo.foldexpr='v:lua.vim.treesitter.foldexpr()'
    else
        vim.wo.foldexpr='getline(v:lnum)==""?0:1'
    end
end })
autocmd('BufRead',{callback=function() pcall(vim.cmd.norm,{'g`"',bang=true}) end})
autocmd('VimLeave',{callback=function() vim.cmd.mksession({'/tmp/session.vim',bang=true}) end})
autocmd('BufRead',{callback=function(ev)
    if _G._DONT_AUTOCD or vim.o.buftype~='' then return end
    local dir=vim.fs.dirname(vim.fs.find({'.git'},{upward=true,path=vim.fs.dirname(ev.file)})[1])
    if dir then vim.cmd.lcd(dir)
    else pcall(vim.cmd.lcd,vim.fn.expand('%:p:h')) end
end})
vim.api.nvim_create_user_command('AutocdToggle',function() _G._DONT_AUTOCD=not _G._DONT_AUTOCD end,{})
autocmd('BufReadPre',{callback=function(args)
    if vim.loop.fs_stat(args.file).size<=1024*1024 then return end
    local buf=vim.api.nvim_create_buf(true,true)
    vim.api.nvim_win_set_buf(0,buf)
    vim.api.nvim_buf_delete(args.buf,{})
    vim.notify('file to big')
    vim.fn.termopen('nvim -n -u NONE -- '..args.file)
end})
autocmd({'InsertLeave','TextChanged'},{callback=function (ev)
    if not vim.o.modified or vim.o.readonly or vim.o.buftype~='' then return end
    vim.cmd('lockmarks silent! update ++p')
    if vim.o.cmdheight>0 then vim.cmd.echon(("'AutoSave: saved at "..vim.fn.strftime("%H:%M:%S")):sub(1,vim.v.echospace+1).."'") end
    if vim.loop.fs_stat(ev.file).size>1024*100 then return end
    ---@diagnostic disable-next-line: param-type-mismatch
    vim.cmd('lockmarks silent! write! ++p /tmp/nvim-save/'..vim.fn.expand('%:p'):gsub('%/','\\%%'))
end})
vim.cmd"autocmd LspProgress * =vim.lsp.status()"
autocmd('FileType',{callback=function()
  if pcall(vim.treesitter.get_parser) then
    vim.cmd'syntax off'
    vim.defer_fn(function () vim.cmd'syntax on' end,1000)
  else
    vim.cmd"syntax on"
  end
end,once=true})
autocmd({'BufRead','BufNewFile','StdinReadPost'},{
  callback=function()
    vim.filetype.add({extension={bf='bf'}})
    vim.cmd.setf('bf')
  end,once=true,pattern='*.bf'})
