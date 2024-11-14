return function (map)
  --- ;; main
  map(' r',function () pcall(vim.cmd.lcd,vim.fn.expand'%:p:h') require'small.dff'.file_expl() end)
  map(" '",':lua require"small.nterm".run("fish",true)\r')
  map(' i',function () require'oil'.open() end)
  map(' t',':nohls\r')
  map(' ye',':set spelllang=en\r',{noremap=true})
  map(' ys',':set spelllang=es\r',{noremap=true})
  map(' cl',':edit /tmp/nlog\r')
  map(' cr',function () require'small.reminder2'.sidebar() end)
  map(' Y',':lua vim.ui.select(vim.yanks,{},function(s) vim.fn.setreg("\\"",s) end)\r')
  --- ;;; window/buffer
  map(' q','<cmd>q\r')
  map(' Q','<cmd>q!\r')
  map(' v',function () vim.cmd.vsplit() end)
  map(' e',function () vim.cmd.split() end)
  map(' u',':lua vim.api.nvim_set_current_buf(vim.api.nvim_create_buf(true,true))\r')
  map(' w','<C-w>',{noremap=false})
  map(' <tab>',':tab split\r')
  --- ;;; files
  map(' W',function ()
    local tmp=vim.fn.tempname()
    vim.fn.writefile(vim.fn.getline(1,vim.fn.line('$')),tmp)
    vim.cmd.vnew()
    local buf=vim.fn.bufnr()
    vim.fn.termopen('cat '..tmp..'|sudo tee >/dev/null '..vim.fn.expand('#:p'),{
      on_exit=function (_,code,_)
        vim.cmd.bdelete({buf,bang=true})
        if code==0 then vim.o.modified=false end
      end
    })
    vim.cmd.startinsert()
  end)
  map(' C',':call setreg("+","<C-r>=expand("%:p")\r")\r',{noremap=true})

  --- ;; search
  map(' sp',':FzfLua files cwd=/home/user/.local/share/nvim/lazy/ cmd=ls previewer=false\r')
  map(' sr',':FzfLua files cwd=/usr/local/share/nvim/runtime/\r')
  map(' so',':FzfLua oldfiles formatter=path.filename_first\r')
  for k,v in pairs{a='',f='files',s='live_grep',h='helptags',b='buffers',[' ']='resume',g='git_status'} do
    map(' s'..k,':FzfLua '..v..'\r')
  end

  --- ;; lsp
  map(' ls',':LspStop\r')
  map(' lS',':LspStart\r')
  map(' lr',':FzfLua lsp_references\r')
  map(' ln',':lua vim.diagnostic.goto_next({_highest=true})\r')
  map(' lp',':lua vim.diagnostic.goto_prev({_highest=true})\r')
end
-- vim:ts=2
