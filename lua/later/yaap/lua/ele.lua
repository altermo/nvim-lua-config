local part=dofile'part.lua' --temp
local M={}
function M.add_pairs(pair,opt)
    if part.open_par_after(pair,opt) then
        return opt.insert(1,opt)
    end
    return opt.insert(2,opt)
end
function M.add_paira(pair,opt)
    if not (opt.line:sub(opt.ind,opt.ind)==pair
        and part.open_par_ambigous_before(pair,opt)) then
        if part.open_par_ambigous_after(pair,opt) then
            return opt.insert(1,opt)
        else
            return opt.insert(2,opt)
        end
    elseif not part.open_par_ambigous_after(pair,opt) then
        return opt.insert(1,opt)
    end
    return opt.insert(0,opt)
end
function M.add_paire(pair,opt)
    if not (opt.line:sub(opt.ind,opt.ind)==pair
        and part.open_par_before(pair,opt)) then
        return opt.insert(3,opt)
    end
    return opt.insert(0,opt)
end
function M.default_pair(opt)
    if opt.ambiguous then
        M.add_paira(opt.pair,opt)
    elseif opt.endpair then
        M.add_paire(opt.paire,opt)
    else
        M.add_pairs(opt.pair,opt)
    end
end
return M
