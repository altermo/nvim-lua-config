local M={}
M.prev_match=nil
function M.get_visual()
    local reg=vim.region(0,'v','.','',true)
    if vim.tbl_count(reg)>1 then return end
    local linenr,pos=next(reg)
    local start,fin=unpack(pos)
    return linenr,start+1,fin
end
function M.clear()
    if M.prev_match then
        vim.fn.matchdelete(M.prev_match)
        M.prev_match=nil
    end
end
function M.do_highlight()
    M.clear()
    local linenr,start,fin=M.get_visual()
    if not linenr or not start then return end
    local mline=vim.api.nvim_buf_get_lines(0,linenr,linenr+1,false)[1]
    local line=mline:sub(start,fin)
    if vim.trim(line)=='' then return end
    M.prev_match=vim.fn.matchadd('Visual','\\M'..vim.fn.escape(line,'\\'))
end
function M.setup()
    vim.api.nvim_create_augroup('hisel',{})
    local id
    vim.api.nvim_create_autocmd('ModeChanged',{group='hisel',callback=function ()
        M.do_highlight()
        id=vim.api.nvim_create_autocmd('CursorMoved',{callback=M.do_highlight})
    end,pattern='*:[v\x16]'})
    vim.api.nvim_create_autocmd('ModeChanged',{group='hisel',callback=function ()
        if id then vim.api.nvim_del_autocmd(id) end
        M.clear()
    end,pattern='[v\x16]:*'})
end
M.setup()
return M
