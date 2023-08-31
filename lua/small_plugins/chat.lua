local M={}
function M.qfupdate()
    local ret={}
    for _,i in ipairs(vim.split(M.out,'\n')) do
        table.insert(ret,{text=i})
    end
    vim.fn.setqflist(ret)
end
function M.ask(text)
    M.out=''
    M.qfupdate()
    return vim.system({'tgpt','-q',text},{stdout=function (err,data)
        if err then error(err) end
        if data then M.out=M.out..data end
        vim.schedule(M.qfupdate)
    end})
end
function M.open(_)
    vim.cmd.copen()
    vim.cmd.wincmd'p'
end
function M.run()
    vim.ui.input({prompt='chat> '},function (inp)
        if inp==nil or vim.trim(inp)=='' then return end
        M.ask(inp)
        M.open(inp)
    end)
end
return M
