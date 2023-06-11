local M={}
function M.wrap(fn)
    return function()
        local cursor=vim.fn.getcmdpos()
        local line=vim.fn.getcmdline()
        local buf=vim.api.nvim_create_buf(true,true)
        vim.treesitter.start(buf,'vim')
        vim.api.nvim_buf_set_lines(buf,0,-1,false,{line})
        local ret
        local col
        vim.api.nvim_buf_call(buf,function()
            vim.fn.cursor({0,cursor})
            ret={pcall(fn)}
            col=vim.fn.col('.')
        end)
        vim.fn.setcmdpos(col)
        vim.api.nvim_buf_delete(buf,{})
        if not ret[1] then error(ret[2]) end
    end
end
function M.map(lhs,rhs)
    vim.keymap.set('c',lhs,M.wrap(rhs))
end
return M
