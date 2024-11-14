---- ;; init
vim.api.nvim_del_keymap('n','gcc')
vim.on_key(function (_,t)
  vim.on_key(nil,-1)

  --TODO: fix that for example `ciw` turns into `icw`
  vim.api.nvim_input(t)

  local function map(mode,lhs,rhs,opt)
    opt=(opt=='expr' and {expr=true,replace_keycodes=true,noremap=true}) or opt or {noremap=true,silent=true}
    if type(rhs)=='function' then opt.callback=rhs rhs='' end
    for _,i in ipairs(type(lhs)=='table' and lhs or {lhs}) do
      vim.api.nvim_set_keymap(mode,i,rhs,opt)
    end
  end

  ---- ;; nno
  map('n','gc',function () return require('vim._comment').operator()..'_' end,'expr')
  map('n',' ',function ()
    vim.keymap.del('n',' ')
    require'spacekey'(function (...) map('n',...) end)
    vim.api.nvim_input(' ')
  end)
  map('n',',','<C-o>')
  map('n',';','<C-i>')
  map('n','.',':',{noremap=true})
  map('n','<M-e>','/',{noremap=true})
  map('n','ø',':redo\r')
  map('n','å','"+p')
  map('n','æ','"+y')
  map('n','π','yyp')
  map('n',{'<tab>','<A-l>'},'a<C-T><esc>')
  map('n',{'<S-tab>','<A-h>'},'a<C-D><esc>')
  map('n','dc',':lcd ..|pwd\r')
  map('n','cd',':lcd %:p:h|pwd\r')
  map('n','\r','dd',{})
  map('n','j','v:count==0?"gj":"j"','expr')
  map('n','k','v:count==0?"gk":"k"','expr')
  map('n','g:','q:')
  map('n','g/','q/')
  map('n','gp','`[v`]')
  map('n','vv','V')
  map('n','\\p','<cmd>Lazy\r')
  map('n','gd',function () return (vim.o.tagfunc~='' or #vim.fn.tagfiles()>0) and '<C-]>' or 'gd' end,'expr')
  map('n','gr',vim.lsp.buf.rename,{noremap=true})
  for c in ('hjkl'):gmatch('.') do
    map('n','<C-'..c..'>','<C-w>'..c..'<cmd>if &buftype=="terminal"|startinsert|endif\r')
  end
  map('n','<A-a>','G:keepjumps norm! Vgg\r')
  map('n','<A-y>',':let @+=@"\r')
  map('n','<A-j>',':move +1\r')
  map('n','<A-k>',':move -2\r')
  map('n',{'<A-.>','<C-.>'},'.')
  map('n',{'<M-x>','<M-S-.>'},':lua=',{noremap=true})
  for i=1,9 do
    map('n','<A-'..i..'>',':tabnext '..i..'\r')
  end
  map('n','=','z=')
  map('n','0','(reg_recording()==""&&reg_executing()==""&&col(".")==1)?"^":"0"','expr')
  map('n','U',':later 1f\r')
  map('n','<F6>',':source\r')
  map('n','q','(reg_recording()==""?"qq":"q")','expr')
  map('n','Q','(reg_recording()==""?reg_executing()==""?"@q":"":v:lua.vim.notify("Cant play macro while recoding")??"")','expr')
  map('n','cq','<cmd>let b:_macro=input(">",keytrans(@q))|let @q=(trim(b:_macro)!=""?v:lua.vim.keycode(b:_macro):@q)\r')
  for k,v in pairs({
    b={'background','"light"','"dark"'},c='cursorline',h='hlsearch',l='list',n='number',
    r='relativenumber',s='spell',u='cursorcolumn',w='wrap',d='diff',t={'colorcolumn',
      '"1,41,81,121,161,201,241"'},v={'virtualedit','"block,onemore"'},M={'mouse','"a"'},
    f='foldenable',e='scrollbind',m={'conceallevel',2,0},T={'showtabline',1,0},
    L={'laststatus',2,0},C={'cmdheight',1,0},B={'showbreak'},
  }) do
    v=type(v)=='table' and v or {v,1,0}
    map('n','yo'..k,(':let &%s%s=&%s==%s?%s:%s\r:echo "%s=".&%s\r'):format(k=='d' and 'l:' or '',v[1],v[1],v[2],v[3] or '""',v[2],v[1],v[1]))
  end
  map('n','yo',function() vim.cmd.nno('yo') local c=vim.fn.getcharstr()
    vim.cmd.redraw() if vim.fn.maparg('yo'..c,'n')==1 then vim.api.nvim_input('yo'..c) end end)
  local function hi(k)
    vim.cmd(('norm! %s"%s%s'):format(vim.v.count1,vim.v.register,k))
    vim.highlight.on_yank{higroup='Search',timeout=500,event={operator='y',inclusive=true,regtype=vim.fn.getregtype(vim.v.register)}}
  end
  map('n','p',function() return hi('p') end)
  map('n','P',function() return hi('P') end)

  ---- ;; ino/cno
  map('c',{'<C-S-v>','<C-A-v>'},'<C-r>+',{noremap=true})
  map('i','<tab>','pumvisible()?"<c-n>":"<tab>"','expr')
  map('i','<S-tab>','pumvisible()?"<c-p>":"<S-tab>"','expr')
  map('i','ø','ö')
  map('i','æ','ä')
  map('i','Ø','Ö')
  map('i','Æ','Ä')
  map('i','<C-o>','<C-x><C-o>')
  for k,v in pairs{
    [{'<C-BS>','<M-BS>','<S-BS>'}]='<del>',
    [{'<S-Left>','<M-S-h>'}]=('<Left>'):rep(5),
    [{'<S-Right>','<M-S-l>'}]=('<Right>'):rep(5),
    ['<M-b>']='<S-Left>',
    ['<M-f>']='<S-Right>',
    [{'<C-b>','<M-h>'}]='<Left>',
    [{'<C-f>','<M-l>'}]='<Right>',
    ['<C-e>']='<End>',
    ['<C-a>']='<Home>',
    ['<C-g>']='<C-\\><C-n>',
  } do
    map('i',k,v)
    map('c',k,v,{silent=false})
  end

  ---- ;; xno/ono
  map('o','æ','y')
  for i in ([['"`()[]{}<>]]):gmatch('.') do
    map('o',i,'i'..i)
    map('x',i,'i'..i)
  end
  map('x','\r','d',{})
  map('x','j','v:count==0?"gj":"j"','expr')
  map('x','k','v:count==0?"gk":"k"','expr')
  map('x','.',':',{noremap=true})
  map('x','æ','"+y')
  map('x','å','"+p')
  map('x',{'<S-tab>','<A-h>','<'},'<gv')
  map('x',{'<tab>','<A-l>','>'},'>gv')
  map('x','A',[[mode()=="\x16"?"A":"<esc>:au InsertLeave * ++once :'<+1,'>norm! $\".p\r'<A"]],'expr')
  map('x','I',[[mode()=="\x16"?"I":"<esc>:au InsertLeave * ++once :'<+1,'>norm! _\".P\r'<I"]],'expr')
  map('x','y','ygv<esc>')
  map('x','p','P')
  map('x','P','p')
  map('x','gc',function () return require('vim._comment').operator()..'gv' end,'expr')

  ---- ;; tno
  map('t','<C-\\>','<C-\\><C-n>')
  map('t','<C-A-\\>','<C-\\><C-\\>')
  for i in ('hjkl'):gmatch('.') do
    map('t','<C-'..i..'>','<C-\\><C-n><C-w>'..i..'<cmd>if &buftype=="terminal"|startinsert|endif\r')
  end

  return ''
end,-1)
-- vim:ts=2
