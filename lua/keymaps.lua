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
  map('v',key,maps,{noremap=true})
end
local function vno(key,maps)
  map('v',key,maps,{noremap=true,silent=true})
end
local function ino(key,maps)
  map('i',key,maps,{noremap=true,silent=true})
end
local function tno(key,maps)
  map('t',key,maps,{noremap=true,silent=true})
end
local function togglecomment()
    local left,_=vim.o.commentstring:match('^(.*)%%s(.*)')
    if left:find(' $') then
        left=string.sub(left,1,-2)
    end
    local line=vim.api.nvim_get_current_line()
    if line:find('^%s*'..vim.pesc(left)) then
        local temp=fn.getreg('/')
        vim.cmd([[s/^\(\s*\)]]..fn.escape(left,'[]\\')..[[/\1]])
        fn.setreg('/',temp)
    else
        vim.cmd('norm I'..left)
    end
end --TODO

vim.api.nvim_create_autocmd('BufWinEnter',{command=[[
vnoremap <silent> S <cmd>HopChar1<cr>
nnoremap <nowait><buffer> z za
]]}) --TODO

----map
map('n','\'','<cmd>lua require("which-key").show("\'",{mode="n",auto=true)\r',{}) --TODO
map('v','\r','d',{})
map('n','\r','dd',{})

----nno
------other
nno('<Home>',QuickFixToggle)
nno('|','~')
nno(',','<C-o>')
nno(';','<C-i>')
lnno('.',':')
nno('<BS>',':lua require("neoscroll").zz(250)\r')
nno('ø',':redo\r')
nno('æ','z=')
nno('å','"+p')
nno('mw','lb"ade"bxe"bp"apbb')
nno('j','gj')
nno('k','gk')
for k,v in pairs({h='vertical resize -',j='resize +',k='resize -',l='vertical resize +'}) do
  nno('<C-'..k..'>','<C-w>'..k)
  nno('<C-S-'..k..'>','<C-w>'..k:upper())
  nno('<A-'..k..'>',':'..v..'2\r')
end
nno('<A-=>','<C-w>=')
nno('\t','<C-w>w')
nno('<F5>',':lua Build()\r')
nno('gc',togglecomment)
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
    vim.notify(fn.getcwd())
end) --TODO
nno('dc',':lcd ..|pwd\r') --TODO
nno('S',':HopChar1<cr>')
------alt-gr
nno('ª','[s')                         --alt_gr-a
nno('º',']s')                         --alt_gr-A
nno('π','yyp')                        --alt_gr-p
nno('Π','yyP')                        --alt_gr-P
nno('“',':lua Build()\r')             --alt_gr-b
nno('‘',':lua Build(1)\r')            --alt_gr-B
nno('ſ',':echo wordcount()\r')        --alt_gr-w
nno('←',':let @+=@"\r')               --alt_gr-y
lnno('đ',':%s///g<Left><Left><Left>') --alt_gr-f
nno('ð',':move +1\r')                 --alt_gr-d
nno('↓',':move -2\r')                 --alt_gr-u
nno('gN','yi\':e <C-r>=stdpath("config")\r/lua/<C-r>=substitute("<C-r>"","\\\\.","/","g")\r.lua\r')

----ino
ino('ø','ö')
ino('æ','ä')
ino('Ø','Ö')
ino('Æ','Ä')
for i in ('hjklwb'):gmatch('.') do
  ino('<A-'..i..'>','<C-o>'..i)
end
ino('ß','()<Left>') --alt_gr-s
ino('€','=')        --alt_gr-e
ino('<C-w>','<C-o><C-w>')
ino('¨','<esc>')
ino('ſ','<Right>')
ino('¦','<Left>')
--TODO more ctrl...
----vno
vno('s',':norm')
vno('gG','y:!setsid firefox https://www.github.com/<C-r>"\r')
vno('gc','echo "TODO"') --TODO
vno('å','"+y')
lvno('Ø',':sort')
vno('<','<gv')
vno('>','>gv')
vno('ſ','<cmd>w !wc\r')              --alt_gr-w
vno('ð',':move \'>+1\rgv')           --alt_gr-d
vno('↓',':move \'<-2\rgv')           --alt_gr-u
vno('J',':move \'>+1\rgv')
vno('K',':move \'<-2\rgv')
lvno('đ',':s/\\%V//g<Left><Left><Left>') --alt_gr-f
lvno('.',':')
vno('k','gk')
vno('j','gj')
vno(' ','<cmd>HopLine\r')

------add-parenteses
for _,i in pairs({'()','{}','[]','""',"''",'``','<>'}) do
  local b,e=i:gmatch('.')(),i:gmatch('.(.)')()
  vno('&'..b,'<esc>`>a'..e..'<esc>`<i'..b..'<esc>')
  vno('&'..e,'<esc>`>a'..e..'<esc>`<i'..b..'<esc>')
end
vno('&?','<esc>`>a?<esc>`<i¿<esc>')
vno('&!','<esc>`>a!<esc>`<i¡<esc>')

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
nno('#','n')
map('n','!',':!',{noremap=true,unique=true,nowait=true}) --TODO
lnno('Ø',':sort')
nno('vv','V')
vno('p','"_dP') --TODO miniyank for visual

------leader
nno('\\ew',':exec("e "..fnameescape(expand("%:h"))."/") \r')
nno('\\es',':exec("sp "..fnameescape(expand("%:h"))."/") \r')
nno('\\ev',':exec("vsp "..fnameescape(expand("%:h"))."/") \r')
nno('\\et',':exec("tabe "..fnameescape(expand("%:h"))."/") \r')
nno('\\ff','[I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"\r')
nno('\\q','gwip')
-- vim:fen
