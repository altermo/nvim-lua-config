local function autocmd(au,opt)
    return vim.api.nvim_create_autocmd(au,opt)
end
autocmd('BufWinEnter',{command='if &filetype==""|set filetype=txt|endif'})
autocmd('CmdlineEnter',{pattern='/,\\?',command='set hlsearch'})
autocmd('TermOpen',{command='set ft=term'})
autocmd('FileType',{pattern='qf',command='nno <buffer><CR> <CR>'})
autocmd('BufWinEnter',{callback=function()
    pcall(function ()
        if vim.fn.line('\'"')<=vim.fn.line('$') then
            vim.cmd('norm! g`"')
        end
    end)
end})
vim.api.nvim_create_autocmd('VimLeave',{callback=function()
    vim.cmd.mksession({'/tmp/session.vim',bang=true})
end})
