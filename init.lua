if os.date('*t').hour>14 and vim.fn.input('')~='OPEN' then vim.cmd.qa{bang=true} return end
vim.loader.enable()
jit.off() --The following run faster with jit off
require'options'
require'other'
jit.on()
require'keymaps' --lazy loads spacekey.lua
require'autocmds'
require'lazyload' --lazy loads plugins.lua which lazy loads lsp.lua
