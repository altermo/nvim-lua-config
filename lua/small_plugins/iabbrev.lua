local M={}
M.conf={
    l={'local',act=' '},
}
function M.callback()
    local line=vim.fn.getline('.') --[[@as string]]
    local col=vim.fn.col('.')
    for k,v in pairs(M.conf) do
        if line:sub(col-#k-1,col+1)=='^.\\<'..k..'\\>.$' and vim.v.char==v.act then
            vim.v.char='kd'..v[1]..v.act
        end
    end
end
function M.setup()
    vim.api.nvim_create_augroup('iab',{})
    vim.api.nvim_create_autocmd('InsertCharPre',{group='iab',pattern='',callback=M.callback})
end
return M
