local M={}
local function nno(lhs,rhs,opt)
    vim.keymap.set('n',lhs,rhs,opt or {silent=true,noremap=true})
end
function M.join(path1,path2)
    return path1..'/'..path2
end
function M.last(path,first)
    local parlist=vim.fn.readdir(vim.fs.dirname(path))
    return parlist[first and 1 or #parlist]==vim.fs.basename(path)
end
function M.dontbelast(path,prev)
    if not M.last(path,prev) then
        return path
    end
    for i in vim.fs.parents(path) do
        if not M.last(i,prev) then
            return i
        end
    end
    error()
end
function M.getnext(path,prev)
    if vim.fn.isdirectory(path)==1 and not vim.tbl_isempty(vim.fn.readdir(path)) then
        return M.join(path,vim.fn.readdir(path)[prev and #vim.fn.readdir(path) or 1])
    end
    path=M.dontbelast(path,prev)
    local parent=vim.fs.dirname(path)
    local parlist=vim.fn.readdir(parent)
    return M.join(parent,parlist[vim.fn.index(parlist,vim.fs.basename(path))+(prev and 0 or 2)])
end
function M.get_next_file(path,prev)
    path=vim.fn.fnamemodify(path,':p')
    path=M.getnext(path,prev)
    while vim.fn.isdirectory(path)==1 do
        path=M.getnext(path,prev)
    end
    return path
end
function M.toggle(opt,on,off)
    if off then
        vim.o[opt]=vim.o[opt]==on and off or on
    elseif on then
        vim.o[opt]=vim.o[opt]=='' and on or ''
    else
        vim.o[opt]=not vim.o[opt]
    end
    print(opt..'='..vim.inspect(vim.o[opt]))
end
function M.setup()
    nno(']f',function() vim.cmd.edit(M.get_next_file(vim.fn.expand('%'))) end)
    nno('[f',function() vim.cmd.edit(M.get_next_file(vim.fn.expand('%'),true)) end)
    for k,v in pairs({
        b={opt="background",on="light",off="dark"},c="cursorline",
        h="hlsearch",l="list",i="ignorecase",n="number",r="relativenumber",
        s="spell",u="cursorcolumn",w="wrap",d="diff",
        t={opt="colorcolumn",on="1,41,81,121,161,201,241"},
        v={opt="virtualedit",on="block,onemore"},M={opt="mouse",on="a"},
        f="foldenable",e="scrollbind",m={opt="conceallevel",on=2,off=0},
        p={opt="matchpairs",on="(:),{:},[:]",off=""},
        T={opt="showtabline",on=1,off=0}
    }) do
        nno('yo'..k,function() M.toggle(v.opt or v,v.on,v.off) end)
    end
end
return M
