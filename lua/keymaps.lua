----init--
local fn=vim.fn
local key=require'utils.keymap'
local nno=key.nno
local ino=key.ino
local xno=key.xno
local vno=key.xno
local tno=key.tno
local lnno=key.lnno
local lcno=key.lcno

vim.api.nvim_create_autocmd('FileType',{callback=function()
  nno('z','za',{nowait=true,buffer=true})
end})

----map
xno('\r','d',{})
nno('\r','dd',{})
xno('s',':Norm ',{})

----nno
------alt/ctrl
for k,v in pairs({h='vertical resize -',j='resize +',k='resize -',l='vertical resize +'}) do
  nno('<C-'..k..'>','<C-w>'..k..'<cmd>if &buftype=="terminal"|startinsert|endif\r')
  nno('<C-S-'..k..'>','<C-w>'..k:upper())
  nno('<C-A-'..k..'>',':'..v..'2\r')
  nno('<C-A-S-'..k..'>',':'..v..'10\r')
end
nno('<A-=>','<C-w>=')
lnno('<A-e>','/')
lnno('<A-r>',':G/')
lnno('<A-S-a>',':% ')
nno('<A-a>','GVgg')
nno('<A-d>','0D"_dd')
nno('<A-c>','yyp')
nno('<A-S-c>','yyP')
nno('<A-w>',':echo wordcount()\r')
nno('<A-y>',':let @+=@"\r')
nno('<A-j>',':move +1\r')
nno('<A-k>',':move -2\r')
nno('<A-h>','<<')
nno('<A-l>','>>')
nno('<C-.>','.')
lnno('<M-x>',':lua=')
------alt-gr
nno('π','yyp')
------other
--nno('s','') -- TODO
lnno('gR',':%s/\\<<C-r>=expand("<cword>")\r\\>/<C-r>=expand("<cword>")\r/g<Left><Left>')
lnno('<A-f>',':%s///g<Left><Left><Left>')
nno('¤','gvo<esc>')
nno('g=','magg=G`a')
nno('<Home>',QuickFixToggle)
nno('|','~')
nno(',','<C-o>')
nno(';','<C-i>')
lnno('.',':')
nno('<BS>',':lua require("neoscroll").zz(250)\r')
nno('ø',':redo\r')
nno('æ','z=')
nno('å','"+p')
nno('>w','"xdiw"axviw<esc>"ap"xp')
nno('<w','viwo<esc>b"xdiw"axviw<esc>"ap"xpbb')
--nno('j','gj')
--nno('k','gk')
nno('\t','<C-w>w')
nno('L','gt')
nno('H','gT')
--nno('zl','zL')
--nno('zh','zH')
nno('cd',function ()
  local path=fn.expand('%:p:h')
  if path==fn.getcwd() then goto End end
  while path~='/' do
    if fn.fnamemodify(path,':h')==fn.getcwd() then
      fn.chdir(path)
      goto End
    end
    path=fn.fnamemodify(path,':h')
  end
  fn.chdir('..')
  ::End::
  vim.cmd.pwd()
end)
nno('dc',':lcd ..|pwd\r')
local zo=0
nno('<C-z>',function ()
  if zo==2 then
    zo=0
    vim.cmd.norm{'zb',bang=true}
  elseif zo==1 then
    vim.cmd.norm{'zt',bang=true}
    zo=2
  else
    vim.cmd.norm{'zz',bang=true}
    zo=1
    vim.api.nvim_create_autocmd('CursorMoved,CursorMovedI',{once=true,callback=function() zo=0 end,group=vim.api.nvim_create_augroup('Cz',{clear=true})})
  end
end)
nno('ghk',':execute("h ".nr2char(getchar()))\r')
------lsp
nno('gd',':lua vim.lsp.buf.definition()\r')
--nno('gr',':lua vim.lsp.buf.rename()\r')
nno('gC',':lua vim.lsp.buf.code_action()\r')

----ino/cno
for k,v in pairs({h='Left',l='Right',j='Down',k='Up'}) do
  lcno('<A-'..k..'>','<'..v..'>')
  lcno('<A-S-'..k..'>','<S-'..v..'>')
end
lcno('<A-d>','<C-w>')
lcno('<A-b>','<S-Left>')
lcno('<A-e>','<S-Right>')
lcno('<A-b>','<S-Left>')
lcno('<A-w>','<S-Right>')
lcno('<A-+>','<End>')
lcno('<A-0>','<Home>')
lcno('<C-e>','<End>')
lcno('<C-a>','<Home>')
lcno('<A-s>','<BS>')
lcno('<A-x>','<Del>')
ino('ø','ö')
ino('æ','ä')
ino('Ø','Ö')
ino('Æ','Ä')
ino('ö','ø')
ino('ä','æ')
ino('Ö','Ø')
ino('Ä','Æ')
ino('<C-w>','<C-o><C-w>')
for i in ('hjklwbn'):gmatch('.') do
  ino('<A-'..i..'>','<C-o>'..i)
  ino('<A-S-'..i..'>','<C-o>5'..i)
end
for i in ('0u$_+-fvFVtTD'):gmatch('.') do
  ino('<A-'..i..'>','<C-o>'..i)
end
ino('<A-/>','<C-o>/',{noremap=true})
ino('<A-.>','<C-o>:',{noremap=true})
ino('<A-ø>','<cmd>redo\r')
ino('<A-æ>','<C-o>z=')
ino('¨','<esc>')
ino('<A-BS>','<C-o>db')
ino('<A-d>','<C-w>')
ino('<A-c>','<C-o>ce')
ino('<A-,>','<C-o>;')
ino('<A-;>','<C-o>,')
ino('<A-a>c','<C-o>cc')
ino('<A-a>d','<C-o>dd')
ino('<A-a><A-c>','<C-o>cc')
ino('<A-a><A-d>','<C-o>dd')
ino('<A-C-v>','<C-o><C-v>')
ino('<A-s>','<bs>')
ino('<A-x>','<Del>')
ino('<A-S-S>','<C-w>')
ino('<A-S-X>','<C-o>dw')
ino('<A-p>','()<Left>')
ino('<A-P>',')')
ino('<A-<>','<C-o><<')
ino('<A->>','<C-o>>>')
ino('<A-g>','<C-o>gg')
ino('<A-G>','<C-o>G')
ino('<A-n>','ä')
ino('<A-S-n>','Ä')
ino('<A-m>','å')
ino('<A-S-m>','Å')

----vno
vno('gr','y:%s/<C-r>"/<C-r>"/g<Left><Left>',{noremap=true})
vno('Ø',':sort',{noremap=true})
vno('<A-f>',':s/\\%V//g<Left><Left><Left>',{noremap=true})
vno('<A-r>',':G/',{noremap=true})
vno('.',':',{noremap=true})
vno('&','<cmd>lua require"hop".hint_lines()\r')
vno('gG','y:!setsid firefox https://www.github.com/<C-r>"\r')
vno('å','"+y')
vno('<','<gv')
vno('>','>gv')
vno('<A-w>','<cmd>w !wc\r')
vno('<A-j>',':move \'>+1\rgv')
vno('<A-k>',':move \'<-2\rgv')
vno('<A-h>','<gv')
vno('<A-l>','>gv')
--vno('k','gk')
--vno('j','gj')
vno(' ','<cmd>lua require"hop".hint_char1()\r')
xno('A','mode()=="<C-v>"?"A":"<esc>:au InsertLeave * ++once :\'<+1,\'>norm! $\\".p\r\'<A"',{noremap=true,silent=true,expr=true})
xno('I','mode()=="<C-v>"?"I":"<esc>:au InsertLeave * ++once :\'<+1,\'>norm! _\\".P\r\'<I"',{noremap=true,silent=true,expr=true})

----tno
tno('<C-\\>','<C-\\><C-n>')
for i in ('hjkl'):gmatch('.') do
  tno('<C-'..i..'>','<C-\\><C-n><C-w>'..i..'<cmd>if &buftype=="terminal"|startinsert|endif\r')
end
tno('<A-S-h>','<S-Left>')
tno('<A-S-l>','<S-Right>')
tno('<A-S-j>','<S-Down>')
tno('<A-S-k>','<S-Up>')

----no keys
for _,i in pairs({'<left>','<right>','<up>','<down>'}) do
  nno(i,'<nop>')
  ino(i,'<nop>')
  vno(i,'<nop>')
  lcno(i,'<nop>')
end

----may-be remapt
nno('Å','"+')
nno('-','_')
vno('-','_')
nno('+','$')
vno('+','$')
nno('v','v')
nno('vv','V')
nno('vvv','<C-v>')
lnno('Ø',':sort')

-- vim:fen
