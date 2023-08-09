local function autocmd(au,opt)
    return vim.api.nvim_create_autocmd(au,opt)
end
autocmd('BufWinEnter',{command='if &filetype==""|set filetype=txt|endif'})
autocmd('CmdlineEnter',{pattern='/,\\?',command='set hlsearch'})
autocmd('TermOpen',{command='set ft=term'})
autocmd('FileType',{pattern='qf',command='nno <buffer><CR> <CR>'})
autocmd('BufReadPost',{pattern='*.lua',callback=function ()
    if vim.fn.line('$')==1 and vim.fn.getline(1)=='' and not vim.regex([[empty\|Luapad]]):match_str(vim.fn.bufname()) then
        vim.api.nvim_buf_set_lines(0,0,-1,false,{'local M={}','','return M'})
    end
end})
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
--autocmd('BufWrite',{command='if &filetype=="help"|helptags .|endif'})
