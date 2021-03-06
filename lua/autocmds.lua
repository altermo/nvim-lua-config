local function autocmd(au,opt)
    vim.api.nvim_create_autocmd(au,opt)
end
autocmd('BufWinEnter',{command='if &filetype==""|source /home/user/.config/nvim/syntax/txt.vim|endif'})
autocmd('BufEnter',{command='if bufname("") !~ "^\\[A-Za-z0-9\\]*://" | lcd %:p:h | endif'})
autocmd('CmdlineEnter',{pattern='/,\\?',command='set hlsearch'})
autocmd('TermOpen',{command='set ft=term'})
