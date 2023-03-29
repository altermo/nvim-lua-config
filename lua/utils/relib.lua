local function valid(func,...)
    NOVALIDATE=true
    return (function (state,...)
        NOVALIDATE=false
        if state then
            return ...
        end
        error(...)
    end)(pcall(func,...))
end
local function add(o,str,func)
    if not o._res then
        o._res={}
    end
    o._res[str]=o[str]
    o[str]=func
end
local function test(obj,typ)
    local t=type(obj)
    for _,v in ipairs(typ) do
        if t==v then return end
    end
    error(string.format('Expected %s, got %s',vim.inspect(typ),type(obj)))
end
add(vim,'tbl_contains',function (t,value)
    test(t,{'table'})
    return valid(vim._res.tbl_contains,t,value)
end)
add(vim,'split',function (s,sep,kwargs)
    test(kwargs,{'boolean','table','nil'})
    return valid(vim._res.split,s,sep,kwargs)
end)
add(vim.keymap,'set',function (mode, lhs, rhs, opts)
    test(mode,{'table','string'})
    test(lhs,{'string'})
    test(rhs,{'string','function'})
    test(opts,{'table','nil'})
    return valid(vim.keymap._res.set,mode,lhs,rhs,opts)
end)
add(vim,'validate',function (...)
    if not NOVALIDATE then
        vim._res.validate(...)
    end
end)

