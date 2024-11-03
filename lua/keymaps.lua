----init
local function map(mode,lhs,rhs,opt)
  if type(rhs)=="function" then
    opt.callback=rhs
    rhs=''
  end
  opt.noremap=opt.noremap~=false
  if opt.expr==true then opt.replace_keycodes=true end
  for _,i in ipairs(type(lhs)=='table' and lhs or {lhs}) do vim.api.nvim_set_keymap(mode,i --[[@as string]],rhs,opt) end
end
---@overload fun(lhs:string|string[],rhs:string|function,opt?:table)
local function nno(lhs,rhs,opt) map('n',lhs,rhs,opt or {silent=true}) end
---@overload fun(lhs:string|string[],rhs:string|function,opt?:table)
local function ino(lhs,rhs,opt) map('i',lhs,rhs,opt or {silent=true}) end
---@overload fun(lhs:string|string[],rhs:string|function,opt?:table)
local function xno(lhs,rhs,opt) map('x',lhs,rhs,opt or {silent=true}) end
---@overload fun(lhs:string|string[],rhs:string|function,opt?:table)
local function tno(lhs,rhs,opt) map('t',lhs,rhs,opt or {silent=true}) end
---@overload fun(lhs:string|string[],rhs:string|function,opt?:table)
local function ono(lhs,rhs,opt) map('o',lhs,rhs,opt or {silent=true}) end
---@overload fun(lhs:string|string[],rhs:string|function,opt?:table)
local function lcno(lhs,rhs,opt) map('c',lhs,rhs,opt or {}) end

----nno
vim.api.nvim_del_keymap('n','gcc')
nno('gc',function () return require('vim._comment').operator()..'_' end,{expr=true})
nno(' ',function ()
  vim.keymap.del('n',' ')
  require'spacekey'
  vim.api.nvim_input(' ')
end)
nno('z','za')
nno('<A-e>','/',{noremap=true})
nno('<A-f>',':%s///g<Left><Left><Left>',{noremap=true})
nno(',','<C-o>')
nno(';','<C-i>')
nno('.',':',{noremap=true})
nno('ø',':redo\r')
nno('å','"+p')
nno('æ','"+y')
nno('π','yyp')
nno({'<tab>','<A-l>'},'a<C-T><esc>')
nno({'<S-tab>','<A-h>'},'a<C-D><esc>')
nno('cD',function()
  pcall(vim.cmd.lcd,vim.fs.root(0,'.git') or vim.fn.expand('%:p:h'))
  vim.cmd.pwd()
end)
nno('dc',':lcd ..|pwd\r')
nno('cd',':lcd %:p:h|pwd\r')
nno('\r','dd',{})
nno('j','v:count==0?"gj":"j"',{expr=true})
nno('k','v:count==0?"gk":"k"',{expr=true})
nno('g:','q:')
nno('g/','q/')
nno('gp','`[v`]')
nno('vv','V')
nno('\\p','<cmd>Lazy\r')
nno('gd',function () return (vim.o.tagfunc~='' or #vim.fn.tagfiles()>0) and '<C-]>' or 'gd' end,{expr=true})
nno('gr',vim.lsp.buf.rename,{noremap=true})
------alt/ctrl
for k,v in pairs({h='vertical resize -',j='resize +',k='resize -',l='vertical resize +'}) do
  nno('<C-'..k..'>','<C-w>'..k..'<cmd>if &buftype=="terminal"|startinsert|endif\r')
  nno('<C-S-'..k..'>','<C-w>'..k:upper())
  nno('<C-A-'..k..'>',':'..v..'5\r')
  nno('<C-A-S-'..k..'>',':'..v..'1\r')
end
nno('<A-a>','G:keepjumps norm! Vgg\r')
nno('<A-y>',':let @+=@"\r')
nno('<A-j>',':move +1\r')
nno('<A-k>',':move -2\r')
nno({'<A-.>','<C-.>'},'.')
nno({'<M-x>','<M-S-.>'},':lua=',{noremap=true})
for i=1,9 do
  nno('<A-'..i..'>',':tabnext '..i..'\r')
end
nno('=','z=')
nno('0','(reg_recording()==""&&reg_executing()==""&&col(".")==1)?"^":"0"',{expr=true})
nno('U',':later 1f\r')
nno('<F6>',':source\r')
nno('<C-z>','zz')
nno('q','(reg_recording()==""?"qq":"q")',{expr=true})
nno('Q','(reg_recording()==""?reg_executing()==""?"@q":"":v:lua.vim.notify("Cant play macro while recoding")??"")',{expr=true})
nno('cq','<cmd>let b:_macro=input(">",keytrans(@q))|let @q=(trim(b:_macro)!=""?v:lua.vim.keycode(b:_macro):@q)\r')
for k,v in pairs({
  b={'background','"light"','"dark"'},c='cursorline',h='hlsearch',l='list',n='number',
  r='relativenumber',s='spell',u='cursorcolumn',w='wrap',d='diff',t={'colorcolumn',
  '"1,41,81,121,161,201,241"'},v={'virtualedit','"block,onemore"'},M={'mouse','"a"'},
  f='foldenable',e='scrollbind',m={'conceallevel',2,0},T={'showtabline',1,0},
  L={'laststatus',2,0},C={'cmdheight',0},B={'showbreak'},
}) do
  v=type(v)=='table' and v or {v,1,0}
  nno('yo'..k,(':let &%s%s=&%s==%s?%s:%s\r:echo "%s=".&%s\r'):format(k=='d' and 'l:' or '',v[1],v[1],v[2],v[3] or '""',v[2],v[1],v[1]))
end
nno('yo',function() vim.cmd.nno('yo') local c=vim.fn.getcharstr()
  vim.cmd.redraw() if vim.fn.maparg('yo'..c,'n')==1 then vim.api.nvim_input('yo'..c) end end)

----ino/cno
lcno({'<C-S-v>','<C-A-v>'},'<C-r>+')
ino('<A-v>',function()
  local nr=vim.fn.getchar()
  vim.schedule_wrap(vim.api.nvim_paste)(string.char(nr<64 and 0xc0 or 0xc1,nr%64+0x80),false,-1)
end)
ino('ø','ö')
ino('æ','ä')
ino('Ø','Ö')
ino('Æ','Ä')
for k,v in pairs({h='Left',l='Right',j='Down',k='Up',w='S-Right',b='S-Left'}) do
  lcno('<A-'..k..'>','<'..v..'>')
  lcno('<A-S-'..k..'>',('<'..v..'>'):rep(5))
  ino('<A-'..k..'>','<'..v..'>')
  ino('<A-S-'..k..'>',('<'..v..'>'):rep(5))
end
for k,v in pairs{
  [{'<C-BS>','<M-BS>','<S-BS>'}]='<del>',
  --emacs{{
  ['<M-b>']='<S-Left>',
  ['<M-f>']='<S-Right>',
  ['<C-n>']='<Down>',
  ['<C-p>']='<Up>',
  ['<C-b>']='<Left>',
  ['<C-f>']='<Right>',
  ['<M-lt>']='<C-home>',
  ['<M-S-lt>']='<C-end>',
  ['<C-e>']='<End>',
  ['<C-a>']='<Home>',
  ['<C-g>']='<C-\\><C-n>',
  --}}
} do
  ino(k,v)
  lcno(k,v)
end

----xno/ono
ono('æ','y')
for i in ([['"`()[]{}<>]]):gmatch('.') do
  ono(i,'i'..i)
  xno(i,'i'..i)
end
xno('\r','d',{})
xno('j','v:count==0?"gj":"j"',{expr=true})
xno('k','v:count==0?"gk":"k"',{expr=true})
xno('.',':',{noremap=true})
xno('æ','"+y')
xno('å','"+p')
xno({'<S-tab>','<A-h>','<'},'<gv')
xno({'<tab>','<A-l>','>'},'>gv')
xno('A',[[mode()=="\x16"?"A":"<esc>:au InsertLeave * ++once :'<+1,'>norm! $\".p\r'<A"]],{expr=true})
xno('I',[[mode()=="\x16"?"I":"<esc>:au InsertLeave * ++once :'<+1,'>norm! _\".P\r'<I"]],{expr=true})
xno('y','ygv<esc>')
xno('p','P')
xno('P','p')
vim.api.nvim_del_keymap('o','gc')
xno('gc',function () return require('vim._comment').operator()..'gv' end,{expr=true})

----tno
tno('<C-\\>','<C-\\><C-n>')
tno('<C-A-\\>','<C-\\><C-\\>')
for i in ('hjkl'):gmatch('.') do
  tno('<C-'..i..'>','<C-\\><C-n><C-w>'..i..'<cmd>if &buftype=="terminal"|startinsert|endif\r')
end

-- vim:fen
