----init--
local fn=vim.fn
function Norm()
  local ino=require'utils.keymap'.ino
  ino('<left>','<left>')
  ino('<right>','<right>')
  ino('<up>','<C-o>gk')
  ino('<down>','<C-o>gj')
  vim.o.mouse='a'
end
function Fold(lnum)
  return fn.getline(lnum)=="" and '0' or '1'
end
function TermAppRun(bin,mouse)
  vim.cmd.enew()
  local buf=fn.bufnr()
  fn.termopen((mouse and "sleep 0.01;printf '\\e[?1000h';" or "")..bin,{on_exit=function (_,_,_)
    vim.cmd.bdelete({buf,bang=true})
  end})
  vim.cmd.startinsert()
end
function QuickFixToggle()
  for _,v in pairs(fn.getwininfo()) do
    if v.quickfix==1 then
      vim.cmd.cclose()
      return
    end
  end
  vim.cmd.copen()
  vim.cmd.wincmd('p')
end
