local M={}
M.save={opt={}}
function M.set_win()
    vim.wo.number=false
    vim.wo.relativenumber=false
    vim.wo.cursorline=false
    vim.wo.colorcolumn=''
    vim.wo.signcolumn='no'
end
function M.run()
    if vim.t.zen_mode then
        vim.cmd.tabclose()
        for k,v in pairs(M.save.opt) do
            vim.o[k]=v
        end
        M.save={opt={}}
        local s,t=pcall(require,'twilight')
        if s then t.disable() end
        return
    end
    vim.cmd'tab split'
    vim.cmd'tabmove -1'
    M.set_win()
    vim.cmd'rightbelow vnew'
    M.set_win()
    vim.cmd.wincmd'p'
    vim.cmd'leftabove vnew'
    M.set_win()
    vim.cmd.wincmd'p'
    vim.t.zen_mode=true
    vim.api.nvim_create_autocmd('WinLeave',{callback=M.run,once=true})
    for k,v in pairs({
        laststatus=0,
        showtabline=0,
        cmdheight=0
        }) do
        M.save.opt[k]=vim.o[k]
        vim.o[k]=v
    end
    M.save.au=vim.api.nvim_create_autocmd('WinResized',{callback=function() vim.cmd.wincmd'=' end})
    local s,t=pcall(require,'twilight')
    if s then t.enable() end
end
return M
