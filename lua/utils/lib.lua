local M={}
function M.timeout_input(timeout)
    timeout=timeout or 500
    vim.fn.inputsave()
    local ret=''
    local first=true
    while true do
        vim.api.nvim_echo({},false,{})
        vim.cmd('redraw')
        vim.api.nvim_echo({{'>','Question'},{ret}},false,{})
        local key=''
        local function f()
            key=vim.fn.getcharstr(0)
            return key~=''
        end
        local status
        if first then
            key=vim.fn.getcharstr()
        else
            _,status=vim.wait(timeout,f)
        end
        first=false
        if status==-1 then break end
        if key=='\r' then break end
        if key=='\x80kb' then
            ret=ret:sub(1,-2)
        else
            ret=ret..key
        end
    end
    vim.fn.inputrestore()
    return ret
end
function M.termrun(bin,mouse)
    vim.cmd.enew()
    local buf=vim.fn.bufnr()
    vim.fn.termopen((mouse and "sleep 0.01;printf '\\e[?1000h';" or "")..bin,{on_exit=function (_,_,_)
        vim.cmd.bdelete({buf,bang=true})
    end})
    vim.cmd.startinsert()
end
function M.utf8_sub(s,i,j)
    j=j or -1
    local pos=vim.str_utf_pos(s)
    local start=pos[i]
    local end_=pos[j]
    return s:sub(start,end_+vim.str_utf_end(s,end_))
end
return M
