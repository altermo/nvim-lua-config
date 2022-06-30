local function autocmd(au,opt)
    vim.api.nvim_create_autocmd(au,opt)
end
autocmd('BufWinEnter',{command='if line("\'\\"") <= line("$")|silent! normal! g`"|endif'})
autocmd('BufWinEnter',{command='if &filetype==""|set ft=text|endif'}) --TODO
autocmd('TextYankPost',{command='silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=700})'})
autocmd('BufEnter',{command='if bufname("") !~ "^\\[A-Za-z0-9\\]*://" | lcd %:p:h | endif'})
autocmd('CmdlineEnter',{pattern='/,\\?',command='set hlsearch'})
