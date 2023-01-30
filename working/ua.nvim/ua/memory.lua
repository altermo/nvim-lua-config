local M={}
M.extensions={}
M.filters={}
M.mem={}
M.mapped={}
function M.load_extension(name)
    return require('ua.ua_extensions.'..name)
end
function M._filters_add_defaults(filters)
    local conf=require('ua.config').conf
    if conf._default_beg_filter then filters=vim.list_extend({{call=conf._default_beg_filter}},filters) end
    filters=vim.list_extend(conf._prefilters or {},filters)
    filters=vim.list_extend(filters,conf._postfilters or {})
    if conf._default_end_filter then filters=vim.list_extend(filters,{{call=conf._default_end_filter}}) end
    return filters
end
function M.gen_filters()
    local filters={}
    for name,extension in pairs(M.extensions) do
        if extension.filter then
            filters[#filters+1]={call=extension.filter,conf=extension.conf,name=name}
        end
    end
    M.filters=M._filters_add_defaults(filters)
end
function M.addpair(key,pair,paire,type)
    M.mem[key]={pair=pair,paire=paire,type=type,ext={}}
end
function M.addext(key,name)
    M.mem[key].ext[name]={}
end
return M
