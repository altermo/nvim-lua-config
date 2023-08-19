return {setup=function()
    vim.api.nvim_create_autocmd('BufReadPre',{callback=function(args)
        if vim.loop.fs_stat(args.file).size>1024*1024 then
            vim.api.nvim_buf_delete(args.buf,{})
            vim.cmd.enew()
            vim.fn.termopen('nvim -n -u NONE -- '..args.file)
            vim.notify('file to big')
        end end}) --TODO fix for when opening from terminal
end}
