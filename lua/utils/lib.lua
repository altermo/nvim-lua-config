local M={path='/tmp/nlog'}
---@param num number|string
function M.tabbufmove(num)
    local buf=vim.fn.bufnr()
    local win=vim.api.nvim_get_current_win()
    vim.cmd.tabnext(num)
    vim.cmd.sbuf{buf,mods={vertical=true}}
    vim.api.nvim_win_close(win,true)
end
function M.log(...)
    if vim.in_fast_event() then return vim.schedule_wrap(M.log)(...) end
    local d=debug.getinfo(2)
    return vim.fn.writefile(vim.fn.split(
        ':'..d.short_src..':'..d.currentline..':\n'..
        vim.inspect(#{...}>1 and {...} or ...),'\n'
    ),M.path,'a')
end
function M.log_clear()
    vim.fn.writefile({},M.path)
end
return M
