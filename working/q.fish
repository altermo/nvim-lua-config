cd ua.nvim
#nvim +"lua dofile('init.lua').setup()" +"set ft=lua" +"call feedkeys('ccprint(\"i&')" a.lua -u NONE
nvim +"lua dofile('ua/init.lua').setup()" a.md
