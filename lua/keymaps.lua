----init--
local fn=vim.fn
local function map(kind,key,maps,opts)
  vim.keymap.set(kind,key,maps,opts)
end
local function nno(key,maps)
  map('n',key,maps,{noremap=true,silent=true})
end
local function lnno(key,maps)
  map('n',key,maps,{noremap=true})
end
local function lvno(key,maps)
  map('x',key,maps,{noremap=true})
end
local function vno(key,maps)
  map('x',key,maps,{noremap=true,silent=true})
end
local function lino(key,maps)
  map('i',key,maps,{noremap=true})
end
local function ino(key,maps)
  map('i',key,maps,{noremap=true,silent=true})
end
local function lcno(key,maps)
  map('c',key,maps,{noremap=true})
end
local function tno(key,maps)
  map('t',key,maps,{noremap=true,silent=true})
end

vim.api.nvim_create_autocmd('BufEnter',{command=[[
nnoremap <nowait><buffer> z za
nnoremap <nowait><buffer> ! :!|     "may be remapt
]]})

----map
map('n','\'','<cmd>lua require("which-key").show("\'",{mode="n",auto=true)\r',{})
map('x','\r','d',{})
map('n','\r','dd',{})
map('x','s',':norm ',{})

----nno
------alt/ctrl
for k,v in pairs({h='vertical resize -',j='resize +',k='resize -',l='vertical resize +'}) do
  nno('<C-'..k..'>','<C-w>'..k)
  nno('<C-S-'..k..'>','<C-w>'..k:upper())
  nno('<C-A-'..k..'>',':'..v..'2\r')
  nno('<C-A-S-'..k..'>',':'..v..'10\r')
end
nno('<A-=>','<C-w>=')
lnno('<A-e>','/')
lnno('<A-f>',':%s///g<Left><Left><Left>')
lnno('<A-S-a>',':% ')
nno('<A-a>','GVgg')
nno('<A-d>','0D"_dd')
nno('<A-s>',']s')
nno('<A-S-s>','[s')
nno('<A-c>','yyp')
nno('<A-S-c>','yyP')
nno('<A-b>',':lua Build()\r')
nno('<A-S-b>',':lua Build(1)\r')
nno('<A-w>',':echo wordcount()\r')
nno('<A-y>',':let @+=@"\r')
nno('<A-j>',':move +1\r')
nno('<A-k>',':move -2\r')
nno('<A-h>','<<')
nno('<A-l>','>>')
nno('<C-.>','.')
nno('<M-x>',Mx)
------alt-gr
nno('“',':lua Build()\r')
nno('‘',':lua Build(1)\r')
nno('π','yyp')
------other
nno('gV','gvo<esc>')
nno('<Home>',QuickFixToggle)
nno('|','~')
nno(',','<C-o>')
nno(';','<C-i>')
lnno('.',':')
nno('<BS>',':lua require("neoscroll").zz(250)\r')
nno('ø',':redo\r')
nno('æ','z=')
nno('å','"+p')
nno('mw','"xdiw"axviw<esc>"ap"xp')
--nno('j','gj')
--nno('k','gk')
nno('\t','<C-w>w')
nno('<F5>',':lua Build()\r')
nno('L','gt')
nno('H','gT')
for i=0,9 do
    nno('\\f'..i,':set foldlevel='..i..'\r')
end
nno('zl','zL')
nno('zh','zH')
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
    vim.cmd'pwd'
end)
nno('dc',':lcd ..|pwd\r')
------lsp
nno('gd',':lua vim.lsp.buf.definition()\r')
nno('gr',':lua vim.lsp.buf.rename()\r')
nno('gC',':lua vim.lsp.buf.code_action()\r')

----ino/cno
ino('ø','ö')
ino('æ','ä')
ino('Ø','Ö')
ino('Æ','Ä')
ino('ö','ø')
ino('ä','æ')
ino('Ö','Ø')
ino('Ä','Æ')
for i in ('hjklwb'):gmatch('.') do
  ino('<A-'..i..'>','<C-o>'..i)
  ino('<A-S-'..i..'>','<C-o>5'..i)
end
for i in ('u'):gmatch('.') do
  ino('<A-'..i..'>','<C-o>'..i)
end
lino('<A-.>','<C-o>:')
ino('<A-ø>','<cmd>redo\r')
ino('<A-æ>','<C-o>z=')
ino('<A- >','<C-o>')
ino('<C- >','<C-o>')
lcno('<A-h>','<Left>')
lcno('<A-l>','<Right>')
lcno('<A-j>','<Down>')
lcno('<A-k>','<Up>')
lcno('<A-S-h>','<S-Left>')
lcno('<A-S-l>','<S-Right>')
lcno('<A-S-j>','<S-Down>')
lcno('<A-S-k>','<S-Up>')
lcno('<A-BS>','<C-w>')
ino('<C-w>','<C-o><C-w>')
ino('¨','<esc>')
ino('<A-e>','<End>')
ino('<A-0>','<Home>')
ino('<M-BS>','<C-o>db')

----vno
vno('&','<cmd>lua require"hop".hint_lines()\r')
lvno('gr','y:execute("%s/<C-r>"/".input(\'>\')."/g")\r<C-r>"')
vno('gG','y:!setsid firefox https://www.github.com/<C-r>"\r')
vno('å','"+y')
lvno('Ø',':sort')
vno('<','<gv')
vno('>','>gv')
vno('<A-w>','<cmd>w !wc\r')
vno('<A-j>',':move \'>+1\rgv')
vno('<A-k>',':move \'<-2\rgv')
vno('<A-h>','<gv')
vno('<A-l>','>gv')
lvno('<A-f>',':s/\\%V//g<Left><Left><Left>')
lvno('.',':')
vno('k','gk')
vno('j','gj')
vno(' ','<cmd>lua require"hop".hint_char1()\r')
vim.keymap.set('x','A','mode()=="<C-v>"?"A":"<esc>:au InsertLeave * ++once :\'<+1,\'>norm! $\\".p\r\'<A"',{noremap=true,silent=true,expr=true})
vim.keymap.set('x','I','mode()=="<C-v>"?"I":"<esc>:au InsertLeave * ++once :\'<+1,\'>norm! _\\".P\r\'<I"',{noremap=true,silent=true,expr=true})

----tno
tno('<C-\\>','<C-\\><C-n>')
for i in ('hjkl'):gmatch('.') do
  tno('<C-'..i..'>','<C-\\><C-n><C-w>'..i)
end

----no keys
for _,i in pairs({'<left>','<right>','<up>','<down>'}) do
  nno(i,'<nop>')
  ino(i,'<nop>')
  vno(i,'<nop>')
  lcno(i,'<nop>')
end
nno('ZZ','<nop>')
nno('ZQ','<nop>')

----may-be remapt
nno('Å','"+')
nno('-','_')
vno('-','_')
nno('+','$')
vno('+','$')
nno('?','?')
nno('&','n')
lnno('Ø',':sort')
nno('vv','V')
nno('vvv','<C-v>')

------leader
nno('\\ew',':exec("e "..fnameescape(expand("%:h"))."/") \r')
nno('\\es',':exec("sp "..fnameescape(expand("%:h"))."/") \r')
nno('\\ev',':exec("vsp "..fnameescape(expand("%:h"))."/") \r')
nno('\\et',':exec("tabe "..fnameescape(expand("%:h"))."/") \r')
nno('\\q','gwip')

-- vim:fen
