local M={}
M.locked_files={}
function M.get_list(key)
    return vim.iter(vim.api.nvim_list_bufs()):filter(vim.api.nvim_buf_is_loaded):map(function(v)
        local filepath=vim.fn.fnamemodify(vim.api.nvim_buf_get_name(v),':p')
        local filename=vim.fs.basename(filepath)
        if vim.fn.filereadable(filepath)~=1 then return end
        if key and key~=filename:sub(1,1) then return end
        return filepath
    end):totable()
end
function M.unlock_file(key)
    M.locked_files[key]=nil
end
function M.lock_file(key)
    if #M.get_list(key)==1 then
        M.locked_files[key]=M.get_list(key)[1]
        return
    end
    vim.ui.select(M.get_list(key),{},function (i) M.locked_files[key]=i end)
end
function M.goto_file(key)
    local dict=M.get_list(key)
    if not dict then return end
    if #dict==1 then
        vim.cmd.edit(dict[1])
        return
    end
    if M.locked_files[key] then
        vim.cmd.edit(M.locked_files[key])
        return
    end
    vim.ui.select(dict,{},function (file) vim.cmd.edit(file) end)
end
function M.select()
    vim.ui.select(M.get_list(),{format_item=function (file)
        return vim.tbl_contains(M.locked_files,file) and '>>'..file or file
    end
    },function (file) vim.cmd.edit(file) end)
end
function M.run()
    local char=vim.fn.getcharstr()
    if char=='\t' then M.lock_file(vim.fn.getcharstr())
    elseif char=='\x80kB' then M.unlock_file(vim.fn.getcharstr())
    elseif char=='\r' then M.select()
    elseif char~='' then M.goto_file(char)
    end
end
return M
