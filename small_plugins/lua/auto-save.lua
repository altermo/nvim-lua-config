local M={}
function M.dosave()
    if vim.o.modified and not vim.o.readonly and vim.o.buftype=='' then
        vim.cmd('silent! update ++p')
        print("AutoSave: saved at "..vim.fn.strftime("%H:%M:%S"))
    end
end
function M.setup()
    local AutoSave vim.api.nvim_create_augroup('AutoSave',{clear=true})
    vim.api.nvim_create_autocmd({'InsertLeave','TextChanged'},{callback=M.dosave,group=AutoSave})
end
return M
