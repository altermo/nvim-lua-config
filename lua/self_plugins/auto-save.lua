local function DoSave()
    if vim.o.modified then
        vim.cmd('silent! update')
        vim.api.nvim_echo({{'AutoSave: saved at '..vim.fn.strftime'%H:%M:%S','Normal'}},false,{})
    end
end
local AutoSave=vim.api.nvim_create_augroup('AutoSave',{clear=true})
vim.api.nvim_create_autocmd({'InsertLeave','TextChanged'},{callback=DoSave,group=AutoSave})
