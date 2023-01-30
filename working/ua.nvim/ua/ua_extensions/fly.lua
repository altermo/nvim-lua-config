local add_pair=require'ua.utils.add_pair'
local utils = require 'ua.utils.utils'
local open_pair=require'ua.utils.open_pair'
return {filter=function (o,conf)
    if #o.key>1 then return end
    if o.type~=2 then return end
    local next_char_index
    for i=o.col,#o.line  do
        local char=o.line:sub(i,i)
        if char==o.key then
            next_char_index=i
            break
        elseif not vim.tbl_contains(conf,char) then
            return
        end
    end
    if not next_char_index then return end
    if not open_pair.open_pair_before(o.pair,o.paire,o.line,next_char_index) then
        utils.movel(next_char_index-o.col)
        add_pair.insert(o.pair,o.paire,o.wline,o.wcol-o.col+next_char_index,0)
        return 1
    end
end}
