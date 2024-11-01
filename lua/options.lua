---indent
vim.o.tabstop=4
vim.o.shiftwidth=0
vim.o.smartindent=true
vim.o.cindent=true
vim.o.expandtab=true
vim.o.indentexpr='v.lua:require"nvim-treesitter".indentexpr()'
---warp
vim.o.linebreak=true
vim.o.showbreak='↳ '
vim.o.breakindent=true
---fold
vim.o.foldmethod='expr'
vim.o.foldenable=false
---statuscolumn
---- https://github.com/neovim/neovim/issues/21342#issuecomment-1344280934
---window/split
vim.o.splitbelow=true
vim.o.splitright=true
vim.o.winminheight=0
vim.o.winminwidth=0
---visual
vim.o.fillchars='vert: ,eob: ,horiz: ,horizup: ,horizdown: ,vertleft: ,vertright: ,verthoriz: '
vim.o.list=true
vim.o.cursorline=true
vim.o.showmode=false
vim.o.statusline=' '
vim.o.conceallevel=2
vim.o.pumblend=20
---search
vim.o.ignorecase=true
vim.o.smartcase=true
---data
vim.o.undofile=true
vim.o.swapfile=false
vim.o.shada="'200,/9,:50,<50,@9,s10"
---other
vim.o.scrolloff=5
vim.o.timeoutlen=500
vim.o.spelloptions='camel'
vim.o.shortmess='asoOAFWI'
vim.o.virtualedit='block,onemore'
vim.o.smoothscroll=true
vim.o.mouse='a'
vim.o.concealcursor='nc'
vim.o.guifont='Fira Code:h12'
