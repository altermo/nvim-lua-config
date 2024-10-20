---init
local function map(lhs,rhs,opts)
  vim.keymap.set('n',lhs,rhs,opts or {silent=true})
end
local function cmap(key,inp,cmd,opts)
  for k,v in pairs(inp) do
    map(key..k,cmd:format(v),opts)
  end
end

---main
map(' r',function () pcall(vim.cmd.lcd,vim.fn.expand'%:p:h') require'small.dff'.file_expl() end)
map(" '",':lua require"small.nterm".run("fish",true)\r')
map(' i',function () require'oil'.open() end)
map(' t',':nohls\r')
cmap(' y',{e='en',s='sv'},':set spelllang=%s\r',{silent=false})
------window/buffer
map(' q','<cmd>q\r')
map(' Q','<cmd>q!\r')
map(' x','<cmd>qall\r')
map(' v',function () vim.cmd.vsplit() end)
map(' e',function () vim.cmd.split() end)
map(' D',function ()
    local buf=vim.api.nvim_get_current_buf()
    local sbuf=vim.api.nvim_create_buf(false,true)
    vim.bo[sbuf].bufhidden='wipe'
    for _,win in ipairs(vim.fn.win_findbuf(buf)) do
      vim.api.nvim_win_set_buf(win,sbuf)
    end
    pcall(vim.api.nvim_buf_delete,buf,{})
  end)
map(' u',':lua vim.api.nvim_set_current_buf(vim.api.nvim_create_buf(true,true))\r')
map(' w','<C-w>',{noremap=false})
map(' <tab>',':tab split\r')
map(' >',':+tabmove\r')
map(' <',':-tabmove\r')
------files
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
map(' C',':!wl-copy "%:p"\r',{silent=false})

---cmd/app
map(' ct',':InspectTree\r')
map(' cn',':lua require"small.notify".dismiss()\r')
map(' cN',':lua require"small.notify".open_history()\r')
map(' cm',':MarkdownPreview\r')
map(' cl',':edit /tmp/nlog\r')
map(' cr',require'small.reminder2'.sidebar)

---search
map(' sa',':Telescope\r')
map(' sc',':Telescope colorscheme enable_preview=true\r')
map(' sp',':Telescope find_files cwd=/home/user/.local/share/nvim/lazy/ find_command=ls\r')
map(' sr',':Telescope find_files cwd=/usr/local/share/nvim/runtime\r')
map(' sg',':Telescope grapple tags\r')
cmap(' s',{f='find_files',o='oldfiles',s='live_grep',h='help_tags',m='marks',b='buffers',[' ']='resume'},':Telescope %s\r')

---lsp
map(' lf',':lua require"small.format".run()\r')
map(' li',':LspInfo\r')
map(' ls',':LspStop\r')
map(' lS',':LspStart\r')
map(' lr',':Telescope lsp_references\r')
map(' lt',':lua vim.lsp.buf.type_definition()\r')
map(' lc',':lua vim.lsp.buf.code_action()\r')
map(' ln',':lua vim.diagnostic.goto_next({_highest=true})\r')
map(' lp',':lua vim.diagnostic.goto_prev({_highest=true})\r')

---debug
map(' db',':lua require"dap".toggle_breakpoint()\r')
map(' dR',':lua require"dap.repl".toggle()\r')
map(' dc',':lua require"dap".continue()\r')
map(' dn',':lua require"dap".step_over()\r')
map(' di',':lua require"dap".step_into()\r')
map(' dr',"<cmd>lua require'small.qvim2'.open_run_buf()\r")
map(' ds',"<cmd>lua require'small.qvim2'.run()\r")

---grapple
map(' ha',':Grapple toggle\r')
map(' hn',':Grapple cycle forward\r')
map(' hp',':Grapple cycle backward\r')
map(' hh',':Grapple toggle_tags\r')

-- vim:fen
