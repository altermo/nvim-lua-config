local M={}
---@overload fun(mode:string,lhs:string|string[],rhs:string|function,opt:table)
local function map(mode,lhs,rhs,opt)
  if type(rhs)=="function" then
    opt.callback=rhs
    rhs=''
  end
  opt.noremap=opt.noremap~=false
  if opt.expr==true then opt.replace_keycodes=true end
  for _,i in ipairs(type(lhs)=='table' and lhs or {lhs}) do vim.api.nvim_set_keymap(mode,i --[[@as string]],rhs,opt) end
end
---@overload fun(lhs:string|string[],rhs:string|function,opt?:table)
function M.nno(lhs,rhs,opt) map('n',lhs,rhs,opt or {silent=true}) end
---@overload fun(lhs:string|string[],rhs:string|function,opt?:table)
function M.ino(lhs,rhs,opt) map('i',lhs,rhs,opt or {silent=true}) end
---@overload fun(lhs:string|string[],rhs:string|function,opt?:table)
function M.xno(lhs,rhs,opt) map('x',lhs,rhs,opt or {silent=true}) end
---@overload fun(lhs:string|string[],rhs:string|function,opt?:table)
function M.tno(lhs,rhs,opt) map('t',lhs,rhs,opt or {silent=true}) end
---@overload fun(lhs:string|string[],rhs:string|function,opt?:table)
function M.ono(lhs,rhs,opt) map('o',lhs,rhs,opt or {silent=true}) end
---@overload fun(lhs:string|string[],rhs:string|function,opt?:table)
function M.lcno(lhs,rhs,opt) map('c',lhs,rhs,opt or {}) end
return M
