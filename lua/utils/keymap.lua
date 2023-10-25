local M={}
---@overload fun(mode:string,lhs:string,rhs:string|function,opt:table)
local function map(mode,lhs,rhs,opt)
  if type(rhs)=="function" then
    opt.callback=rhs
    rhs=''
  end
  opt.noremap=opt.noremap~=false
  if opt.expr==true then opt.replace_keycodes=true end
  vim.api.nvim_set_keymap(mode,lhs,rhs,opt)
  --vim.keymap.set(mode,lhs,rhs,opt)
end
---@overload fun(lhs:string,rhs:string|function,opt?:table)
function M.nno(lhs,rhs,opt) map('n',lhs,rhs,opt or {silent=true}) end
---@overload fun(lhs:string,rhs:string|function,opt?:table)
function M.ino(lhs,rhs,opt) map('i',lhs,rhs,opt or {silent=true}) end
---@overload fun(lhs:string,rhs:string|function,opt?:table)
function M.xno(lhs,rhs,opt) map('x',lhs,rhs,opt or {silent=true}) end
---@overload fun(lhs:string,rhs:string|function,opt?:table)
function M.tno(lhs,rhs,opt) map('t',lhs,rhs,opt or {silent=true}) end
---@overload fun(lhs:string,rhs:string|function,opt?:table)
function M.ono(lhs,rhs,opt) map('o',lhs,rhs,opt or {silent=true}) end
---@overload fun(lhs:string,rhs:string|function,opt?:table)
function M.lcno(lhs,rhs,opt) map('c',lhs,rhs,opt or {}) end
---@overload fun(lhs:string,rhsn:string,rhsb:string,opt?:table)
function M.xbmap(lhs,rhsn,rhsb,opt)
  opt=opt or {silent=true,expr=true}
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
