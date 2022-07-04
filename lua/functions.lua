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
            vim.cmd('cclose')
            return
        end
    end
    vim.cmd('copen')
end
function Togglecomment(visual)
    local left,_=vim.o.commentstring:match('^(.*)%%s(.*)')
    if left:find(' $') then
        left=string.sub(left,1,-2)
    end
    local line=vim.api.nvim_get_current_line()
    if line:find('^%s*'..vim.pesc(left)) then
        local temp=fn.getreg('/')
        if visual then
            vim.cmd([['<,'>s/^\(\s*\)]]..fn.escape(left,'[]\\')..[[/\1]])
        else
            vim.cmd([[s/^\(\s*\)]]..fn.escape(left,'[]\\')..[[/\1]])
        end
        fn.setreg('/',temp)
    else
        if visual then
            vim.cmd("'<,'>norm I"..left)
        else
            vim.cmd('norm I'..left)
        end
    end
end --TODO #a\nb| > ##a\n#b and better visual/normal
