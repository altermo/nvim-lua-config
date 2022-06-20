----predefs (...)
require('impatient')
----predefs (functions)
local function map(kind,key,maps,opts)
  vim.keymap.set(kind,key,maps,opts)
end
local function nno(key,maps)
  map('n',key,maps,{noremap=true,silent=true})
end
local function lnno(key,maps)
  map('n',key,maps,{noremap=true})
end
local function lvno(key,maps)
  map('v',key,maps,{noremap=true})
end
local function vno(key,maps)
  map('v',key,maps,{noremap=true,silent=true})
end
local function ino(key,maps)
  map('i',key,maps,{noremap=true,silent=true})
end
local function tno(key,maps)
  map('t',key,maps,{noremap=true,silent=true})
end
local function cabbr(key,maps)
  vim.cmd('cabbrev '..key..' '..maps)
end
local function command(cmd,bin,opt)
  vim.api.nvim_create_user_command(cmd,bin,opt or {})
end
local function get_config(name)
  return string.format('require("config.%s")', name)
end
local function get_setup(name,conf)
  return string.format('require"%s".setup%s',name,vim.inspect(conf or {}))
end
local function autocmd(au,opt)
    vim.api.nvim_create_autocmd(au,opt)
end
local fn=vim.fn
----postdefs (function)
function Norm()
  ino('<left>','<left>')
  ino('<right>','<right>')
  ino('<up>','<C-o>l')
  ino('<down>','<C-o>k')
  vim.o.mouse='a'
end
function Build(term)
  for ftype,cmd in pairs({fish='fish',lua='lua',python='python3.10'}) do
    if vim.o.filetype==ftype then
      vim.cmd('write')
      if term then
        vim.cmd('vnew|call termopen("time '..cmd..' \'".expand("#")."\'")|startinsert')
      else
        vim.cmd('AsyncRun time '..cmd..' "%"')
      end
      return
  end end
  vim.notify("Builderror: filetype"..vim.o.filetype.."has no builder or can not be built")
end
function SW()
  for from,to in pairs({t='ett',
      n='en',['ä']='är',p='på',o='och',
      a='att',ti='till',s='som',d='de',
      ['do']='dem',gt='det',gn='den',i='inte',
    }) do
    vim.cmd('iabbrev '..from..' '..to)
    vim.cmd('iabbrev '..(from:gsub("^%l",string.upper))..' '..(to:gsub("^%l",string.upper)))
end end
function Toggle(opt)
  vim.cmd('set '..opt..'!|echo "'..opt..'=" &'..opt)
end
function Fold(lnum)
  return fn.getline(lnum)=="" and '0' or '1'
end
function FoldL(lnum)
  local line=fn.getline(lnum)
  local find=string.find
  if line=='' then return '0' end
  if find(line,'^%-%-%-%-%-%-') then return '2' end
  if find(line,'^%-%-%-%-') then return '1' end
  if lnum==1 then return '0' end
  local pline=fn.getline(lnum-1)
  if pline=='' then return '1' end
  if find(pline,'^%-%-%-%-%-%-') then return '3' end
  if find(pline,'^%-%-%-%-') then return '2' end
  return '='
end
function TermAppRun(bin,mouse)
  vim.cmd('enew')
  local JobArgs={}
  local buf=fn.bufnr()
  function JobArgs.on_exit(_,_,_)
    vim.cmd('bdelete! '..buf)
  end
  fn.termopen((mouse and "printf '\\e[?1000h';" or "")..bin,JobArgs)
  vim.cmd('startinsert')
end

----maps
----map
map('n','\'','`',{})
map('v','\r','d',{})
map('n','\r','dd',{})
----nno
------other
nno('|','~')
nno(',','<C-o>')
nno(';','<C-i>')
lnno('.',':')
nno('<BS>',':call smoothie#do("zz")\r')
nno('ø',':redo\r')
nno('æ','z=')
nno('å','"+p')
nno('mw','lb"ade"bxe"bp"apbb')
nno('j','gj')
nno('k','gk')
for k,v in pairs({h='vertical resize -',j='resize +',k='resize -',l='vertical resize +'}) do
  nno('<C-'..k..'>','<C-w>'..k)
  nno('<C-S-'..k..'>','<C-w>'..k:upper())
  nno('<A-'..k..'>',':'..v..'2\r')
end
nno('<A-=>','<C-w>=')
nno('\t','<C-w>w')
nno('<F5>',':lua Build()\r')
nno('gc',':let a=@/|s/^/<C-r>c/|silent! s/^<C-r>c<C-r>c//|let @/=a\r') --TODO
nno('L','gt')
nno('H','gT')
for i=0,9 do
    nno('\\f'..i,':set foldlevel='..i..'\r')
end
nno('zl','zL')
nno('zh','zH')
------alt-gr
nno('ª','[s')                         --alt_gr-a
nno('º',']s')                         --alt_gr-A
nno('π','yyp')                        --alt_gr-p
nno('Π','yyP')                        --alt_gr-P
nno('“',':lua Build()\r')             --alt_gr-b
nno('‘',':lua Build(1)\r')            --alt_gr-B
nno('ſ',':echo wordcount()\r')        --alt_gr-w
nno('←',':let @+=@"\r')               --alt_gr-y
lnno('đ',':%s///g<Left><Left><Left>') --alt_gr-f
nno('ð',':move +1\r')                 --alt_gr-d
nno('↓',':move -2\r')                 --alt_gr-u
----ino
ino('ø','ö')
ino('æ','ä')
ino('Ø','Ö')
ino('Æ','Ä')
for i in ('hjklwb'):gmatch('.') do
  ino('<A-'..i..'>','<C-o>'..i)
end
ino('ß','()<Left>') --alt_gr-s
ino('€','=')        --alt_gr-e
ino('<C-w>','<C-o><C-w>')
ino('¨','<esc>')
ino('ſ','<Right>')
ino('¦','<Left>')
--TODO more ctrl...
----vno
vno('å','"+y')
lvno('Ø',':sort')
vno('<','<gv')
vno('>','>gv')
vno('ſ','<cmd>w !wc\r')              --alt_gr-w
vno('ð',':move \'>+1\rgv')           --alt_gr-d
vno('↓',':move \'<-2\rgv')           --alt_gr-u
vno('J',':move \'>+1\rgv')
vno('K',':move \'<-2\rgv')
lvno('đ',':s/\\%V//g<Left><Left><Left>') --alt_gr-f
lvno('.',':')
vno('k','gk')
vno('j','gj')
vno('gc',':<C-u>let a=@/|\'<,\'>s/^/<C-r>c/|silent! \'<,\'>s/^<C-r>c<C-r>c//|let @/=a\rgv')
vno(' ','<cmd>HopLine\r')
------add-parenteses
for _,i in pairs({'()','{}','[]','""',"''",'``','<>'}) do
  local b,e=i:gmatch('.')(),i:gmatch('.(.)')()
  vno('&'..b,'<esc>`>a'..e..'<esc>`<i'..b..'<esc>')
  vno('&'..e,'<esc>`>a'..e..'<esc>`<i'..b..'<esc>')
end
vno('&?','<esc>`>a?<esc>`<i¿<esc>')
vno('&!','<esc>`>a!<esc>`<i¡<esc>')
----tno
tno('<C-\\>','<C-\\><C-n>')
for i in ('hjkl'):gmatch('.') do
  tno('<C-'..i..'>','<C-\\><C-n><C-w>'..i)
end
----no keys
for _,i in pairs({'<left>','<right>','<up>','<down>'}) do
  nno(i,'<nop>')
  ino(i,'<nop>')
  vno(i,'<nop>')
end
nno('ZZ','<nop>')
nno('ZQ','<nop>')
----may-be remapt
nno('Å','"+')
nno('-','_')
vno('-','_')
nno('+','$')
vno('+','$')
nno('?','?')
nno('&','n')
nno('#','n')
lnno('!',':!')
lnno('Ø',':sort')
nno('vv','V')
------leader
nno('\\ew',':exec("e "..fnameescape(expand("%:h"))."/") \r')
nno('\\es',':exec("sp "..fnameescape(expand("%:h"))."/") \r')
nno('\\ev',':exec("vsp "..fnameescape(expand("%:h"))."/") \r')
nno('\\et',':exec("tabe "..fnameescape(expand("%:h"))."/") \r')
nno('\\ff','[I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"\r')
nno('\\q','gwip')

----abbrev/commands
----cabbrev
cabbr('W','w')
cabbr('Q','q')
cabbr('WQ','wq')
cabbr('Wq','wq')
cabbr('qw','wq')
cabbr('cd.','lcd %:p:h')
----commands
command('Fish','lua TermAppRun(\'fish <args>\')',{nargs='*'})
command('Emacs','lua TermAppRun("emacsclient -nw -c -a \'emcas -nw\' <args>")',{nargs='*'})
command('Kak','lua TermAppRun(\'kak <args>\')',{nargs='*'})
command('Resource','source /home/user/.config/nvim/init.lua')
command('BD',[[command! -bang -nargs=1 BD execute 'bd<bang> ' . join(map(split(execute('filter /<args>/ ls'), "\n"), 'str2nr(v:val)'))]],{nargs=1,bang=true})

----options
local set=vim.o
set.scrolloff=5
set.winminheight=0
set.foldcolumn='2'
set.spelllang='sv'
--set.mouse='a'
set.foldmethod='expr'
set.background='dark'
set.foldexpr='v:lua.Fold(v:lnum)'
set.showbreak='↳ '
set.fillchars='vert: '
set.colorcolumn='1,41,81,121,161,201,241'
set.shortmess='aToOAFW'
set.completeopt='menu,menuone,noselect'
set.splitbelow=true
set.splitright=true
set.smartindent=true
set.linebreak=true
set.lazyredraw=true
set.breakindent=true
set.undofile=true
set.list=true
set.relativenumber=true
set.number=true
set.expandtab=true
set.ignorecase=true
set.smartcase=true
set.showmode=false
set.cursorline=true
set.foldenable=false
set.modelineexpr=true
set.termguicolors=true

----packer
require('packer').startup(function(use)
------test
use 'lewis6991/impatient.nvim' --note
use{'glacambre/firenvim',run=function() vim.fn['firenvim#install'](0) end}
use{'0styx0/abbreinder.nvim',requires='0styx0/abbremand.nvim',config=get_setup"abbreinder"}
use{'monkoose/matchparen.nvim',config=get_setup"matchparen"}
use{"mtoohey31/cmp-fish",ft="fish" }
use 'quangnguyen30192/cmp-nvim-tags'
use 'ray-x/cmp-treesitter'
use {'nvim-orgmode/orgmode', config=get_setup"orgmode"}
use 'benfowler/telescope-luasnip.nvim'
use "nvim-telescope/telescope-file-browser.nvim"
use{'kosayoda/nvim-lightbulb', requires = 'antoinemadec/FixCursorHold.nvim'}--TODO
vim.cmd[[autocmd CursorHold,CursorHoldI * lua require('nvim-lightbulb').update_lightbulb()]]
use "tversteeg/registers.nvim"
use{'folke/which-key.nvim',config=get_setup"which-key"}
use 'arp242/jumpy.vim'
--use 'nvim-treesitter/nvim-treesitter-textobjects' --TODO=speed test VS alternetive
--use 'nvim-treesitter/nvim-treesitter-refactor'    --TODO=speed test VS alternetive
--use{'glepnir/indent-guides.nvim',config='require("indent_guides").setup()'} --TODO
use 'nvim-telescope/telescope-symbols.nvim'
--------colorschem
use 'mhartington/oceanic-next' --14
use 'ghifarit53/tokyonight-vim' --11
use 'rafamadriz/neon' --8
use 'fenetikm/falcon' --8
use 'rmehri01/onenord.nvim' --8
use 'shaunsingh/nord.nvim' --8
use 'NTBBloodbath/doom-one.nvim' --7.4
use 'wittyjudge/gruvbox-material.nvim' --7
use 'yong1le/darkplus.nvim' --6.5
use 'vim-conf-live/vimconflive2021-colorscheme' --6
use 'AlessandroYorba/Despacio' --6
use 'nightsense/cosmic_latte' --5
use 'luisiacc/gruvbox-baby' --4.3
use 'ellisonleao/gruvbox.nvim' --3.7
use 'edeneast/nightfox.nvim' --2.6
use 'yuttie/hydrangea-vim' --1.5
use{'mjlbach/onedark.nvim',config='vim.cmd("colorschem onedark")'} --1.3
--------visual
use{'p00f/nvim-ts-rainbow',requires={'nvim-treesitter/nvim-treesitter'}} --id=rainbow
use{'nvim-lualine/lualine.nvim',config=get_setup("lualine",{options={theme="powerline"}})} --id=statusline
use{'norcalli/nvim-colorizer.lua',config=get_setup("colorizer",{"*"})} --id=sccolor
use 'itchyny/vim-cursorword'
use 'ntpeters/vim-better-whitespace'
use 'psliwka/vim-smoothie'
use 'wellle/context.vim'
use{'beauwilliams/focus.nvim',config=get_setup("focus",{autoresize=false})}
use{'wfxr/minimap.vim',run=':!cargo install --locked code-minimap',cmd='MinimapToggle'}
use 'onsails/lspkind.nvim' --note
--------syntax
use{'nvim-neorg/neorg',config=get_setup(
'neorg',{load={
    ["core.defaults"]={},
    ['core.export']={},
    ['core.export.markdown']={},
    ['core.norg.concealer']={},
}})} --TODO
use 'neovim/nvim-lspconfig' --TODO --note
use{'nvim-treesitter/nvim-treesitter',run='vim.cmd"TSUpdate"',requires={'nvim-lua/plenary.nvim'}} --syntax
--------keys
use 'tpope/vim-surround' --id=surround
use{'s1n7ax/nvim-lazy-inner-block',config=get_setup"nvim-lazy-inner-block"}--id=normal
use 'tommcdo/vim-lion' --id=align
use 'bfredl/nvim-miniyank'
use{'windwp/nvim-autopairs',config=get_setup("nvim-autopairs",{map_cr=false})}--id=autoper
use{'s1n7ax/nvim-terminal',config=get_setup"nvim-terminal"} --id=term
use{'tpope/vim-speeddating',keys={{'n','<C-a>'},{'n','<C-x>'},{'n','d<C-a>'},{'n','d<C-x>'},{'x','<C-a>'},{'x','<C-x>'},}}
use 'wellle/targets.vim'
use 'wesQ3/vim-windowswap'
use 'michaeljsmith/vim-indent-object'
--------movement
use{'phaazon/hop.nvim',config=get_setup"hop"}--id=anyhop
use 'rhysd/clever-f.vim'
------command
use{'kyazdani42/nvim-tree.lua',config=get_config('nvimtree'),cmd='NvimTreeToggle'} --id=tree
use{'rbgrouleff/bclose.vim',cmd='Bclose',keys='<leader>bd'} --id=buffers
use{'Asheq/close-buffers.vim',cmd={'Bdelete','Bwipeout'}} --id=buffers
use{'nvim-telescope/telescope.nvim',cmd='Telescope'}   --command       --id=FZF
use 'tpope/vim-eunuch'                 --command       --id=normal
use{'mbbill/undotree',cmd='UndotreeToggle'}                 --command       --id=undotree
use{'majutsushi/tagbar',cmd='TagbarToggle'}                  --command       --id=tagbar
use{'nvim-treesitter/playground',requires={'nvim-lua/popup.nvim'}}      --command       --r=(nvim-treesitter/nvim-treesitter)
use 'wellle/visual-split.vim'          --command
--use{'liuchengxu/vim-which-key',config=get_config('whichkey_space-maps')}        --command
use 'voldikss/vim-translator'          --command
use{'dhruvasagar/vim-table-mode',cmd='TableModeToggle'}      --command
use{'romainl/vim-qf',keys='<Plug>(qf_qf_toggle_stay)'}        --command
use{'skywind3000/asyncrun.vim',cmd={'AsyncRun','AsyncStop'}} --command
use{'vim-scripts/CycleColor',cmd={'CycleColorNext','CycleColorPrev','CycleColorRefresh'}}          --command
use{'sindrets/winshift.nvim',config=get_setup("winshift")}          --command
use 'elihunter173/dirbuf.nvim'         --command     --TODO
use 'williamboman/nvim-lsp-installer'  --command
--------other
use{'glepnir/dashboard-nvim',config=get_config('dashboard')}          --other         --id=startpage
use{'metakirby5/codi.vim',cmd={'Codi','CodiNew','CodiExpand','CodiSelect','CodiUpdate'}}             --other         --id=intscratch
use{'hrsh7th/nvim-cmp',config=get_config('nvim-lsp-cmp')}        --id=autocomplete
use{'ThePrimeagen/refactoring.nvim',config=get_setup"refactoring"}   --other         --r=(nvim-treesitter/nvim-treesitter)
use 'L3MON4D3/LuaSnip'                 --other         --id=snippets
use 'Konfekt/FastFold'                 --other
use 'jbyuki/venn.nvim'                 --other         --TODO
use 'wbthomason/packer.nvim'
--------lib
use 'nvim-lua/plenary.nvim'            --lib           --n=(nvim-telescope/telescope.nvim) --id=normal
use 'rafamadriz/friendly-snippets'     --lib           --c=(L3MON4D3/LuaSnip)
use 'hrsh7th/cmp-nvim-lsp'             --lib           --c=(hrsh7th/nvim-cmp)
use 'hrsh7th/cmp-buffer'               --lib           --c=(hrsh7th/nvim-cmp)
use 'hrsh7th/cmp-path'                 --lib           --c=(hrsh7th/nvim-cmp)
use 'hrsh7th/cmp-cmdline'              --lib           --c=(hrsh7th/nvim-cmp)
use 'lukas-reineke/cmp-rg'             --lib           --c=(hrsh7th/nvim-cmp)
use 'hrsh7th/cmp-nvim-lsp-signature-help' --lib        --c=(hrsh7th/nvim-cmp)
use 'hrsh7th/cmp-calc'                 --lib           --c=(hrsh7th/nvim-cmp)
use 'f3fora/cmp-spell'                 --lib           --c=(hrsh7th/nvim-cmp)
use 'saadparwaiz1/cmp_luasnip'         --lib           --c=(hrsh7th/nvim-cmp)
use{'tzachar/cmp-tabnine',run='./install.sh' } --lib --c=(hrsh7th/nvim-cmp)
use 'folke/lsp-colors.nvim'
use 'hrsh7th/cmp-nvim-lsp-document-symbol'
use 'hrsh7th/cmp-nvim-lua'
end)
----treesitter
require'nvim-treesitter.configs'.setup({ensure_installed={
  'python','lua','fish',
  'bash','vim',
--
  'go','c','html',
  'java','javascript','css',
  'cpp','rust',
--
  'help','org','markdown',
  'query','json','toml',
  'jsonc','norg'
},rainbow={enable=true},
highlight={enable=true},
})
require('orgmode').setup_ts_grammar()
require('telescope').load_extension('luasnip')
require("telescope").load_extension 'file_browser'
----plug_other
function SwapLang()
  vim.g.translator_target_lang,vim.g.translator_source_lang=vim.g.translator_source_lang,vim.g.translator_target_lang
  vim.notify(vim.g.translator_source_lang..">"..vim.g.translator_target_lang)
end
----plug_conf
vim.g.translator_source_lang='sv'
vim.g.translator_target_lang='es'
vim.g.rainbow_active=1
vim.g.context_enabled=1
vim.g.minimap_highlight_range=1
vim.g.minimap_highlight_search=1
vim.g.miniyank_filename='/home/user/.miniyank.mpack'
----plug_mappings
vno('þ',':Translate<CR>')                           --alt_gr-t
vno('Þ',':TranslateR<CR>')                          --alt_gr-T
nno('<home>','<Plug>(qf_qf_toggle_stay)')
map('n','Z','<Plug>(FastFoldUpdate)',{noremap=true,nowait=true})
for k,v in pairs({h='left',j='down',k='up',l='right'}) do
  nno('<C-S-'..k..'>',':WinShift '..v..'\r')
end
nno('p','<Plug>(miniyank-autoput)')
nno('P','<Plug>(miniyank-autoPut)')
nno('<A-p>','<Plug>(miniyank-cycle)')
nno('<A-P>','<Plug>(miniyank-cycleback)')
--
vim.api.nvim_set_keymap("v", "<leader>re", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("v", "<leader>rf", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("v", "<leader>rv", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("v", "<leader>ri", [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], {noremap = true, silent = true, expr = false})
--TODO

----other
vim.cmd('syntax enable') --TODO
----autocmd
autocmd('TermOpen',{command='DisableWhitespace'})
autocmd({'FileType','BufReadPost'},{command='sourc ~/.config/nvim/autoload/filetype.vim'})
autocmd('BufReadPost',{command='sourc ~/.config/nvim/autoload/redef.vim'})
autocmd('BufWinEnter',{command='if line("\'\\"") <= line("$")|silent! normal! g`"|endif'})
autocmd('TermOpen',{command='nno <buffer><silent> a :startinsert<CR>'}) --TODO
autocmd('TermOpen',{command='nno <buffer><silent> i :startinsert<CR>'}) --TODO
autocmd('TextYankPost',{command='silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=700})'})
autocmd('BufEnter',{command='if bufname("") !~ "^\\[A-Za-z0-9\\]*://" | lcd %:p:h | endif'})
autocmd('CmdlineEnter',{pattern='/,\\?',command='set hlsearch'})
----source (replace with require (if posible))
--vim.cmd('sourc ~/.config/nvim/autoload/redef.vim')     --testing
--vim.cmd('sourc ~/.config/nvim/autoload/filetype.vim')  --testing
require('self_plugins.ranger')
require('self_plugins.unimpaired')
require('config.tabline')
require('config.whichkey_space-maps')
----other
fn.timer_start(2000,function() fn.execute('checktime') end,{['repeat']=-1})
vim.g.loaded_matchparen        = 1
vim.g.loaded_matchit           = 1
vim.g.loaded_logiPat           = 1
vim.g.loaded_rrhelper          = 1
vim.g.loaded_tarPlugin         = 1
vim.g.loaded_man               = 1
vim.g.loaded_gzip              = 1
vim.g.loaded_zipPlugin         = 1
vim.g.loaded_2html_plugin      = 1
vim.g.loaded_shada_plugin      = 1
vim.g.loaded_spellfile_plugin  = 1
vim.g.loaded_netrw             = 1
vim.g.loaded_netrwPlugin       = 1
vim.g.loaded_tutor_mode_plugin = 1
vim.g.loaded_fzf = 1
vim.g.loaded_remote_plugins    = 1 --TODO
