local M={}
M.abbrevs={}
function M.addabbr(pre,pos)
  M.abbrevs[pre]=pos
  vim.cmd('iabbrev '..pre..' '..pos)
end
function M.unabbr(name)
  M.abbrevs[name]=nil
  vim.cmd('unabbr '..name)
end
return M
