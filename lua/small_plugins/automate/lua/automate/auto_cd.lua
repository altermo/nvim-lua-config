local M={}
function M.callback()
    if M._dont_autocd then return end
    if vim.o.buftype~='' then return end
    local dir=vim.fs.dirname(vim.fs.find('.git',{upward=true,path=vim.fs.dirname(vim.api.nvim_buf_get_name(0))})[1])
    if dir then
        vim.cmd.lcd(dir)
    else
        pcall(vim.cmd.lcd,vim.fn.expand('%:p:h'))
    end
    --vim.cmd.pwd()
end
return M
