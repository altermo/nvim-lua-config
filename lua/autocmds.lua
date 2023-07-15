local function autocmd(au,opt)
    return vim.api.nvim_create_autocmd(au,opt)
end
autocmd('BufWinEnter',{command='if &filetype==""|set filetype=txt|endif'})
autocmd('CmdlineEnter',{pattern='/,\\?',command='set hlsearch'})
autocmd('TermOpen',{command='set ft=term'})
autocmd('FileType',{pattern='qf',command='nno <buffer><CR> <CR>'})
--autocmd('BufWrite',{command='if &filetype=="help"|helptags .|endif'})
vim.api.nvim_create_autocmd('BufReadPre',{callback=function(args)
  if vim.loop.fs_stat(vim.api.nvim_buf_get_name(args.buf)).size>1024*1024*4 then
    vim.api.nvim_buf_delete(args.buf,{})
    vim.notify('file to big')
  end
end})
local autocd
vim.api.nvim_create_user_command('ToggleAutocd',function()
    if autocd then
        vim.api.nvim_del_autocmd(autocd)
        autocd=nil
    else
        autocd=autocmd('BufRead',{callback=function ()
            if vim.o.buftype~='' then return end
            local dir=vim.fs.dirname(vim.fs.find('.git',{upward=true})[1])
            if dir then
                vim.cmd.lcd(dir)
                return
            end
            vim.cmd.lcd(vim.fn.expand('%:p:h'))
        end})
    end
end,{})
vim.cmd'ToggleAutocd'
