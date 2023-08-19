local M={}
--[[
---@param a number
---@param b table
function M.test(a,b)
end
--]]
M.pos=nil
function M.enter()
    local linenr=vim.fn.line('.') --[[@as number]]
    M.buf=vim.api.nvim_get_current_buf()
    local line=vim.api.nvim_get_current_line()
    M.pos={linenr,M.buf,line}
end
function M.getline(linenr)
    return vim.api.nvim_buf_get_lines(M.buf,linenr-1,linenr,false)[1]
end
function M.setline(linenr,line)
    return vim.api.nvim_buf_set_lines(M.buf,linenr-1,linenr,false,{line})
end
function M.addline(linenr,line)
    return vim.api.nvim_buf_set_lines(M.buf,linenr,linenr,false,{line})
end
function M.get_c(linenr)
    local ret={off=0}
    if M.getline(linenr-1):find('---@return ') then
        ret.off=1
        linenr=linenr-1
    end
    while M.getline(linenr-1) and M.getline(linenr-1):find('---@param') do
        linenr=linenr-1
        local _,_,var,typ=M.getline(linenr):find('---@param ([^ ]*) (.*)')
        ret[var]={row=linenr,type=typ,doc=''}
    end
    return ret
end
function M.leave()
    if not M.pos then return end
    local linenr,buf,_=unpack(M.pos)
    M.buf=buf
    if not vim.api.nvim_buf_is_loaded(buf) then return end
    local line=vim.api.nvim_buf_get_lines(buf,linenr-1,linenr,false)[1]
    if not line or not line:find('^%s*function.*') then return end
    local mod={}
    local of=0
    for var,st,ty,en in line:gmatch('[(,]([^,)]*)():([^,)]*)()') do
        line=line:sub(1,st-of-1)..line:sub(en-of)
        of=of+(en-st)
        table.insert(mod,1,{var,ty})
    end
    local rst,rty=line:match('%)():([^()]*)$')
    if rty then
        line=line:sub(1,rst-of-1)
        if M.getline(linenr-1) and M.getline(linenr-1):find('---@return ') then
            M.setline(linenr-1,'---@return '..rty)
        else
            M.addline(linenr-1,'---@return '..rty)
            linenr=linenr+1
        end
    end
    local c=M.get_c(linenr)
    for _,v in ipairs(mod) do
        local var,typ=unpack(v)
        if c[var] then
            M.setline(c[var].row,'---@param '..var..' '..typ)
        else
            M.addline(linenr-1-c.off,'---@param '..var..' '..typ)
            linenr=linenr+1
        end
    end
    M.setline(linenr,line)
    M.pos=nil
end
function M.setup()
    local group=vim.api.nvim_create_augroup('Whint',{})
    vim.api.nvim_create_autocmd('InsertEnter',{callback=M.enter,group=group})
    vim.api.nvim_create_autocmd('InsertLeave',{callback=M.leave,group=group})
end
if vim.dev then
    M.setup()
    vim.cmd.norm{'5gg',bang=true}
end
return M
