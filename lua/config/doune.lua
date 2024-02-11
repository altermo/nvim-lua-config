vim.opt.runtimepath:prepend('/home/user/.config/nvim/.other/doune.nvim') --For testing
for k,v in pairs{
    iedit=function (m)
        vim.keymap.set({'x','n'},'gi',m.select)
        vim.keymap.set('n','gC',m.stop)
    end,
} do v(require('doune.'..k)) end
