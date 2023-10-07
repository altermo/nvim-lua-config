local M={}
---@param num number|string
function M.tabbufmove(num)
    local buf=vim.fn.bufnr()
    local win=vim.api.nvim_get_current_win()
    vim.cmd.tabnext(num)
    vim.cmd('vert sbuf'..buf)
    vim.api.nvim_win_close(win,true)
end
---@param source string
---@return any
function M.req(source)
  package.loaded[source]=nil
  return require(source)
end
return M
