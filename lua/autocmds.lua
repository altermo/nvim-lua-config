local function autocmd(au,opt)
    return vim.api.nvim_create_autocmd(au,opt)
end
autocmd('BufWinEnter',{command='if &filetype==""|set filetype=txt|endif'})
autocmd('CmdlineEnter',{pattern='/,\\?',command='set hlsearch'})
autocmd('TermOpen',{command='set ft=term'})
autocmd('FileType',{pattern='qf',command='nno <buffer><CR> <CR>'})
--autocmd('BufWrite',{command='if &filetype=="help"|helptags .|endif'})
local autocd
vim.api.nvim_create_user_command('ToggleAutocd',function()
    if autocd then
        vim.api.nvim_del_autocmd(autocd)
        autocd=nil
    else
        autocd=autocmd('BufRead',{callback=function ()
            if vim.o.buftype~='' then return end
            for dir in vim.fs.parents(vim.api.nvim_buf_get_name(0)) do
                if vim.fn.isdirectory(dir .. "/.git")==1 then
                    vim.cmd.lcd(dir)
                    return
                end
            end
            vim.cmd.lcd(vim.fn.expand('%:p:h'))
        end})
    end
end,{})
vim.cmd'ToggleAutocd'
