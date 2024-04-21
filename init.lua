vim.loader.enable()
require'keymaps'
require'autocmds'
require'options'
require'other'
require'plugins'
vim.cmd.colorscheme'catppuccin-frappe'

if vim.fn.filereadable(vim.fn.stdpath'config'..'/testing.lua') then
    dofile(vim.fn.stdpath'config'..'/testing.lua')
end
