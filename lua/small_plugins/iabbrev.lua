local M={}
M.conf={
    l={'local',act=' ',ft='lua'},
}
function M.callback()
    local line=vim.fn.getline('.') --[[@as string]]
    local col=vim.fn.col('.')
    local keyword=vim.regex([=[\v[^[:keyword:]]]=]) or {}
    local out
    for k,v in pairs(M.conf) do
        local prev=line:sub(col-#k-1,col-#k-1)
        local next=line:sub(col+1,col+1)
        if line:sub(col-#k,col)==k and vim.v.char==v.act and
        (prev=='' or keyword:match_str(prev)) and
        (next=='' or keyword:match_str(next)) and
        (not v.ft or vim.o.filetype==v.ft) then
            out=(vim.keycode'<bs>'):rep(1+#k)..v[1]
            break
        end
    end
    if out then
        vim.pprint(out)
        vim.api.nvim_feedkeys(out..vim.v.char,'n',false)
    end
end
function M.setup()
    vim.api.nvim_create_augroup('iab',{})
    vim.api.nvim_create_autocmd('InsertCharPre',{group='iab',pattern='',callback=M.callback})
end
return M
