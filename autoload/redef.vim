"if line("'\"")>1&&line("'\"")<=line("$")
"  exe "normal! g`\""
"endif

let filename=expand("%:p")
if filename=="/home/user/.config/fish/config.fish"
  setl foldenable
endif
if filename=="/home/user/.config/nvim/init.lua"
  setl foldenable
  setl foldexpr=v:lua.FoldL(v:lnum) "TODO
endif
if filename=="/home/user/.config/nvim/coc-settings.json"
  setl shiftwidth=2
endif
if &filetype==""
  setl ft=text
endif
