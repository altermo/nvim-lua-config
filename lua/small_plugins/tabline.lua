local M={}
M.MyTabLine=function()
    local curtab = vim.fn.tabpagenr()
    local line = ''
    for i, _ in ipairs(vim.fn.gettabinfo()) do
        local file=vim.fn.bufname(vim.fn.tabpagebuflist(i)[vim.fn.tabpagewinnr(i)])
        local char
        if file=='' or not file then
            char='N'
        elseif file:match('^term://') then
            char=file:match('ranger') and 'R' or 'T'
        elseif #file>20 then
            char=file:sub(1,17)..'...'
        else
            char=file
        end
        line=line..(i==curtab and '%#TabLineSel#' or '%#TabLine#')..'\226\157\172'..char..'\226\157\173' --❬❭❮❯❰❱
    end
    return line..'%#TabLine#'
end
function M.setup()
    _G.MyTabLine=M.MyTabLine
    vim.o['tabline']='%!v:lua.MyTabLine()'
end
return M
