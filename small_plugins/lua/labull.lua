local M={}
function M.incahrs(chars)
    local differ=chars:match('%u') and (chars:match('%U') and error('string:'..chars..' may not contain booth upper and lower case') or 65) or 97
    local tbl=vim.iter(chars:reverse():gmatch('.')):map(string.byte):totable()
    tbl[1]=(1+(tbl[1] or differ-1))
    local i=1
    while tbl[i]-differ==26 do
        tbl[i]=tbl[i]-26
        i=i+1
        tbl[i]=(tbl[i] or differ-1)+1
    end
    vim.iter(tbl):fold("",function (sum,_,v)
        return sum..string.char(v)
    end):reverse()
end
function M.labull(inp)
    return (
        inp:match('^%s*[+%-]+ [[].[]] ') or
        inp:match('^%s*[+%-]+ ') or
        (inp:match('^%s*%d+[.)] ') and inp:gsub('^(%s*)(%d+)([.)] ).*',function (indent,number,end_) return indent..(tonumber(number)+1)..end_ end)) or
        (inp:match('^%s*%a+[.)] ') and inp:gsub('^(%s*)(%a+)([.)] ).*',function (indent,number,end_) return indent..M.incahrs(number)..end_ end)))
end
function M.main()
    local line=vim.fn.getline('.')
    local laline=M.labull(line)
    return 'o'..(laline and ('<esc>I'..laline) or '') --hack
end
function M.setup()
    vim.keymap.set('n','o',M.main,{noremap=true,expr=true})
end
return M
