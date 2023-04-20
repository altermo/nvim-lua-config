local M={}
function M.timeout_input(timeout)
    timeout=timeout or 500
    vim.fn.inputsave()
    local ret=''
    local first=true
    while true do
        vim.api.nvim_echo({},false,{})
        vim.cmd('redraw')
        vim.api.nvim_echo({{'>', 'Question'},{ret}},false,{})
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
return M
