local M={}
M.bte={
  ['[']=']',
  ['(']=')',
  ['{']='}',
  ['"']='"',
  ["'"]='"',
  ['`']='`',
}
M.etb={}
for k,v in pairs(M.bte) do
  M.etb[v]=k
end
return M
