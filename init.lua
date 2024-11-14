vim.loader.enable()
jit.off() --The following run faster with jit off
require'options'
require'other'
jit.on()
require'autocmds'
require'lazyload' -- lazy loads plugins.lua and keymaps.lua
