return function (map)
  --- ;; main
  map(' r',function () pcall(vim.cmd.lcd,vim.fn.expand'%:p:h') require'small.dff'.file_expl() end)
  map(" '",':lua require"small.nterm".run("fish",true)\r')
  map(' i',function () require'oil'.open() end)
  map(' t',':nohls\r')
  map(' ye',':set spelllang=en\r',{noremap=true})
  map(' ys',':set spelllang=sv\r',{noremap=true})
  map(' cl',':edit /tmp/nlog\r')
  map(' cr',function () require'small.reminder2'.sidebar() end)
  map(' cR',function () require'small.luay'.run() end)
  map(' p',function ()
    local out={}
    table.insert(out,('File name: %s'):format(vim.fn.expand('%:.')))
    table.insert(out,('Current pos: %d,%d'):format(vim.api.nvim_win_get_cursor(0)[1],vim.api.nvim_win_get_cursor(0)[2]+1))
    table.insert(out,('Filetype: %s'):format(vim.bo.filetype))
    local c=vim.system({'git','rev-parse','--abbrev-ref','HEAD'}):wait()
    if c.code==0 then
      table.insert(out,('Git-branch: %s'):format(c.stdout))
    end
    local s={}
    for _,v in ipairs(vim.diagnostic.get()) do
      s[v.severity]=(s[v.severity] or 0)+1
    end
    for i in vim.spairs(s) do
      table.insert(out,('%s: %d'):format(vim.diagnostic.severity[i],s[i]))
    end
    vim.notify(table.concat(out,'\n'))
  end)
  --- ;;; window/buffer
  map(' q','<cmd>q\r')
  map(' Q','<cmd>q!\r')
  map(' v',function () vim.cmd.vsplit() end)
  map(' e',function () vim.cmd.split() end)
  map(' u',':e `=tempname()`\r')
  map(' w','<C-w>',{noremap=false})
  map(' <tab>',':tab split\r')
  map(' <',':-tabmove\r')
  map(' >',':+tabmove\r')
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
  map(' s\r',':FzfLua files cwd=/home/user/.projects/ cmd=ls previewer=false\r')
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
