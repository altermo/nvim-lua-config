vim.cmd.iabbrev'<buffer> vpp vim.pprint'
vim.cmd.iabbrev'<buffer> vl vim.lg'
vim.keymap.set('i','ł','local ',{buffer=true})
vim.keymap.set('i','đ','function ',{buffer=true})
vim.keymap.set('i','®','return ',{buffer=true})
vim.keymap.set('i','þ','then return end',{buffer=true})
vim.keymap.set('i','„','vim.',{buffer=true})
vim.keymap.set('i','„f','vim.fn.',{buffer=true})
vim.keymap.set('i','„a','vim.api.nvim_',{buffer=true})
vim.keymap.set('i','„k','vim.keymap.set',{buffer=true})
vim.keymap.set('i','M','M.',{buffer=true})
vim.keymap.set('i','…','M.',{buffer=true})
