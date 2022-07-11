local fn=vim.fn
local function getlineindexone(x,ind)
    return string.sub(fn.getline(x),ind,ind)
end
local function getlineindex(x,ind1,ind2)
    return string.sub(fn.getline(x),ind1,ind2)
end
function Onecharcolumn()
    local col=fn.col('.')
    local char=getlineindexone('.',col)
    local beg=fn.line('.')
    local fin=fn.line('.')
    while beg>1 and getlineindexone(beg-1,col)==char do
        beg=beg-1
    end
    while fin<fn.line('$') and getlineindexone(fin+1,col)==char do
        fin=fin+1
    end
    print(beg,fin,char)
    fn.execute('keepjumps silent normal! '..beg..'gg\x16'..fin..'gg')
end
function Multicharcolumn()
    local col1=fn.col("'<")
    local col2=fn.col("'>")
    local char=getlineindex('.',col1,col2)
    local beg=fn.line('.')
    local fin=fn.line('.')
    while beg>1 and getlineindex(beg-1,col1,col2)==char do
        beg=beg-1
    end
    while fin<fn.line('$') and getlineindex(fin+1,col1,col2)==char do
        fin=fin+1
    end
    fn.cursor(beg,col1)
    fn.execute('keepjumps silent normal! \x16')
    fn.cursor(fin,col2)
end
vim.keymap.set('o','im',':<C-u>call v:lua.Onecharcolumn()\r',{silent=true})
vim.keymap.set('x','im',':call v:lua.Multicharcolumn()\r',{silent=true})
