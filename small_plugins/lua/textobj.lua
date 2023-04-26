local function getword(x1,x2,y)
    return vim.fn.strcharpart(vim.fn.getline(y),x1-1,x2-x1+1)
end
local function wordcolumn()
    vim.fn.execute("keepjumps silent normal! \27")
    local col1=vim.fn.virtcol("'<")
    local col2=vim.fn.virtcol("'>")
    local word=getword(col1,col2,".")
    local beg=vim.fn.line(".")
    local _end=vim.fn.line(".")
    while beg>1 and getword(col1,col2,beg-1)==word do
        beg=beg-1
    end
    while _end<vim.fn.line("$") and getword(col1,col2,_end+1)==word do
        _end=_end+1
    end
    vim.fn.setcursorcharpos({beg,col1})
    vim.fn.execute("keepjumps silent normal! \22")
    vim.fn.setcursorcharpos({_end,col2})
end
local function charcolumn()
    vim.fn.execute("keepjumps silent normal! v")
    wordcolumn()
end
local function getchar(x, y)
    return vim.fn.strcharpart(vim.fn.getline(y),x-1,1)
end
local function wordrow()
    vim.fn.execute("keepjumps silent normal! \27")
    local col1=vim.fn.virtcol("'<")
    local col2=vim.fn.virtcol("'>")
    local line=vim.fn.line(".")
    local char=getchar(col1, line)
    while col1>1 and getchar(col1-1,line)==char do
        col1=col1-1
    end
    while col2<#vim.fn.getline(line) and getchar(col2+1,line)==char do
        col2=col2+1
    end
    vim.fn.setcursorcharpos({line,col1})
    vim.fn.execute("keepjumps silent normal! \22")
    vim.fn.setcursorcharpos({line,col2})
end
local function charrow()
    vim.fn.execute("keepjumps silent normal! v")
    wordrow()
end
local M={}
function M.setup()
    vim.keymap.set('x','im',charcolumn)
    vim.keymap.set('o','im',wordcolumn)
    vim.keymap.set('x','ik',charrow)
    vim.keymap.set('o','ik',wordrow)
end
return M
--TODO rewrite as expr
