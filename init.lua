if vim.uv.fs_stat('/tmp/focus') and vim.fn.input('>')~='IMPORTANT' then vim.cmd.quit() end
vim.loader.enable()
require'keymaps' --500/1000ms
require'autocmds' --200/1000ms
require'options' --250/1000ms
require'other' --110/1000ms
require'plugins' --n/a
vim.cmd.colorscheme'catppuccin-frappe'
