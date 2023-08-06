return {setup=function()
    vim.api.nvim_create_autocmd('BufReadPre',{callback=function(args)
        if vim.loop.fs_stat(args.file).size>1024*1024 then
            vim.cmd.enew()
            vim.fn.termopen('nvim -n -u NONE -- '..args.file)
            vim.api.nvim_buf_delete(args.buf,{})
            vim.notify('file to big')
        end end})
end}
