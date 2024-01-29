----init
local key=require'utils.keymap'
local nno=key.nno
local ino=key.ino
local xno=key.xno
local tno=key.tno
local lcno=key.lcno
local ono=key.ono

----nno
nno('g=',function () local s=vim.fn.winsaveview() vim.cmd'keepjumps norm! gg=G' vim.fn.winrestview(s) end)
nno('gz','z')
nno('gu','~')
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
  vim.cmd.lcd'%:p:h'
  local dir=vim.fs.dirname(vim.fs.find('.git',{upward=true})[1])
  if dir then vim.cmd('cd '..dir) end
  vim.cmd.pwd()
end)
nno('dc',':lcd ..|pwd\r')
nno('cd',':lcd %:p:h|pwd\r')
nno('\r','dd',{})
nno('z','za')
nno('j','gj')
nno('k','gk')
nno('g:','q:')
nno('g/','q/')
nno('gp','`[v`]')
nno('" ',":let a=@/\r:s/['\"]/\\=submatch(0)=='\"'?\"'\":'\"'/g\r:let @/=a\r")
nno('vv','V')
nno('\\p','<cmd>Lazy\r')
nno('gd',function () return (vim.lsp.buf_notify(0,'window/progress',{}) or #vim.fn.tagfiles()>0) and '<C-]>' or 'gd' end,{expr=true})
nno('gr',':IncRename <C-r>=expand("<cword>")\r',{noremap=true})
------alt/ctrl
for k,v in pairs({h='vertical resize -',j='resize +',k='resize -',l='vertical resize +'}) do
  nno('<C-'..k..'>','<C-w>'..k..'<cmd>if &buftype=="terminal"|startinsert|endif\r')
  nno('<C-S-'..k..'>','<C-w>'..k:upper())
  nno('<C-A-'..k..'>',':'..v..'5\r')
  nno('<C-A-S-'..k..'>',':'..v..'1\r')
end
nno('<A-e>','/',{noremap=true})
nno('<A-a>','G:keepjumps norm! Vgg\r')
nno('<A-y>',':let @+=@"\r')
nno('<A-j>',':move +1\r')
nno('<A-k>',':move -2\r')
nno({'<A-.>','<C-.>'},'.')
nno('<M-x>',':L ',{noremap=true})
nno('<A-f>',':%s///g<Left><Left><Left>',{noremap=true})
for i=1,9 do
  nno('<A-'..i..'>',':tabnext '..i..'\r')
end
nno('gs',':sort ',{silent=false}) -- https://github.com/neovim/neovim/issues/19354
nno('=','z=')
nno('<BS>','==<BS>')
nno('0','(reg_recording()==""&&reg_executing()==""&&col(".")==1)?"^":"0"',{expr=true})
nno('U',':later 1f\r')

----ino/cno
lcno('<C-S-v>','<C-r>+')
lcno('<C-A-v>','<C-r>+')
ino('<A-v>',function()
  local nr=vim.fn.getchar()
  vim.schedule_wrap(vim.api.nvim_paste)(string.char(nr<64 and 0xc0 or 0xc1,nr%64+0x80),false,-1)
end)
ino('ø','ö')
ino('æ','ä')
ino('Ø','Ö')
ino('Æ','Ä')
ino('<A-o>','<end><cr>')
for k,v in pairs({h='Left',l='Right',j='Down',k='Up',w='S-Right',b='S-Left'}) do
  lcno('<A-'..k..'>','<'..v..'>')
  lcno('<A-S-'..k..'>',('<'..v..'>'):rep(5))
  ino('<A-'..k..'>','<'..v..'>')
  ino('<A-S-'..k..'>',('<'..v..'>'):rep(5))
end
for k,v in pairs{
  ['<A-s>']='<BS>',
  ['<A-d>']='<C-W>',
  ['<A-x>']='<Del>',
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
xno('j','gj')
xno('k','gk')
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

----tno
tno('<C-\\>','<C-\\><C-n>')
tno('<C-A-\\>','<C-\\><C-\\>')
for i in ('hjkl'):gmatch('.') do
  tno('<C-'..i..'>','<C-\\><C-n><C-w>'..i..'<cmd>if &buftype=="terminal"|startinsert|endif\r')
end

-- vim:fen
