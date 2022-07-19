require'yanky'.setup{}
vim.keymap.set('n','p','<Plug>(YankyPutAfter)')
vim.keymap.set('n','P','<Plug>(YankyPutBefore)')
vim.keymap.set('x','p','<Plug>(YankyPutAfter)')
vim.keymap.set('x','P','<Plug>(YankyPutBefore)')
vim.keymap.set('n','<A-p>','<Plug>(YankyCycleForward)')
vim.keymap.set('n','<A-P>','<Plug>(YankyCycleBackward)')
vim.keymap.set('n','<C-p>',':wshada\r')
vim.keymap.set('n','<C-n>',':rshada\r')
require'telescope'.load_extension'yank_history'
