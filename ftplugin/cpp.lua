vim.cmd'iabbrev <buffer> str std'
vim.keymap.set('i',':','::',{buffer=true})
vim.keymap.set('i','…','std::',{buffer=true})
vim.keymap.set('i','/','//',{buffer=true})
