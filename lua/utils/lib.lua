local M={}
---@param num number|string
function M.tabbufmove(num)
    local buf=vim.fn.bufnr()
    local win=vim.api.nvim_get_current_win()
    vim.cmd.tabnext(num)
    vim.cmd.sbuf{buf,mods={vertical=true}}
    vim.api.nvim_win_close(win,true)
end
return M
