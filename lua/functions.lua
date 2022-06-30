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
  for ftype,cmd in pairs({fish='fish',lua='lua',python='python3.10'}) do
    if vim.o.filetype==ftype then
      pcall(vim.cmd,'write')
      if term then
        vim.cmd('vnew|call termopen("time '..cmd..' \'".expand("#")."\'")|startinsert')
      else
        vim.cmd('AsyncRun time '..cmd..' "%"')
      end
      return
  end end
  vim.notify("Builderror: filetype "..vim.o.filetype.." has no builder or can not be built")
end
function Fold(lnum)
  return fn.getline(lnum)=="" and '0' or '1'
end
function TermAppRun(bin,mouse)
  vim.cmd('enew')
  local buf=fn.bufnr()
  fn.termopen((mouse and "printf '\\e[?1000h';" or "")..bin,{on_exit=function (_,_,_)
    vim.cmd('bdelete! '..buf)
  end})
  vim.cmd('startinsert')
end
function QuickFixToggle()
    for _,v in pairs(fn.getwininfo()) do
        if v.quickfix==1 then
            vim.cmd('silent! cclose') --TODO
            return
        end
    end
    vim.cmd('copen')
end
