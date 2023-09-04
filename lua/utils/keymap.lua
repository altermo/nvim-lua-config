local M={}
local function map(mode,lhs,rhs,opt) vim.keymap.set(mode,lhs,rhs,opt) end
function M.nno(lhs,rhs,opt) map('n',lhs,rhs,opt or {silent=true,noremap=true}) end
function M.ino(lhs,rhs,opt) map('i',lhs,rhs,opt or {silent=true,noremap=true}) end
function M.xno(lhs,rhs,opt) map('x',lhs,rhs,opt or {silent=true,noremap=true}) end
function M.tno(lhs,rhs,opt) map('t',lhs,rhs,opt or {silent=true,noremap=true}) end
function M.ono(lhs,rhs,opt) map('o',lhs,rhs,opt or {silent=true,noremap=true}) end
function M.lcno(lhs,rhs,opt) map('c',lhs,rhs,opt or {noremap=true}) end
function M.lnno(lhs,rhs,opt) map('n',lhs,rhs,opt or {noremap=true}) end
function M.xbmap(lhs,rhsn,rhsb,opt)
  opt=opt or {silent=true,expr=true,noremap=true}
  if opt.expr==nil then opt.expr=true end
  map('x',lhs,function ()
    if vim.fn.mode()=='\x16' then
      return rhsb
    else
      return rhsn
    end
  end,opt)
end
return M
