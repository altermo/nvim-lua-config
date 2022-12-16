require'yanky'.setup{}
local k=require'utils.keymap'
k.nno('p','<Plug>(YankyPutAfter)')
k.nno('P','<Plug>(YankyPutBefore)')
k.xno('p','<Plug>(YankyPutAfter)')
k.xno('P','<Plug>(YankyPutBefore)')
k.nno('<A-p>','<Plug>(YankyCycleForward)')
k.nno('<A-P>','<Plug>(YankyCycleBackward)')
k.nno('<C-p>',':wshada\r')
k.nno('<C-n>',':rshada\r')
