local M={}
function M.wrap(fn)
    return function()
        local cursor=vim.fn.getcmdpos()
        local line=vim.fn.getcmdline()
        local buf=vim.api.nvim_create_buf(true,true)
        vim.api.nvim_buf_set_lines(buf,0,-1,false,{line})
        local s,err
        vim.api.nvim_buf_call(buf,function()
            vim.fn.cursor({0,cursor})
            s,err=pcall(fn)
        end)
        vim.api.nvim_buf_delete(buf,{})
        if not s then error(err) end
    end
end
function M.map(lhs,rhs)
    vim.keymap.set('c',lhs,M.wrap(rhs))
end
return M
