vim.cmd.iabbrev'<buffer> re return'
vim.cmd.iabbrev'<buffer> tre then return end'
vim.cmd.iabbrev'<buffer> l local'
vim.cmd.iabbrev'<buffer> fu function'
vim.cmd.iabbrev'<buffer> fum function M'
vim.cmd.iabbrev'<buffer> vpp vim.pprint'
vim.cmd.iabbrev'<buffer> vpt vim.traceback'
vim.cmd.iabbrev'<buffer> vl vim.lg'
vim.keymap.set('i','……','vim.',{buffer=true})
vim.keymap.set('i','…f','vim.fn.',{buffer=true})
vim.keymap.set('i','…a','vim.api.nvim_',{buffer=true})
vim.keymap.set('i','…k','vim.keymap.set',{buffer=true})
vim.keymap.set('i','–','M.',{buffer=true})
vim.keymap.set('i','ł→','local M={}\n\nreturn M',{buffer=true})
vim.keymap.set('i','łþ',[[
local function t1()

end
local function t2()

end
local rep=100
local t=os.clock()
for _=1,rep do t1() end
print(os.clock()-t)
t=os.clock()
for _=1,rep do t2() end
print(os.clock()-t)

]],{buffer=true})
vim.keymap.set('i','łß',[[
local M={}
function M.setup()

end
return M
]],{buffer=true})
