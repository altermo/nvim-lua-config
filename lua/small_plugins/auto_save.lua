local M={}
function M.dosave()
    if vim.o.modified and not vim.o.readonly and vim.o.buftype=='' then
        local sl,sc=unpack(vim.api.nvim_buf_get_mark(0,'['))
        local el,ec=unpack(vim.api.nvim_buf_get_mark(0,']'))
        vim.cmd('silent! update ++p')
        vim.cmd.echon(("'AutoSave: saved at "..vim.fn.strftime("%H:%M:%S")):sub(1,vim.o.columns-12).."'")
        pcall(function()
            vim.api.nvim_buf_set_mark(0,'[',sl,sc,{})
            vim.api.nvim_buf_set_mark(0,']',el,ec,{})
        end)
    end
end
function M.setup()
    local AutoSave=vim.api.nvim_create_augroup('AutoSave',{clear=true})
    vim.api.nvim_create_autocmd({'InsertLeave','TextChanged'},{callback=M.dosave,group=AutoSave})
end
return M
