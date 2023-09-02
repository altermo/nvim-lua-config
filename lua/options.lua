vim.o.shiftwidth=4
vim.o.tabstop=4
vim.o.softtabstop=4
vim.o.smartindent=true
vim.o.breakindent=true
vim.o.cindent=true
vim.o.expandtab=true
vim.o.linebreak=true
vim.o.fillchars='vert: ,eob: '
vim.o.foldmethod='expr'
function _G.Fold(lnum) return vim.fn.getline(lnum)=="" and '0' or '1' end
vim.o.foldexpr='v:lua._G.Fold(v:lnum)'
vim.o.foldenable=false
vim.o.relativenumber=true
vim.o.number=true
vim.o.numberwidth=2
vim.o.splitbelow=true
vim.o.splitright=true
vim.o.showbreak='↳ '
vim.o.list=true
vim.o.ignorecase=true
vim.o.smartcase=true
--if tonumber(os.date('%H'))<8 or tonumber(os.date('%H'))>=16 then
    --vim.o.background='dark'
--else
    --vim.o.background='light'
--end
vim.o.background=({'light','dark'})[vim.fn.rand()%2+1]
vim.o.termguicolors=true
vim.o.colorcolumn='1,41,81,121,161,201,241'
vim.o.cursorline=true
vim.o.undofile=true
vim.o.swapfile=false
vim.o.synmaxcol=1000
vim.o.pumblend=20
vim.o.history=1000
vim.o.scrolloff=5
vim.o.winminheight=0
vim.o.winminwidth=0
vim.o.textwidth=0
vim.o.timeoutlen=500
vim.o.spelllang='en'
vim.o.shortmess='aToOAFW'
vim.o.completeopt='menu,menuone,noselect'
vim.o.virtualedit='block,onemore'
vim.o.nrformats='bin,hex,alpha,unsigned'
vim.opt.path:append('**')
vim.o.lazyredraw=true
vim.o.showmode=false
vim.o.modelineexpr=true
vim.o.foldcolumn='0'
vim.o.statuscolumn="%{&foldenable?(get([' ','▎','▍','▌','▋','▊','▉','█','▐'],foldlevel(v:lnum),'|')):''}%C%s%{&nu?v:virtnum>0?'':v:relnum?&rnu?v:relnum:v:lnum:v:lnum:v:virtnum>0?'':&rnu?v:relnum:''}"
--TODO: add gitsigns as faint highlight https://github.com/lewis6991/gitsigns.nvim
vim.o.shell='/bin/fish'
vim.o.smoothscroll=true
vim.o.shada="'100,/5,:500,<50,@0,s10"
vim.o.conceallevel=2
