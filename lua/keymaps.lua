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
nno('|','_')
nno(',','<C-o>')
nno(';','<C-i>')
nno('.',':',{noremap=true})
nno('ø',':redo\r')
nno('å','"+p')
nno('æ','"+y')
nno('π','yyp')
nno('Π','yyP')
nno('<tab>','>>')
nno('<S-tab>','<<')
nno('cd',function ()
  local path=vim.fn.expand('%:p:h') --[[@as string]]
  if path==vim.fn.getcwd() then goto End end
  for i in vim.fs.parents(path..'/') do
    if vim.fs.dirname(i)==vim.fn.getcwd() then
      vim.fn.chdir(i)
      goto End
    end
  end
  vim.fn.chdir('..')
  ::End::
  vim.cmd.pwd()
end)
nno('cD',function()
  vim.cmd.lcd'%:p:h'
  local dir=vim.fs.dirname(vim.fs.find('.git',{upward=true})[1])
  if dir then vim.cmd('cd '..dir) end
  vim.cmd.pwd()
end)
nno('dc',':lcd ..|pwd\r')
nno('dC',':cd %:p:h|pwd\r')
local zo=0
nno('<C-z>',function ()
  zo=zo%3+1
  if zo==3 then vim.cmd.norm{'zb',bang=true}
  elseif zo==2 then vim.cmd.norm{'zt',bang=true}
  else
    vim.cmd.norm{'zz',bang=true}
    vim.api.nvim_create_autocmd({'CursorMoved','CursorMovedI'},{once=true,callback=function() zo=0 end,group=vim.api.nvim_create_augroup('Cz',{clear=true})})
  end
end)
nno('gh',function ()
  local word=vim.fn.expand('<cfile>') --[[@as string]]
  if pcall(vim.cmd.help,
    (vim.regex([[vim\.api\.]]):match_str(word) and '%s()' or
      vim.regex([[vim\.uv\.]]):match_str(word) and 'uv.%s()' or
      vim.regex([[vim\.fn\.]]):match_str(word) and '%s()' or
      vim.regex([[vim\.cmd\.]]):match_str(word) and ':%s' or
      vim.regex([[vim\.o\.]]):match_str(word) and "'%s'" or
      vim.regex([[vim\.opt\.]]):match_str(word) and "'%s'" or
      word):format(vim.fn.expand('<cword>'))) then return end
  vim.lsp.buf_request(0,vim.lsp.protocol.Methods.textDocument_hover,vim.lsp.util.make_position_params())
end)
nno('\r','dd',{})
nno('z','za')
nno('j','gj')
nno('k','gk')
nno('cw','dwi')
nno('cW','dWi')
nno('g:','q:')
nno('g/','q/')
nno('gp','`[v`]')
nno("' ",":s/['\"]/\\=submatch(0)=='\"'?\"'\":'\"'/g\r")
nno('vv','V')
nno('\\p','<cmd>Pckr status\r')
nno('gd',function ()
  if vim.lsp.buf_notify(0,'window/progress',{}) or #vim.fn.tagfiles()>0 then return '<C-]>'
  else return 'gd' end
end,{expr=true})
nno('[d',vim.diagnostic.goto_prev)
nno(']d',vim.diagnostic.goto_next)
nno(']D',vim.diagnostic.disable)
nno('[D',vim.diagnostic.enable)
nno('gC',vim.lsp.buf.code_action)
nno('gr',':IncRename <C-r>=expand("<cword>")\r',{noremap=true})
------alt/ctrl
for k,v in pairs({h='vertical resize -',j='resize +',k='resize -',l='vertical resize +'}) do
  nno('<C-'..k..'>','<C-w>'..k..'<cmd>if &buftype=="terminal"|startinsert|endif\r')
  nno('<C-S-'..k..'>','<C-w>'..k:upper())
  nno('<C-A-'..k..'>',':'..v..'2\r')
  nno('<C-A-S-'..k..'>',':'..v..'10\r')
end
nno('<A-=>','<C-w>=')
nno('<A-e>','/',{noremap=true})
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
nno('<M-x>',':L ',{noremap=true})
nno('<A-f>',':%s///g<Left><Left><Left>',{noremap=true})
for i=1,9 do
  nno('<A-'..i..'>',':tabnext '..i..'\r')
end
nno('gs',':sort ',{silent=false}) -- https://github.com/neovim/neovim/issues/19354

----ino/cno
for k,v in pairs({h='Left',l='Right',j='Down',k='Up'}) do
  lcno('<A-'..k..'>','<'..v..'>')
  lcno('<A-S-'..k..'>',('<'..v..'>'):rep(5))
end
lcno('<A-d>','<C-w>')
lcno('<A-c>','<S-Right><C-w>')
lcno('<A-b>','<S-Left>')
lcno('<A-w>','<S-Right>')
lcno('<A-s>','<BS>')
lcno('<A-x>','<Del>')
lcno('<C-S-v>','<C-r>+')
lcno('<C-A-v>','<C-r>+')
ino('ø','ö')
ino('æ','ä')
ino('Ø','Ö')
ino('Æ','Ä')
for i in ('hjklwb'):gmatch('.') do
  ino('<A-'..i..'>','<C-o>'..i)
  ino('<A-S-'..i..'>','<C-o>5'..i)
end
ino('¨','<esc>')
ino('<A-d>','<C-w>')
ino('<A-c>','<C-o>de')
ino('<A-a><A-c>','<C-o>0<C-o>D')
ino('<A-a><A-d>','<C-o>dd')
ino('<A-s>','<bs>')
ino('<A-x>','<Del>')
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
lcno('<C-e>','<End>')
lcno('<C-a>','<Home>')
lcno('<C-g>','<esc>')

----xno/ono
for i in ([['"`()[]{}<>]]):gmatch('.') do
  ono(i,'i'..i)
  xno(i,'i'..i)
end
xno('\r','d',{})
xno('R',':Norm ',{})
xno('j','gj')
xno('k','gk')
xno('<A-f>','y:%s/<C-r>"/<C-r>"/g<Left><Left>',{noremap=true})
xno('.',':',{noremap=true})
xno('æ','"+y')
xno('å','"+p')
xno('<','<gv')
xno('>','>gv')
xno('<A-w>',':w !wc\r')
xno('<A-j>',':move \'>+1\rgv')
xno('<A-k>',':move \'<-2\rgv')
xno('<A-h>','<gv')
xno('<A-l>','>gv')
xno('<S-tab>','<gv')
xno('<tab>','>gv')
xbmap('A',"<esc>:au InsertLeave * ++once :'<+1,'>norm! $\".p\r'<A",'A')
xbmap('I',"<esc>:au InsertLeave * ++once :'<+1,'>norm! _\".P\r'<I",'I')
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
