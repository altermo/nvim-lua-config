local M={}
M.comments={
    lua='--%s',
    python='#%s',
    [true]='/*%s*/'
}
function M._langauge_for_range(self,range,_s)
    _s=_s or {}
    table.insert(_s,1,self)
    for _, child in pairs(self._children) do
        if child:contains(range) then
            return M._langauge_for_range(child,range,_s)
        end
    end
    return _s
end
function M.get_ft() --TODO: fix for empty lines
    local stat,parser=pcall(vim.treesitter.get_parser,0)
    if not stat then
        return vim.o.filetype
    end
    local curpos=vim.api.nvim_win_get_cursor(0)
    local row,col=curpos[1]-1,curpos[2]

    local lang=M._langauge_for_range(parser,{row,col,row,col})
    local ret=lang[1]:lang()
    if vim.tbl_contains({'comment','markdown_inline'},ret) and lang[2] then
        ret=lang[2]:lang()
    end
    return ret
end
function M.get_comment(ft)
    if M.comments[ft] then
        return M.comments[ft]
    end
    local comment=vim.filetype.get_option(ft,'commentstring')
    if comment~='' then
        return comment
    end
    return M.comments[true]
end
function M.comment_line(line,com)
    local indent=line:sub(1,(line:find('[^ ]') or 1)-1)
    local sline=line:sub((line:find('[^ ]') or 1))
    return indent..com:format(sline)
end
function M.uncomment_line(line,com)
    local coms=vim.trim(com:sub(1,com:find('%%s')-1))
    local come=vim.trim(com:sub(com:find('%%s')+2))
    local indent=line:sub(1,(line:find('[^ ]') or 1)-1)
    local sline=line:sub((line:find('[^ ]') or 1))
    return indent..sline:sub(#coms+1,(come~='' and -#come-1 or nil))
end
function M.is_commented(line,com)
    line=vim.trim(line)
    if line=='' then return false end
    local coms=vim.trim(com:sub(1,com:find('%%s')-1))
    local come=vim.trim(com:sub(com:find('%%s')+2))
    if line:sub(1,#coms)==coms and (come=='' or line:sub(-#come)==come) then
        return true
    end
end
function M.comment_lines(beg,fin)
    local lines=vim.api.nvim_buf_get_lines(0,beg,fin,false)
    local firstline=lines[1]
    local com=M.get_comment(M.get_ft())
    local iscom=M.is_commented(firstline,com)
    local fn=iscom and M.uncomment_line or M.comment_line
    vim.api.nvim_buf_set_lines(0,beg,fin,false,
        vim.iter(lines):map(function (v) return fn(v,com) end):totable()
    )
end
function M.map_x()
    local reg=vim.tbl_keys(vim.region(0,'v','.','',true))
    local beg,fin=vim.fn.min(reg),vim.fn.max(reg)+1
    M.comment_lines(beg,fin)
end
function M.setup()
    vim.keymap.set('x','gc',M.map_x)
    vim.keymap.set('n','gc',M.map_x)
end
return M
