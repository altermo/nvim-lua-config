return {setup=function()
    vim.api.nvim_create_autocmd('BufReadPre',{callback=function(args)
        if vim.loop.fs_stat(args.file).size>1024*1024 then
            local buf=vim.api.nvim_create_buf(false,true)
            vim.api.nvim_buf_set_option(buf,'bufhidden','wipe')
            vim.api.nvim_win_set_buf(0,buf)
            vim.api.nvim_buf_delete(args.buf,{})
            vim.notify('file to big')
            vim.fn.termopen('nvim -n -u NONE -- '..args.file)
        end end})
end}
