if vim.fn.filereadable('/tmp/focus')==1 then vim.cmd.quit() end
vim.loader.enable()
require'utils.empty'
require'options'
require'keymaps'
require'acommands'
require'autocmds'
require'other'
require'plugins'
if not pcall(vim.cmd.colorscheme,'own') or vim.g.colors_name~='own' then
    vim.o.background='dark'
    if not pcall(vim.cmd.colorscheme,'tokyonight') then
        vim.cmd.colorscheme'retrobox'
    end
end
