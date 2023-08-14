local dff=require'dff.dff'
local M={}
---@param path string?
---@param conf dff.config?
function M.open(path,conf)
    conf=conf or require'dff.init'.config or {}
    if path==nil then path='.' end
    path=vim.fn.fnamemodify(path,':p')
    ---@cast path string
    local buf=vim.api.nvim_create_buf(false,true)
    vim.api.nvim_buf_set_option(buf,"bufhidden","wipe")
    local win
    if conf.wintype=='float' then
        win=vim.api.nvim_open_win(buf,true,{
            col=conf.wjust,
            row=conf.hjust,
            width=vim.o.columns-conf.wjust*2,
            height=vim.o.lines-conf.hjust*2,
            relative='editor',
        })
    elseif conf.wintype=='current' or conf.wintype==nil then
        win=vim.api.nvim_get_current_win()
    end
    vim.api.nvim_win_set_buf(win,buf)
    vim.api.nvim_buf_set_name(buf,'dff-file-explorer')
    M.mainloop(buf,path,conf)
end
function M.com_open(args)
    M.open(args.args~='' and args.args or nil)
end
---@param buf number
---@param path string
---@param conf dff.config
function M.mainloop(buf,path,conf)
    path=vim.fs.normalize(path)
    local ns=vim.api.nvim_create_namespace('')
    local search=dff.create_search(vim.fn.readdir(path),conf)
    local function fn()
        if #search.list==1 then
            path=vim.fs.joinpath(path,search.list[1])
            if vim.fn.isdirectory(path)==0 then
                vim.cmd.edit(path)
                return
            end
            search=dff.create_search(vim.fn.readdir(path),conf)
            M.draw(buf,search,path,ns)
            vim.schedule(fn)
            return
        end
        local key=vim.fn.getcharstr() or ''
        if key=='\r' then key='\n' end
        if key=='' then
            vim.cmd.edit(path)
            return
        end
        if key=='\x80kb' then
            if dff.back(search) then
                path=vim.fs.dirname(path) --[[@as string]]
                search=dff.create_search(vim.fn.readdir(path),conf)
            end
            M.draw(buf,search,path,ns)
            vim.schedule(fn)
            return
        end
        local ret=dff.send_key(search,key)
        if ret then
            path=vim.fs.joinpath(path,ret)
            if vim.fn.isdirectory(path)==0 then
                vim.cmd.edit(path)
                return
            end
            search=dff.create_search(vim.fn.readdir(path),conf)
        end
        M.draw(buf,search,path,ns)
        vim.schedule(fn)
    end
    M.draw(buf,search,path,ns)
    vim.schedule(fn)
end
---@param buf number
---@param obj dff.search_obj
---@param rpath string
---@param ns number
function M.draw(buf,obj,rpath,ns)
    vim.api.nvim_buf_set_lines(buf,0,-1,false,{})
    for i=obj.range[1],obj.range[2] do
        local path=obj.list[i]
        local text=(vim.fn.isdirectory(vim.fs.joinpath(rpath,path))==1 and '/' or ' ')..path
        if #text==obj.col then text=text..'\\n' end
        vim.api.nvim_buf_set_lines(buf,-1,-1,false,{text})
        vim.highlight.range(buf,ns,'Comment',{vim.fn.line'$'-1,1},{vim.fn.line'$'-1,obj.col})
        vim.highlight.range(buf,ns,'Constant',{vim.fn.line'$'-1,obj.col},{vim.fn.line'$'-1,obj.col+1})
    end
    vim.api.nvim_buf_set_lines(buf,0,1,false,{})
    vim.cmd.redraw()
end
return M
