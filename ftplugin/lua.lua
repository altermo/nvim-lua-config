vim.cmd.iabbrev'<buffer> re return'
vim.cmd.iabbrev'<buffer> tre then return end'
vim.cmd.iabbrev'<buffer> l local'
vim.cmd.iabbrev'<buffer> fu function'
vim.cmd.iabbrev'<buffer> fum function M'
vim.cmd.iabbrev'<buffer> vpp vim.pprint'
vim.cmd.iabbrev'<buffer> vpt vim.traceback'
vim.cmd.iabbrev'<buffer> vl vim.lg'
vim.keymap.set('i','…','M.',{buffer=true})
vim.keymap.set('i','→→','local M={}\n\nreturn M',{buffer=true})
