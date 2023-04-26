local M={}
function M.tabbufmove(num)
    local buf=vim.fn.bufnr()
    local win=vim.api.nvim_get_current_win()
    vim.cmd.tabnext(num)
    vim.cmd('vert sbuf'..buf)
    vim.api.nvim_win_close(win,{})
end
function M.setup()
    vim.api.nvim_create_user_command("TabBufMove",function(args) M.tabbufmove(args.args) end,{nargs=1})
end
return M
