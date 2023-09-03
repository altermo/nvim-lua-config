vim.loader.enable()

require'utils.empty'
require'options'
require'keymaps'
require'abbr-commands'
require'autocmds'
require'other'
require'plugins'
pcall(vim.cmd.colorscheme,'own')
if vim.g.colors_name~='own' then
    vim.o.background='dark'
    pcall(vim.cmd.colorscheme,'tokyonight')
    if vim.g.colors_name~='tokyonight' then
        vim.cmd.colorscheme'retrobox'
    end
end
