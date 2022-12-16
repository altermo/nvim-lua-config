set guifont=Source\ Code\ Pro:h11
if exists(':GuiTabline') && exists(':GuiPopupmenu')
  GuiTabline 0
  GuiPopupmenu 0
  GuiWindowOpacity 0.9
  GuiFont! Source Code Pro:h11
endif
cnoremap <C-S-V> <C-r>+
nnoremap <silent><C-+> <cmd>execute "GuiFont! Source Code Pro:h" . (matchstr(&guifont, '\d\+$')+1)<CR>
nnoremap <silent><C--> <cmd>execute "GuiFont! Source Code Pro:h" . (matchstr(&guifont, '\d\+$')-1)<CR>
nnoremap <silent><C-S-?> <cmd>execute "GuiFont! Source Code Pro:h" . (matchstr(&guifont, '\d\+$')+5)<CR>
nnoremap <silent><C-S-_> <cmd>execute "GuiFont! Source Code Pro:h" . (matchstr(&guifont, '\d\+$')-5)<CR>
nnoremap <silent><C-0> <cmd>execute "GuiFont! Source Code Pro:h11"<CR>
nnoremap <silent><F11> <cmd>call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<CR>
tnoremap <silent><C-+> <cmd>execute "GuiFont! Source Code Pro:h" . (matchstr(&guifont, '\d\+$')+1)<CR>
tnoremap <silent><C--> <cmd>execute "GuiFont! Source Code Pro:h" . (matchstr(&guifont, '\d\+$')-1)<CR>
tnoremap <silent><C-S-?> <cmd>execute "GuiFont! Source Code Pro:h" . (matchstr(&guifont, '\d\+$')+5)<CR>
tnoremap <silent><C-S-_> <cmd>execute "GuiFont! Source Code Pro:h" . (matchstr(&guifont, '\d\+$')-5)<CR>
tnoremap <silent><C-0> <cmd>execute "GuiFont! Source Code Pro:h11"<CR>
tnoremap <silent><F11> <cmd>call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<CR>
tnoremap <silent><F12> <cmd>call feedkeys(readfile('/home/user/.config/token.txt')[input('>')])<cr>
