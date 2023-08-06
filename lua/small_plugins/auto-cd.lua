local M={}
function M.autocd()
    if M._dont_autocd then return end
    if vim.o.buftype~='' then return end
    local dir=vim.fs.dirname(vim.fs.find('.git',{upward=true})[1])
    if dir then
        vim.cmd.lcd(dir)
        return
    end
    vim.cmd.lcd(vim.fn.expand('%:p:h'))
end
function M.toggle_autocd()
    M._dont_autocd=not M._dont_autocd
end
function M.setup()
    vim.api.nvim_create_autocmd('BufRead',{callback=M.autocd})
    vim.api.nvim_create_user_command('AutocdToggle',M.toggle_autocd,{})
end
return M
