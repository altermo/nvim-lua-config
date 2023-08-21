local M={}
function M.getline(linenr)
    return vim.api.nvim_buf_get_lines(0,linenr-1,linenr,false)[1]
end
function M.in_lua()
    local stat,parser=pcall(vim.treesitter.get_parser,0)
    if not stat then return vim.o.filetype=='lua' end
    local curpos=vim.api.nvim_win_get_cursor(0)
    local row,col=curpos[1]-1,curpos[2]
    local lang=parser:language_for_range({row,col,row,col})
    return lang:lang()=='lua'
end
function M.in_statment()
    local node=vim.treesitter.get_node()
    if not node then return end
    if node:type()~='parameters' then return end
    local par=node:parent()
    if not par then return end
    if par:type()~='function_declaration' then return end
    return true
end
function M.run_statment()
    vim.schedule(M.open_statment_win)
end
function M.get_name()
    local curpos=vim.api.nvim_win_get_cursor(0)
    local node=vim.treesitter.get_node({pos={curpos[1]-1,curpos[2]-1}})
    if not node then return end
    local _,start,_,end_=node:range()
    return vim.api.nvim_get_current_line():sub(start+1,end_)
end
function M.has_return(linenr)
    return linenr>1 and M.getline(linenr-1):find('---@return ')
end
function M.get_param_pos(name,linenr)
    while M.getline(linenr-1) and M.getline(linenr-1):find('---@param') do
        linenr=linenr-1
        local _,_,var,_=M.getline(linenr):find('---@param ([^ ]*) (.*)')
        if var==name then
            return linenr,11+#name
        end
    end
end
function M.default_get_param_pos(name)
    local linenr=vim.api.nvim_win_get_cursor(0)[1]
    local off=M.has_return(linenr) and 1 or 0
    local linenr_,col=M.get_param_pos(name,linenr-off)
    if not linenr_ then
        vim.api.nvim_buf_set_lines(0,linenr-off-1,linenr-off-1,true,{'---@param '..name..' '})
        M.cur[1]=M.cur[1]+1
        return linenr-off+1,11+#name
    end
    return linenr,col
end
function M.open_statment_win()
    M.cur=vim.api.nvim_win_get_cursor(0)
    local name=M.get_name()
    local linenr,col=M.default_get_param_pos(name)
    vim.api.nvim_win_set_cursor(0,{linenr-1,col})
    vim.cmd.norm{'$l',bang=true}
    vim.api.nvim_create_autocmd('InsertLeave',{callback=function(au)
        vim.api.nvim_win_set_cursor(0,M.cur)
        vim.cmd.startinsert()
        vim.api.nvim_del_autocmd(au.id)
    end})
end
function M.run()
    if not M.in_lua() then return ':' end
    if M.in_statment() then
        M.run_statment()
    --elseif M.in_return() then
        --M.run_return()
    else
        return ':'
    end
end
function M.setup()
    vim.keymap.set('i',':',M.run,{expr=true})
end
if vim.dev then
    M.setup()
end
return M
