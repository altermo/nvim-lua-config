if vim.fn.filereadable('/tmp/focus')==1 then vim.cmd.quit() end
vim.loader.enable()
require'utils.empty'
vim.api.nvim_create_autocmd('VimEnter',{callback=function ()
    require'keymaps'
end})
require'autocmds'
require'other'
require'options'
require'plugins'
for _,v in ipairs{'own','tokyonight','retrobox'} do
    vim.o.background=v=='own' and ({'light','dark'})[vim.fn.rand()%2+1] or 'dark'
    if pcall(vim.cmd.colorscheme,v) and vim.g.colors_name==v then break end
end
