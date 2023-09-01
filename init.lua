vim.loader.enable()

require'plugins'
require'utils.empty'
require'options'
require'keymaps'
require'abbrevs-commands'
require'autocmds'
require'other'
pcall(vim.cmd.colorscheme,'own')
if vim.g.colors_name~='own' then
    vim.o.background='dark'
    pcall(vim.cmd.colorscheme,'tokyonight')
    if vim.g.colors_name~='tokyonight' then
        vim.cmd.colorscheme'retrobox'
    end
end
