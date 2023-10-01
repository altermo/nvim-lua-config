local M={}
---@param bin string
---@param opt? {mouse?:boolean,close_single?:boolean}
function M.termrun(bin,opt)
    opt=opt or {}
    vim.cmd.enew()
    local buf=vim.api.nvim_get_current_buf()
    --Why sleep 0.01: https://github.com/neovim/neovim/issues/19408
    vim.fn.termopen((opt.mouse and "sleep 0.01;printf '\\e[?1000h';" or "")..bin,{on_exit=function (_,_,_)
        if opt.close_single and #vim.fn.getbufinfo()==1 and vim.api.nvim_get_current_buf()==buf then vim.cmd.quitall() end
        pcall(vim.cmd.bdelete,{buf,bang=true})
    end})
    vim.api.nvim_set_option_value('bufhidden','wipe',{buf=buf})
    vim.cmd.startinsert()
end
---@param num number|string
function M.tabbufmove(num)
    local buf=vim.fn.bufnr()
    local win=vim.api.nvim_get_current_win()
    vim.cmd.tabnext(num)
    vim.cmd('vert sbuf'..buf)
    vim.api.nvim_win_close(win,true)
end
---@param source string
---@return any
function M.req(source)
  package.loaded[source]=nil
  return require(source)
end
return M
