---indent
vim.o.tabstop=4
vim.o.shiftwidth=0
vim.o.smartindent=true
vim.o.breakindent=true
vim.o.cindent=true
vim.o.expandtab=true
---warp
vim.o.linebreak=true
vim.o.showbreak='↳ '
---fold
vim.o.foldcolumn='0'
vim.o.foldmethod='expr'
vim.wo.foldexpr='getline(v:lnum)==""?0:1'
vim.o.foldenable=false
---statuscolumn
---- https://github.com/neovim/neovim/issues/21342#issuecomment-1344280934
--vim.o.relativenumber=true
--vim.o.number=true
--vim.o.statuscolumn="%{&foldenable?(get([' ','▎','▍','▌','▋','▊','▉','█','▐'],foldlevel(v:lnum),'|')):''}%C%s%{&nu?v:virtnum>0?'':v:relnum?&rnu?v:relnum:v:lnum:v:lnum:v:virtnum>0?'':&rnu?v:relnum:''}"
--vim.o.numberwidth=2
--TODO: add gitsigns as faint highlight https://github.com/lewis6991/gitsigns.nvim
---window/split
vim.o.splitbelow=true
vim.o.splitright=true
vim.o.winminheight=0
vim.o.winminwidth=0
---visual
vim.o.fillchars='vert: ,eob: ,horiz: ,horizup: ,horizdown: ,vertleft: ,vertright: ,verthoriz: '
vim.o.list=true
vim.o.background=({'light','dark'})[vim.fn.rand()%2+1]
vim.o.termguicolors=true
vim.o.colorcolumn='1,41,81,121,161,201,241'
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
vim.o.history=1000
vim.o.shada="'100,/5,:500,<50,@0,s10"
---other
vim.o.scrolloff=5
vim.o.timeoutlen=500
vim.o.spelllang='en'
vim.o.spelloptions='camel'
vim.o.shortmess='asoOAFWqI'
vim.o.completeopt='menu,menuone,noselect'
vim.o.virtualedit='block,onemore'
vim.o.nrformats='bin,hex,alpha,unsigned'
vim.opt.path:append('**')
vim.o.lazyredraw=true
vim.o.shell='/bin/fish'
vim.o.smoothscroll=true
vim.o.mouse='a'
vim.o.concealcursor='nc'
