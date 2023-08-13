local M={}
local function getword(x1,x2,y)
    return vim.fn.strcharpart(vim.fn.getline(y),x1-1,x2-x1+1)
end
function M.wordcolumn()
    local col1=vim.fn.virtcol('v')
    local col2=vim.fn.virtcol('.')
    if col1>col2 then col2,col1=col1,col2 end
    local word=getword(col1,col2,".")
    local beg=vim.fn.line(".")
    local _end=vim.fn.line(".")
    while beg>1 and getword(col1,col2,beg-1)==word do
        beg=beg-1
    end
    while _end<vim.fn.line("$") and getword(col1,col2,_end+1)==word do
        _end=_end+1
    end
    return '<esc>'..beg..'gg'..col1..'|<C-v>o'.._end..'gg'..col2..'|'
end
function M.charcolumn()
    return M.wordcolumn()..vim.v.operator
end
local function getchar(x, y)
    return vim.fn.strcharpart(vim.fn.getline(y),x-1,1)
end
function M.wordrow()
    local col1=vim.fn.virtcol('v')
    local col2=vim.fn.virtcol('.')
    if col1>col2 then col2,col1=col1,col2 end
    local line=vim.fn.line(".") --[[@as number]]
    local char=getchar(col1, line)
    while col1>1 and getchar(col1-1,line)==char do
        col1=col1-1
    end
    while col2<#vim.fn.getline(line) and getchar(col2+1,line)==char do
        col2=col2+1
    end
    return '<esc>'..col1..'|<C-v>o'..col2..'|'
end
function M.charrow()
    return M.wordrow()..vim.v.operator
end
function M.setup()
    vim.keymap.set('x','im',M.wordcolumn,{expr=true})
    vim.keymap.set('o','im',M.charcolumn,{expr=true})
    vim.keymap.set('x','ik',M.wordrow,{expr=true})
    vim.keymap.set('o','ik',M.charrow,{expr=true})
end
return M
