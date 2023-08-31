local M={}
function M.timeout_input(timeout,update)
    timeout=timeout or 500
     vim.fn.inputsave()
    local ret=''
    local function print_prompt(text)
        vim.api.nvim_echo({},false,{})
        vim.cmd('redraw')
        vim.api.nvim_echo({{'>','Question'},{text}},false,{})
    end
    print_prompt(ret)
    local key=vim.fn.getcharstr()
    while true do
        if key=='\r' then break
        elseif key=='\x80kb' then ret=ret:sub(1,-2)
        else ret=ret..key end
        print_prompt(ret)
        if update then update(ret) end
        local _,status=vim.wait(timeout,function ()
            key=vim.fn.getcharstr(0)
            return key~=''
        end)
        if status==-1 then break end
    end
    vim.fn.inputrestore()
    return ret
end
function M.termrun(bin,opt)
    opt=opt or {}
    vim.cmd.enew()
    local buf=vim.api.nvim_get_current_buf()
    vim.fn.termopen((opt.mouse and "sleep 0.01;printf '\\e[?1000h';" or "")..bin,{on_exit=function (_,_,_)
        if opt.close_single and #vim.fn.getbufinfo()==1 then vim.cmd.quitall() end
        vim.cmd.bdelete({buf,bang=true})
    end})
    vim.api.nvim_buf_set_option(buf,'bufhidden','wipe')
    vim.cmd.startinsert()
end
function M.utf8_sub(s,i,j)
    local pos=vim.str_utf_pos(s) --[[@as number[]]
    j=j or -1
    if i<0 then i=#pos+i+1 end
    if j<0 then j=#pos+j+1 end
    local start=pos[i]
    local end_=pos[j]
    return s:sub(start,end_+vim.str_utf_end(s,end_))
end
function M.tabbufmove(num)
    local buf=vim.fn.bufnr()
    local win=vim.api.nvim_get_current_win()
    vim.cmd.tabnext(num)
    vim.cmd('vert sbuf'..buf)
    vim.api.nvim_win_close(win,true)
end
function M.get_tree_lang()
    local stat,parser=pcall(vim.treesitter.get_parser,0)
    if not stat then return end
    local curpos=vim.api.nvim_win_get_cursor(0)
    local row,col=curpos[1]-1,curpos[2]
    local lang=parser:language_for_range({row,col,row,col})
    return lang:lang()
end
function M.req(source)
  package.loaded[source]=nil
  return require(source)
end
return M
