if exists(':GuiTabline') && exists(':GuiPopupmenu')
  GuiTabline 0
  GuiPopupmenu 0
  GuiWindowOpacity 0.9
  GuiRenderLigatures 0
  GuiLine
  GuiLinespace -2
  lua vim.cmd.GuiFont{'Fira Code:h13',bang=true}
else
  lua vim.o.guifont='Fira Code:h13'
endif
nnoremap <silent><F11> <cmd>call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<CR>
nnoremap <silent><C-+> <cmd>lua vim.o.guifont=vim.fn.substitute(vim.o.guifont,[[\vh(\d+)]],'\\="h".(submatch(1)+1)','')<CR>
nnoremap <silent><C--> <cmd>lua vim.o.guifont=vim.fn.substitute(vim.o.guifont,[[\vh(\d+)]],'\\="h".(submatch(1)-1)','')<CR>
nnoremap <silent><C-0> <cmd>lua vim.o.guifont=vim.fn.substitute(vim.o.guifont,[[\vh(\d+)]],'h11','')<CR>
tnoremap <silent><F11> <cmd>call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<CR>
tnoremap <silent><C-+> <cmd>lua vim.o.guifont=vim.fn.substitute(vim.o.guifont,[[\vh(\d+)]],'\\="h".(submatch(1)+1)','')<CR>
tnoremap <silent><C--> <cmd>lua vim.o.guifont=vim.fn.substitute(vim.o.guifont,[[\vh(\d+)]],'\\="h".(submatch(1)-1)','')<CR>
tnoremap <silent><C-0> <cmd>lua vim.o.guifont=vim.fn.substitute(vim.o.guifont,[[\vh(\d+)]],'h11','')<CR>
