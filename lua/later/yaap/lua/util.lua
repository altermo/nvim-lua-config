local M={}
function M.getline()
  local buf=vim.api.nvim_get_current_buf()
  local m=vim.fn.line('.')
  return vim.api.nvim_buf_get_lines(buf,m-1,m,true)[1]
end
function M.setline(line)
  local buf=vim.api.nvim_get_current_buf()
  local m=vim.fn.line('.')
  vim.api.nvim_buf_set_lines(buf,m-1,m,true,{line})
end
function M.getcol()
  return vim.fn.col('.')
end
function M.movel(num)
  for _=1,(num or 1) do
    vim.cmd('norm! l')
  end
end
function M.insert(text,line,col)
    line=line:sub(1,col-1)..text..line:sub(col)
    M.setline(line)
end
return M
