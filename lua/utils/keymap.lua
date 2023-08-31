local M={}
local function map(mode,lhs,rhs,opt)
  vim.keymap.set(mode,lhs,rhs,opt)
end
for i in ('nixto'):gmatch('.') do
  M[i..'no']=function(lhs,rhs,opt) map(i,lhs,rhs,opt or {silent=true,noremap=true}) end
end
for i in ('nc'):gmatch('.') do
  M['l'..i..'no']=function(lhs,rhs,opt) map(i,lhs,rhs,opt or {noremap=true}) end
end
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
