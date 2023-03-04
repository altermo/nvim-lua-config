local M={}
function M.timeout_input(timeout)
    timeout=timeout or 0.5
    vim.fn.inputsave()
    local ret=''
    local first=true
    while true do
        vim.api.nvim_echo({}, false, {})
        vim.cmd('redraw')
        vim.api.nvim_echo({{'>', 'Question'},{ret}},false,{})
        local key=''
        local function f()
            key=vim.fn.getcharstr(0)
            return key~=''
        end
        local status
        if first then
            f()
        else
            _,status=vim.wait(timeout,f)
        end
        first=false
        if status==-1 then
            break
        end
        if key=='\r' then
            break
        end
        ret=ret..key
    end
    vim.fn.inputrestore()
    return ret
end
return M
