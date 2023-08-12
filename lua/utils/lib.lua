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
    local buf=vim.fn.bufnr() or 0
    vim.fn.termopen((mouse and "sleep 0.01;printf '\\e[?1000h';" or "")..bin,{on_exit=function (_,_,_)
        vim.cmd.bdelete({buf,bang=true})
    end})
    vim.api.nvim_buf_set_option(buf,'bufhidden','wipe')
    vim.cmd.startinsert()
end
function M.utf8_sub(s,i,j)
    local pos=vim.str_utf_pos(s)
    j=j or -1
    if i<0 then i=#pos+i+1 end
    if j<0 then j=#pos+j+1 end
    local start=pos[i]
    local end_=pos[j]
    return s:sub(start,end_+vim.str_utf_end(s,end_))
end
function M.tabbufmove(num)
    local buf=vim.fn.bufnr()
    local win=vim.api.nvim_get_current_win()
    vim.cmd.tabnext(num)
    vim.cmd('vert sbuf'..buf)
    vim.api.nvim_win_close(win,true)
end
return M
