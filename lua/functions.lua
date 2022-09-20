----init--
local fn=vim.fn
local function map(kind,key,maps,opts)
  vim.keymap.set(kind,key,maps,opts)
end
local function ino(key,maps)
  map('i',key,maps,{noremap=true,silent=true})
end
function Norm()
  ino('<left>','<left>')
  ino('<right>','<right>')
  ino('<up>','<C-o>l')
  ino('<down>','<C-o>k')
  vim.o.mouse='a'
end
function TN()
  fn.execute([[/\v(n|t)>]])
end
function Build(term)
  for ftype,cmd in pairs({fish='fish',lua='lua',python='python3.10',fennel='fennel'}) do
    if vim.o.filetype==ftype then
      pcall(vim.cmd,'write')
      if term then
        vim.cmd('vnew|call termopen("time '..cmd..' \'".expand("#")."\'")|startinsert')
      else
        vim.cmd('AsyncRun time '..cmd..' "%"')
      end
      return
    end end
  if vim.o.filetype=='cpp' then
    vim.cmd('AsyncRun g++ % -o __tmp;./__tmp;rm __tmp')
    return
  end
  if vim.o.filetype=='vim' then
    vim.cmd'so %'
    return
  end
  vim.notify("Builderror: filetype "..vim.o.filetype.." has no builder or can not be built")
end
function Fold(lnum)
  return fn.getline(lnum)=="" and '0' or '1'
end
function TermAppRun(bin,mouse)
  vim.cmd('enew')
  local buf=fn.bufnr()
  fn.termopen((mouse and "sleep 0.01;printf '\\e[?1000h';" or "")..bin,{on_exit=function (_,_,_)
    vim.cmd('bdelete! '..buf)
  end})
  vim.cmd('startinsert')
end
function QuickFixToggle()
  for _,v in pairs(fn.getwininfo()) do
    if v.quickfix==1 then
      vim.cmd('cclose')
      return
    end
  end
  vim.cmd('copen')
  vim.cmd'wincmd p'
end
local previous=''
local err=false
function Mx()
  vim.api.nvim_echo({{'>','Normal'},{previous,'Comment'}},false,{})
  local char=vim.fn.getchar()
  vim.cmd'redraw'
  local precode='(fn printf [x] (print (vim.inspect x))) (var cmd vim.cmd) (var api vim.api) (var log vim.log) (var lsp vim.lsp)'
  local inp
  if char==13 then
    if err then
      inp=vim.fn.input('>',previous)
    else
      inp=previous
    end
  elseif char==27 then
    return
  elseif char==18 then
    inp=vim.fn.input('>',previous)
  else
    inp=vim.fn.input('>',vim.fn.nr2char(char))
  end
  if inp=='' then
    return
  end
  vim.cmd'redraw'
  previous=inp
  err=true
  require'fennel-nvim'.vimeval(precode..'('..inp..')')
  err=false
end
function Fast()
for k,v in pairs({o='och',et='ett',a='att',s='som'}) do
  vim.cmd('iabbrev <buffer> '..k..' '..v)
  end
end
