----init
local key=require'utils.keymap'
local nno=key.nno
local ino=key.ino
local xno=key.xno
local tno=key.tno
local lcno=key.lcno
local ono=key.ono
local xbmap=key.xbmap

----nno
nno('g=','vgg=Gc')
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
nno('cd',':cd %:p:h|pwd\r')
nno('\r','dd',{})
nno('z','za')
nno('j','gj')
nno('k','gk')
nno('cw','dwi')
nno('cW','dWi')
nno('g:','q:')
nno('g/','q/')
nno('gp','`[v`]')
nno("' ",":let a=@/\r:s/['\"]/\\=submatch(0)=='\"'?\"'\":'\"'/g\r:let @/=a\r")
nno('vv','V')
nno('\\p','<cmd>Pckr status\r')
nno('gd',function ()
  if vim.lsp.buf_notify(0,'window/progress',{}) or #vim.fn.tagfiles()>0 then return '<C-]>'
  else return 'gd' end
end,{expr=true})
nno('gC',vim.lsp.buf.code_action)
nno('gr',':IncRename <C-r>=expand("<cword>")\r',{noremap=true})
------alt/ctrl
for k,v in pairs({h='vertical resize -',j='resize +',k='resize -',l='vertical resize +'}) do
  nno('<C-'..k..'>','<C-w>'..k..'<cmd>if &buftype=="terminal"|startinsert|endif\r')
  nno('<C-S-'..k..'>','<C-w>'..k:upper())
  nno('<C-A-'..k..'>',':'..v..'5\r')
  nno('<C-A-S-'..k..'>',':'..v..'1\r')
end
nno('<A-e>','/',{noremap=true})
nno('<A-a>','GVgg')
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
for k,v in pairs({h='Left',l='Right',j='Down',k='Up',w='S-Right',b='S-Left'}) do
  lcno('<A-'..k..'>','<'..v..'>')
  lcno('<A-S-'..k..'>',('<'..v..'>'):rep(5))
  ino('<A-'..k..'>','<'..v..'>')
  ino('<A-S-'..k..'>',('<'..v..'>'):rep(5))
end
lcno('<A-s>','<BS>')
lcno('<A-d>','<C-w>')
lcno('<C-S-v>','<C-r>+')
lcno('<C-A-v>','<C-r>+')
ino('<A-v>',function()
  local nr=vim.fn.getchar()
  vim.schedule_wrap(vim.api.nvim_paste)(vim.fn.list2blob{nr<64 and 0xc0 or 0xc1,nr%64+0x80},false,-1)
end)
ino('ø','ö')
ino('æ','ä')
ino('Ø','Ö')
ino('Æ','Ä')
ino('<A-d>','<C-w>')
ino('<A-x>','<del>')
ino('<A-s>','<bs>')
ino('<A-n>','ä')
ino('<A-S-n>','Ä')
ino('<A-m>','å')
ino('<A-S-m>','Å')
--emacs
for k,v in pairs{
  ['<M-b>']={'<S-Left>'},
  ['<M-f>']={'<S-Right>'},
  ['<C-n>']={'<Down>'},
  ['<C-p>']={'<Up>'},
  ['<C-b>']={'<Left>'},
  ['<C-f>']={'<Right>'},
  ['<M-lt>']={'<C-home>',false},
  ['<M-S-lt>']={'<C-end>',false},
  ['<C-e>']={'<End>'},
  ['<C-a>']={'<Home>'},
  ['<C-g>']={'<C-\\><C-n>'},
} do
  ino(k,v[1])
  if v[2]~=false then lcno(k,v[2] or v[1]) end
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
xno('<A-f>',':s///g<Left><Left><Left>',{noremap=true})
xno('.',':',{noremap=true})
xno('æ','"+y')
xno('å','"+p')
xno('<S-tab>','<gv')
xno('<tab>','>gv')
xbmap('A',"<esc>:au InsertLeave * ++once :'<+1,'>norm! $\".p\r'<A",'A')
xbmap('I',"<esc>:au InsertLeave * ++once :'<+1,'>norm! _\".P\r'<I",'I')
xno('y','ygv<esc>')
xno('p','P')
xno('P','p')
xno('gn','n')
xno('gN','N')
xno('n','y/\\c\\V<C-r>"\rgn')
xno('N','y?\\c\\V<C-r>"\rgn')

----tno
tno('<C-\\>','<C-\\><C-n>')
tno('<C-A-\\>','<C-\\><C-\\>')
for i in ('hjkl'):gmatch('.') do
  tno('<C-'..i..'>','<C-\\><C-n><C-w>'..i..'<cmd>if &buftype=="terminal"|startinsert|endif\r')
end

-- vim:fen
