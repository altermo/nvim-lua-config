local M={path='/tmp/nlog'}
function M.log(...)
    if M.log_started==false then return end
    local d=debug.getinfo(2)
    return vim.fn.writefile(vim.fn.split(
        ':'..d.short_src..':'..d.currentline..':\n'..
        vim.inspect(#{...}>1 and {...} or ...),'\n'
    ),M.path,'a')
end
function M.log_clear()
    vim.fn.writefile({},M.path)
end
function M.log_traceback()
    if M.log_started==false then return end
    local d=debug.getinfo(2)
    return vim.fn.writefile(vim.fn.split(
        ':'..d.short_src..':'..d.currentline..':\n'..debug.traceback(),'\n'),
        M.path,'a')
end
function M.log_start()
    vim.lgclear()
    M.log_started=true
end
function M.log_end()
    M.log_started=false
end
return M
