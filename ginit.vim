set guifont=Source\ Code\ Pro:h11
if exists(':GuiTabline') && exists(':GuiPopupmenu')
  GuiTabline 0
  GuiPopupmenu 0
  GuiWindowOpacity 0.9
  nnoremap <silent><F11> <cmd>call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<CR>
  tnoremap <silent><F11> <cmd>call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<CR>
  lua vim.cmd.GuiFont{'Source Code Pro:h11',bang=true}
elseif exists("g:neovide")
  lua vim.o.guifont='Fira Code:h9'
  "lua vim.o.guifont='Fira Code:h16'
  set linespace=-1
  let g:neovide_scale_factor=0.7
  let g:neovide_transparency=0.9 "TODO: set global transparency
  let g:neovide_refresh_rate=20
  let g:neovide_refresh_rate_idle=10
  let g:neovide_cursor_animation_length=0
  let g:neovide_hide_mouse_when_typing=v:true

  nnoremap <silent><F11> <cmd>let g:neovide_fullscreen=!g:neovide_fullscreen<CR>
  tnoremap <silent><F11> <cmd>let g:neovide_fullscreen=!g:neovide_fullscreen<CR>
endif
cnoremap <C-S-V> <C-r>+
nnoremap <silent><C-+> <cmd>lua vim.o.guifont=vim.fn.substitute(vim.o.guifont,[[\vh(\d+)]],'\\="h".(submatch(1)+1)','')<CR>
nnoremap <silent><C--> <cmd>lua vim.o.guifont=vim.fn.substitute(vim.o.guifont,[[\vh(\d+)]],'\\="h".(submatch(1)-1)','')<CR>
nnoremap <silent><C-?> <cmd>lua vim.o.guifont=vim.fn.substitute(vim.o.guifont,[[\vh(\d+)]],'\\="h".(submatch(1)+5)','')<CR>
nnoremap <silent><C-_> <cmd>lua vim.o.guifont=vim.fn.substitute(vim.o.guifont,[[\vh(\d+)]],'\\="h".(submatch(1)-5)','')<CR>
nnoremap <silent><C-0> <cmd>lua vim.o.guifont=vim.fn.substitute(vim.o.guifont,[[\vh(\d+)]],'h11','')<CR>
tnoremap <silent><C-+> <cmd>lua vim.o.guifont=vim.fn.substitute(vim.o.guifont,[[\vh(\d+)]],'\\="h".(submatch(1)+1)','')<CR>
tnoremap <silent><C--> <cmd>lua vim.o.guifont=vim.fn.substitute(vim.o.guifont,[[\vh(\d+)]],'\\="h".(submatch(1)-1)','')<CR>
tnoremap <silent><C-?> <cmd>lua vim.o.guifont=vim.fn.substitute(vim.o.guifont,[[\vh(\d+)]],'\\="h".(submatch(1)+5)','')<CR>
tnoremap <silent><C-_> <cmd>lua vim.o.guifont=vim.fn.substitute(vim.o.guifont,[[\vh(\d+)]],'\\="h".(submatch(1)-5)','')<CR>
tnoremap <silent><C-0> <cmd>lua vim.o.guifont=vim.fn.substitute(vim.o.guifont,[[\vh(\d+)]],'h11','')<CR>
tnoremap <silent><F12> <cmd>call feedkeys(readfile('/home/user/.config/token.txt')[input('>')])<cr>
