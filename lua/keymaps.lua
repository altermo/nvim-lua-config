----init--
local fn=vim.fn
local key=require'utils.keymap'
local nno=key.nno
local ino=key.ino
local xno=key.xno
local tno=key.tno
local lnno=key.lnno
local lcno=key.lcno
local ono=key.ono

----map
vim.api.nvim_create_autocmd('FileType',{callback=function()
  nno('z','za',{nowait=true,buffer=true})
end})
for i in ([['"`()[]{}<>]]):gmatch('.') do
  ono(i,'i'..i)
  xno(i,'i'..i)
end
xno('\r','d',{})
nno('\r','dd',{})
xno('R',':Norm ',{})

----nno
nno('-','_')
nno('j','gj')
nno('k','gk')
nno('+','$')
nno('_','"_')
nno('cw','dwi')
nno('cW','dWi')
nno('g:','q:')
nno('g/','q/')
nno('gp','`[v`]')
nno("'",'`')
nno("' ",":s/['\"]/\\=submatch(0)=='\"'?\"'\":'\"'/g\r")
nno('vv','V')
------alt/ctrl
for k,v in pairs({h='vertical resize -',j='resize +',k='resize -',l='vertical resize +'}) do
  nno('<C-'..k..'>','<C-w>'..k..'<cmd>if &buftype=="terminal"|startinsert|endif\r')
  nno('<C-S-'..k..'>','<C-w>'..k:upper())
  nno('<C-A-'..k..'>',':'..v..'2\r')
  nno('<C-A-S-'..k..'>',':'..v..'10\r')
end
nno('<A-=>','<C-w>=')
lnno('<A-e>','/')
nno('<A-a>','GVgg')
nno('<A-d>','0D"_dd')
nno('<A-w>',':echo wordcount()\r')
nno('<A-y>',':let @+=@"\r')
nno('<A-j>',':move +1\r')
nno('<A-k>',':move -2\r')
nno('<A-h>','<<')
nno('<A-l>','>>')
nno('<A-.>','.')
nno('<C-.>','.')
lnno('<M-x>',':L ')
lnno('<A-f>',':%s///g<Left><Left><Left>')
for i=1,9 do
  nno('<A-'..i..'>',':tabnext '..i..'\r')
end
------other
nno('dq','viwf(<esc>%xgvx')
nno('~','gvo<esc>',{desc='jump to other end of last visual selected'})
nno('g=','vgg=Gc')
nno('<Home>',function ()
  for _,v in pairs(fn.getwininfo()) do
    if v.quickfix==1 then vim.cmd.cclose() return end
  end
  vim.cmd.copen()
  vim.cmd.wincmd('p')
end)
nno('|','~')
nno(',','<C-o>')
nno(';','<C-i>')
lnno('.',':')
nno('ø',':redo\r')
--nno('æ','z=')
nno('å','"+p')
nno('π','yyp')
nno('Π','yyP')
nno('<tab>','>>')
nno('<S-tab>','<<')
nno('cd',function ()
  local path=fn.expand('%:p:h') --[[@as string]]
  if path==fn.getcwd() then goto End end
  for i in vim.fs.parents(path..'/') do
    if vim.fs.dirname(i)==fn.getcwd() then
      fn.chdir(i)
      goto End
    end
  end
  fn.chdir('..')
  ::End::
  vim.cmd.pwd()
end)
nno('dc',':lcd ..|pwd\r')
local zo=0
nno('<C-z>',function ()
  zo=zo%3+1
  if zo==3 then vim.cmd.norm{'zb',bang=true}
  elseif zo==2 then vim.cmd.norm{'zt',bang=true}
  else
    vim.cmd.norm{'zz',bang=true}
    vim.api.nvim_create_autocmd('CursorMoved,CursorMovedI',{once=true,callback=function() zo=0 end,group=vim.api.nvim_create_augroup('Cz',{clear=true})})
  end
end)
nno('gh',function ()
  local iskeyword=vim.o.iskeyword
  vim.opt.iskeyword:append('.')
  local word=vim.fn.expand('<cword>') --[[@as string]]
  vim.o.iskeyword=iskeyword
  if vim.regex([[vim\.api\.]]):match_str(word) then word=vim.fn.expand('<cword>')..'()'
  elseif vim.regex([[vim\.uv\.]]):match_str(word) then word='uv.'..vim.fn.expand('<cword>')..'()'
  elseif vim.regex([[vim\.fn\.]]):match_str(word) then word=vim.fn.expand('<cword>')..'()'
  elseif vim.regex([[vim\.cmd\.]]):match_str(word) then word=':'..vim.fn.expand('<cword>')
  elseif vim.regex([[vim\.o\.]]):match_str(word) then word="'"..vim.fn.expand('<cword>').."'"
  elseif vim.regex([[vim\.opt\.]]):match_str(word) then word="'"..vim.fn.expand('<cword>').."'"
  end
  --TODO: try open hover in split with vim.lsp.buf_request('textDocument/hover')
  --vim.lsp.buf_request(0,'textDocument/hover',{},function(...) vim.pprint(...) end)
  vim.cmd.help(word)
end)
------lsp
nno('gd',function ()
  if vim.lsp.buf_notify(0,'window/progress',{}) or #vim.fn.tagfiles()>0 then return '<C-]>'
  else return 'gd' end
end,{expr=true})
nno('gC',':lua vim.lsp.buf.code_action()\r')

----ino/cno
for k,v in pairs({h='Left',l='Right',j='Down',k='Up'}) do
  lcno('<A-'..k..'>','<'..v..'>')
  lcno('<A-S-'..k..'>',('<'..v..'>'):rep(5))
end
lcno('<A-d>','<C-w>')
lcno('<A-c>','<S-Right><C-w>')
lcno('<A-b>','<S-Left>')
lcno('<A-w>','<S-Right>')
lcno('<C-e>','<End>')
lcno('<C-a>','<Home>')
lcno('<A-s>','<BS>')
lcno('<A-x>','<Del>')
lcno('<C-S-v>','<C-r>+')
lcno('<C-A-v>','<C-r>+')
ino('ø','ö')
ino('æ','ä')
ino('Ø','Ö')
ino('Æ','Ä')
ino('<C-w>','<C-o><C-w>')
for i in ('hjklwb'):gmatch('.') do
  ino('<A-'..i..'>','<C-o>'..i)
  ino('<A-S-'..i..'>','<C-o>5'..i)
end
for i in ('0u$_+-vVD'):gmatch('.') do
  ino('<A-'..i..'>','<C-o>'..i)
end
ino('<A-t>','<C-o>f')
ino('<A-T>','<C-o>T')
ino('<A-/>','<C-o>/',{noremap=true})
ino('<A-.>','<C-o>:',{noremap=true})
ino('<A-ø>','<cmd>redo\r')
ino('¨','<esc>')
ino('<A-BS>','<C-w>')
ino('<A-d>','<C-w>')
ino('<A-c>','<C-o>de')
ino('<A-a>c','<C-o>0<C-o>D')
ino('<A-a>d','<C-o>dd')
ino('<A-a><A-c>','<C-o>0<C-o>D')
ino('<A-a><A-d>','<C-o>dd')
ino('<A-C-v>','<C-o><C-v>')
ino('<A-s>','<bs>')
ino('<A-x>','<Del>')
ino('<A-S-S>','<C-w>')
ino('<A-S-X>','<C-o>dw')
ino('<A-p>','()<Left>')
ino('<A-n>','ä')
ino('<A-S-n>','Ä')
ino('<A-m>','å')
ino('<A-S-m>','Å')
--emacs
ino('<A-b>','<C-o>b')
ino('<A-f>','<C-o>w')
ino('<C-n>','<C-o>j')
ino('<C-p>','<C-o>k')
ino('<C-b>','<C-o>h')
ino('<C-f>','<C-o>l')
ino('<A-<>','<C-o>gg')
ino('<A->>','<C-o>G')
ino('<C-e>','<End>')
ino('<C-a>','<Home>')
ino('<C-g>','<esc>')

----xno
xno('j','gj')
xno('k','gk')
xno('-','_')
xno('+','$')
xno('gr','y:%s/<C-r>"/<C-r>"/g<Left><Left>',{noremap=true})
xno('<A-f>',':s/\\%V//g<Left><Left><Left>',{noremap=true})
xno('<A-e>',':G/ /norm! <S-left><bs>',{noremap=true})
xno('.',':',{noremap=true})
xno('å','"+y')
xno('<','<gv')
xno('>','>gv')
xno('<A-w>',':w !wc\r')
xno('<A-j>',':move \'>+1\rgv')
xno('<A-k>',':move \'<-2\rgv')
xno('<A-h>','<gv')
xno('<A-l>','>gv')
xno('A','mode()=="<C-v>"?"A":"<esc>:au InsertLeave * ++once :\'<+1,\'>norm! $\\".p\r\'<A"',{noremap=true,silent=true,expr=true})
xno('I','mode()=="<C-v>"?"I":"<esc>:au InsertLeave * ++once :\'<+1,\'>norm! _\\".P\r\'<I"',{noremap=true,silent=true,expr=true})
xno('_','"_')

----tno
tno('<C-\\>','<C-\\><C-n>')
tno('<C-?>','<C-\\><C-\\><C-n>')
tno('<C-]><C-]>','<C-\\><C-n>')
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
  xno(i,'<nop>')
  lcno(i,'<nop>')
end

-- vim:fen
