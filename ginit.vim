if exists(':GuiTabline') && exists(':GuiPopupmenu')
  GuiTabline 0
  GuiPopupmenu 0
  GuiFont! Inconsolata:h11
  GuiWindowOpacity 0.9
endif
cnoremap <C-S-V> <C-r>+
nnoremap <silent><C-+> :execute "GuiFont! Inconsolata:h" . (matchstr(&guifont, '\d\+$')+1)<CR>
nnoremap <silent><C--> :execute "GuiFont! Inconsolata:h" . (matchstr(&guifont, '\d\+$')-1)<CR>
nnoremap <silent><C-0> :execute "GuiFont! Inconsolata:h11"<CR>
nnoremap <silent><F11> :call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")
tnoremap <silent><C-+> <cmd>execute "GuiFont! Inconsolata:h" . (matchstr(&guifont, '\d\+$')+1)
tnoremap <silent><C--> <cmd>execute "GuiFont! Inconsolata:h" . (matchstr(&guifont, '\d\+$')-1)
tnoremap <silent><C-0> <cmd>execute "GuiFont! Inconsolata:h11"
tnoremap <silent><F11> :call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")
tnoremap <silent><F12> <cmd>call feedkeys(readfile('/home/user/.config/token.txt')[input('>')])<cr>
