local open_pair=require'ua.utils.open_pair'
local info_line=require'ua.utils.info_line'
local utils=require'ua.utils.utils'
return {filter=function(o,conf)
    local poschar=o.line:sub(o.col,o.col)
    if o.type==1 and vim.tbl_contains(conf,poschar) then
           vim.fn.writefile(vim.fn.split(vim.inspect( ),'\n'),'out')
        if not open_pair.open_pair_ambigous_before_and_after(poschar,o.line,o.col) then
            local index=info_line.findstringe(o.line,o.col+1,poschar)
            if index then
                local windex=index-o.col+o.wcol
                utils.setline(o.wline:sub(1,o.wcol-1)..o.pair..o.wline:sub(o.wcol,windex)..o.paire..o.wline:sub(windex+1))
                return 1
            end
        end
    end
end}
