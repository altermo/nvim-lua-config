if vim.fn.filereadable('/tmp/focus')==1 then vim.cmd.quit() end
vim.loader.enable()
require'keymaps' --500/1000ms
require'autocmds' --200/1000ms
require'options' --250/1000ms
require'other' --110/1000ms
require'plugins' --n/a
for _,v in ipairs{'own','tokyonight','retrobox'} do
    vim.o.background=v=='own' and ({'light','dark'})[vim.fn.rand()%2+1] or 'dark'
    if pcall(vim.cmd.colorscheme,v) and vim.g.colors_name==v then break end
end
