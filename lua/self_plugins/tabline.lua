local fn=vim.fn
----tabline
function MyTabLine()
    local line=''
    local curtab=fn.tabpagenr()
    for i=1,fn.tabpagenr('$') do
        line=line..((i==curtab)and'%#TabLineSel#'or'%#TabLine#')
        line=line..'❬'   --❬❭❮❯❰❱
        local bufnr=fn.tabpagebuflist(i)[fn.tabpagewinnr(i)]
        local file=fn.bufname(bufnr)
        if file=="" then
            file=((fn.getbufvar(bufnr,'current_syntax')=='dashboard')and"D"or"N")
        elseif string.match(file,'^term://') then
            file=((string.match(file,'ranger'))and'R'or'T')
        elseif string.len(file)>20 then
            file=string.sub(file,1,17)..'...'
        end
        line=line..file
        line=line..'❭'
    end
    return line..'%#TabLine#'
end
vim.o.tabline='%!v:lua.MyTabLine()'
