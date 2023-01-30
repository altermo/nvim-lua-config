local M={}
function M.check_rule(rule,o)
    local cmd=rule[1]
    local args={unpack(rule,2)}
    if cmd=='not' then
        return not M.check_rule(args[1],o)
    elseif cmd=='when' then
        for i=1,#args/2 do
            if M.check_rule(args[i*2-1],o) then
                return M.check_rule(args[i*2],o)
            end
        end
        if #args%2==1 then
            return M.check_rule(args[#args],o)
        else
            return true
        end
    elseif cmd=='and' then
        for _,v in ipairs(args) do
            if not M.check_rule(v,o) then
                return false
            end
        end
        return true
    elseif cmd=='or' then
        for _,v in ipairs(args) do
            if M.check_rule(v,o) then
                return true
            end
        end
        return false
    elseif cmd=='next' then
        return o.line:sub(o.col+(args[2] or 1)-1,o.col+(args[2] or 1)-1)==args[1]
    elseif cmd=='previous' then
        return o.line:sub(o.col-(args[2] or 1),o.col-(args[2] or 1))==args[1]
    elseif cmd=='filetype' then
        return vim.tbl_contains(args,vim.o.filetype)
    elseif cmd=='call' then
        return args[1](o,unpack(args,2))
    elseif cmd=='instring' then
        return require'ua.utils.info_line'.in_string(o.line,o.col)
    else
        error(("Unknown command %s"):format(cmd))
    end
end
function M.check_rules(rules,o)
    for _,v in ipairs(rules) do
        if M.check_rule(v,o) then
            return true
        end
    end
    return false
end
function M.init(keyconf,mem)
    if keyconf.rules then
        for _,v in ipairs(keyconf.rules) do
            mem[#mem+1]=v
        end
    end
end
function M.filter(o,_,mem)
    if #o.key>1 then return end
    if #mem==0 then return end
    if M.check_rules(mem,o) then
        return
    end
    return 2
end
return M
