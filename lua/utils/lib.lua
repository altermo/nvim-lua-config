local M={}
---@param bin string
---@param close_single? boolean
function M.termrun(bin,close_single)
    vim.cmd.enew()
    local buf=vim.api.nvim_get_current_buf()
    --If mouse doesn't work, try with `sleep 0.1`: https://github.com/neovim/neovim/issues/19408
    vim.fn.termopen(bin,{on_exit=function (_,_,_)
        if close_single and #vim.fn.getbufinfo()==1 and vim.api.nvim_get_current_buf()==buf then vim.cmd.quitall() end
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
