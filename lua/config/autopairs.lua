local npairs=require'nvim-autopairs'
local ino=require'utils.keymap'.ino
npairs.setup{fast_wrap={chars={'{','[','(','"',"'",'`'}}}
vim.api.nvim_create_autocmd("BufDelete",{once=true,command="doautocmd BufEnter"}) --HACK
ino('<C-j>','v:lua.MPairs.completion_confirm()',{noremap=true,expr=true})
