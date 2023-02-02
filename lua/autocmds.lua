local function autocmd(au,opt)
    return vim.api.nvim_create_autocmd(au,opt)
end
autocmd('BufWinEnter',{command='if &filetype==""|set filetype=txt|endif'})
autocmd('CmdlineEnter',{pattern='/,\\?',command='set hlsearch'})
autocmd('TermOpen',{command='set ft=term'})
autocmd('FileType',{pattern='qf',command='nno <buffer><CR> <CR>'})
autocmd('BufWrite',{command='if &filetype=="help"|helptags .|endif'})
autocmd('User',{pattern='isfolded',command='set foldcolumn=auto:2'}) --TODO
local autocd
vim.api.nvim_create_user_command('ToggleAutocd',function()
    if autocd then
        vim.api.nvim_del_autocmd(autocd)
        autocd=nil
    else
        autocd=autocmd('BufEnter',{command='if bufname("") !~ "^\\[A-Za-z0-9\\]*://" | lcd %:p:h | endif'})
    end
end,{})
vim.cmd'ToggleAutocd'
