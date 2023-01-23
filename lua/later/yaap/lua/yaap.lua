local utils=dofile'util.lua'
local data=dofile'data.lua'
local ele=dofile'ele.lua'
local M={}
function M.create_function(key,opt)
    opt=opt or {}
    return function()
        local H={}
        H.line=utils.getline()
        H.endpair=opt.endpair or data.etb[key]
        if H.endpair then
            H.pair=opt.paire or data.etb[key] or (type(opt)=='string' and opt) or key
            H.paire=opt.paire or key
        else
            H.pair=opt.pair or key
            H.paire=opt.paire or data.bte[key] or (type(opt)=='string' and opt) or key
        end
        H.ambiguous=opt.ambiguous or H.pair==H.paire
        H.ind=utils.getcol()
        H.extra=opt.extra or {}
        H.insert=opt.insert or function(typ,o)
            if typ==1 then
                utils.insert(o.pair,o.line,o.ind)
            elseif typ==2 then
                utils.insert(o.pair..o.paire,o.line,o.ind)
            elseif typ==3 then
                utils.insert(o.paire,o.line,o.ind)
            end
            utils.movel()
        end
        for _,v in pairs(opt.filters or {}) do
            if v.filter(H) then utils.insert(key) end
        end
        if opt.default then
            opt.default(H)
        else
            ele.default_pair(H)
        end
    end
end
function M.create_map(key,opt,_opt)
    vim.keymap.set('i',key,M.create_function(key,opt),_opt or {noremap=true})
end
M.create_map('#',{filters={{filter=dofile('extensions/filters/test.lua')}}})
M.create_map('&')
M.create_map('?')

return M
