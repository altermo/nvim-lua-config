----init--
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
local function get_config(name)
  return function ()
    require('config.'..name)
  end
end
local function get_setup(name,conf)
  return function ()
    require(name).setup(conf)
  end
end
local function get_rplugin()
  return function()
    if vim.g.loaded_remote_plugins==1 then
      vim.g.loaded_remote_plugins=nil
      vim.cmd.source('/usr/share/nvim/runtime/plugin/rplugin.vim')
    end
  end
end
local function cexp(part,exp,inc)
  local ret={}
  if inc then ret[#ret+1]=part end
  for _,i in pairs(exp) do
    ret[#ret+1]=part..i
  end
  return ret
end
local function mexp(mode,exp)
  local ret={}
  for _,i in pairs(exp) do
    ret[#ret+1]={mode,i}
  end
  return ret
end
local function moa(map)
  return {{'o','i'..map},{'o','a'..map},{'x','i'..map},{'x','a'..map}}
end
local extend=vim.fn.extend
require'lazy'.setup({
  ----TEST

  ----colorschm
  {'sainnhe/sonokai'},
  {'felipec/vim-felipec'},
  {'ray-x/starry.nvim'},
  {'everblush/everblush.nvim'},
  {'lmburns/kimbox'},
  {'mhartington/oceanic-next'},
  {'folke/tokyonight.nvim'},
  {'challenger-deep-theme/vim'},
  {'NTBBloodbath/doom-one.nvim'},
  {'gbprod/nord.nvim'},
  {'rafamadriz/neon'},
  {'luisiacc/gruvbox-baby'},
  --{'ellisonleao/gruvbox.nvim'},
  {'kuznetsss/meadow-nvim'},
  {'matsuuu/pinkmare'},
  {'jaredgorski/spacecamp'},
  {'mjlbach/onedark.nvim'},
  {'bluz71/vim-nightfly-colors'},
  {'rakr/vim-one'},
  {'preservim/vim-colors-pencil'},
  --{'projekt0n/github-nvim-theme'},
  {'edeneast/nightfox.nvim',event='User s1'},
  {'fenetikm/falcon',event='User s1'},
  {'folke/lsp-colors.nvim',event='User s1'},
  {'vigoux/oak',event='User s1'},
  {'folke/styler.nvim',config=get_setup('styler',{themes={}}),cmd='Styler'},

  ----zen
  {'folke/zen-mode.nvim',config=get_setup'zen-mode',cmd='ZenMode'},
  {'folke/twilight.nvim',cmd='Twilight',lazy=true,config=get_setup'twilight'},
  {'junegunn/limelight.vim',cmd='Limelight'},
  {'koenverburg/peepsight.nvim',config=get_setup('peepsight',{'function_definition'}),cmd=cexp('Peepsight',{'Enable','Disable'},true)},

  ----visual
  ------fun
  {'lukas-reineke/indent-blankline.nvim',config=get_setup('indent_blankline',{show_current_context=true}),event='User s1'},
  {'rrethy/vim-hexokinase',build='make hexokinase',init=function ()
    vim.g.Hexokinase_highlighters={'backgroundfull'}
  end,event='User s1'},
  {'anuvyklack/pretty-fold.nvim',
    config=get_setup'pretty-fold',event='User isfolded'},
  {'karb94/neoscroll.nvim',config=get_setup'neoscroll',keys={'<C-u>','<C-d>','<C-b>','<C-f>','<C-y>','<C-e>'},lazy=true},
  {'m-demare/hlargs.nvim',config=get_setup'hlargs',event='User s1'},
  {'winston0410/range-highlight.nvim',config=get_setup'range-highlight',dependencies={'winston0410/cmd-parser.nvim'},event='CmdlineEnter'},
  {'nacro90/numb.nvim',config=get_setup'numb',event='CmdlineEnter'},
  ------important-info
  {'chentoast/marks.nvim',config=get_setup'marks',keys={{'n','m'},{'n','dm'}}},
  {'smjonas/live-command.nvim',config=get_setup('live-command',{commands={Norm={cmd='norm!'},G={cmd='g'},V={cmd='v'}}}),cmd={'G','V','Norm'}},
  {'lcheylus/overlength.nvim',config=get_setup('overlength',{enabled=false,textwidth_mode=1}),cmd='OverlengthToggle'},
  {'azabiong/vim-highlighter',init=function ()
    vim.g.HiSet='M<CR>'
    vim.g.HiErase='M<BS>'
    vim.g.HiClear='M<C-L>'
    vim.g.HiFind='M<tab>'
  end,keys=mexp('x',{'M<CR>','M<BS>','M<C-l>','M<Tab>'})},
  {'Pocco81/HighStr.nvim',cmd={'HSHighlight','HSRmHighlight'}},
  {'dbmrq/vim-redacted',cmd='Redact'},
  {'monkoose/matchparen.nvim',config=get_setup'matchparen',event='User s1'},
  {'nvim-lualine/lualine.nvim',config=get_setup('lualine',{options={theme='powerline'}})},
  {'0styx0/abbreinder.nvim',dependencies={'0styx0/abbremand.nvim',lazy=true},config=get_setup'abbreinder',event='InsertEnter'},
  {'folke/which-key.nvim',config=get_config'which-key',keys={{'n','<space>'},{'n','g'},{'n','<char-92>'}},cmd='WhichKey'},
  --{'nfrid/due.nvim',config=get_setup('due_nvim',{update_rate=1000})..';require("due_nvim").async_update(0)',event='User s1'}, --TODO

  ----keys
  {'Exafunction/codeium.vim',init=function() --https://github.com/Exafunction/codeium.vim/issues/118
    vim.g.codeium_disable_bindings=false
    vim.g.codeium_manual=true
  end,config=function ()
      local ino=require 'utils.keymap'.ino
      local function wrapper(f,...)
        local args={...}
        return function() return f(unpack(args)) end
      end
      ino('<A-cr>',wrapper(vim.fn['codeium#Accept']),{expr=true})
      ino('<A-)>',wrapper(vim.fn['codeium#CycleCompletions'],1),{expr=true})
      ino('<A-(>',wrapper(vim.fn['codeium#CycleCompletions'],-1),{expr=true})
      ino('<A-\'>',wrapper(vim.fn['codeium#Complete']),{expr=true})
    end,keys={{'i','<A-\'>'}}},
  --{'weissle/easy-action',opt=true}, --TODO
  {'chrisgrieser/nvim-recorder',config=get_setup('recorder',{slots={'a','b','c'}}),keys=mexp('n',{'q','Q','cq','yq','<C-q>'})},
  {'tyru/open-browser.vim',config=function () --TODO: replace with vim.ui.open
    local k=require 'utils.keymap'
    k.nno('gx','<Plug>(openbrowser-smart-search)')
    k.xno('gx','<Plug>(openbrowser-smart-search)')
  end,keys={{'x','gx'},{'n','gx'}},ft='puml'},
  {'drzel/vim-split-line',config=function ()
    require'utils.keymap'.nno('<A-s>',':SplitLine\r')
  end,keys={{'n','<A-s>'}}},
  {'tpope/vim-characterize',keys={{'n','ga'}},config=function ()
    require'utils.keymap'.nno('ga','<Plug>(characterize)')
  end},
  {'tommcdo/vim-exchange',keys={{'n','cx'},{'x','X'}}},
  {'AndrewRadev/sideways.vim',config=function ()
    local nno=require 'utils.keymap'.nno
    nno('>A',':SidewaysRight\r')
    nno('<A',':SidewaysLeft\r')
  end,keys=mexp('n',{'>A','<A'})},
  {'wansmer/sibling-swap.nvim',dependencies={'nvim-treesitter'},config=function()
    local swap=require('sibling-swap')
    local nno=require'utils.keymap'.nno
    swap.setup({use_default_keymaps=false})
    nno('>a',swap.swap_with_right)
    nno('<a',swap.swap_with_left)
  end,keys=mexp('n',{'>a','<a'})},
  {'gbprod/yanky.nvim',config=get_config'yanky',event='TextYankPost',
    keys=extend(mexp('n',{'p','P','<A-p>','<A-P>'}),{{'x','p'},{'x','P'}})},
  {'allendang/nvim-expand-expr',config=function ()
    require'utils.keymap'.nno('gE',':lua require"expand_expr".expand()\r')
  end,keys={{'n','gE'}}},
  {'andrewradev/switch.vim',keys='gs',cmd=cexp('Switch',{'Extend','Reverse'},true)},
  {'monaqa/dial.nvim',config=get_config'dial',keys={{'n','<C-a>'},{'n','<C-x>'},{'x','<C-a>'},{'x','<C-x>'}}},
  {'glts/vim-radical',dependencies={'glts/vim-magnum'},keys=extend(mexp('n',{'gA','crx','cro','crd','crb'}),{{'x','gA'}})},
  {'preservim/nerdcommenter',config=function ()
    vim.g.NERDCreateDefaultMappings=0
    vim.g.NERDCustomDelimiters={fish={left='#'}}
    local k=require 'utils.keymap'
    k.xno('gc','<Plug>NERDCommenterToggle gv')
    k.nno('gc','<Plug>NERDCommenterToggle')
  end,keys={{'x','gc'},{'n','gc'}}},
  {'gennaro-tedesco/nvim-peekup',keys={{'n','<char-34><char-34>'}}},
  {'mattn/emmet-vim',keys={{'i','<C-y>'}}},
  {'kylechui/nvim-surround',config=get_setup'nvim-surround',keys={{'i','<C-g>s'},{'i','<C-g>S'},{'n','ys'},{'n','yS'},{'x','S'},{'x','gS'},{'n','cs'},{'n','ds'}}},
  {'rrethy/vim-tranquille',keys='g/',config=function ()
    require'utils.keymap'.nno('g/','<Plug>(tranquille_search)')
  end},
  {'iron-e/vim-tabmode',dependencies={'Iron-E/vim-libmodal'},cmd='TabmodeEnter',keys={{'n','\\<tab>'}}},

  ----text object
  {'s1n7ax/nvim-lazy-inner-block',config=get_setup'nvim-lazy-inner-block'},
  {'coderifous/textobj-word-column.vim',keys=extend(moa'c',moa'C')},
  {'deathlyfrantic/vim-textobj-blanklines',dependencies={'kana/vim-textobj-user'},keys=moa'<space>'},
  {'Julian/vim-textobj-variable-segment',keys=moa'v'},

  ----movement
  {'ggandor/leap.nvim',lazy=true,config=function()
    require'leap'.opts.safe_labels=vim.split('abcdefghijklmnopqrstuvwxyz','')
    require'leap'.opts.labels={}
  end},
  {'haya14busa/vim-edgemotion',config=function()
    local k=require 'utils.keymap'
    k.nno('<S-A-n>','<Plug>(edgemotion-j)')
    k.nno('<S-A-p>','<Plug>(edgemotion-k)')
    k.xno('<S-A-n>','<Plug>(edgemotion-j)')
    k.xno('<S-A-p>','<Plug>(edgemotion-k)')
  end,keys=extend(mexp('x',{'<S-A-p>','<S-A-n>'}),mexp('n',{'<S-A-p>','<S-A-n>'}))},
  {'abecodes/tabout.nvim',config=get_setup('tabout',{tabkey='<A-tab>',backwards_tabkey='<A-S-tab>',act_as_tab=false}),keys={{'i','<A-tab>'},{'i','<A-S-tab>'}}},
  {'phaazon/hop.nvim',config=get_setup'hop',lazy=true},
  {'rhysd/clever-f.vim',config=function ()
    vim.g.clever_f_smart_case=1
    vim.g.clever_f_mark_direct=1
    require'utils.keymap'.nno('<esc>','<Plug>(clever-f-reset)')
  end,keys=extend(mexp('n',{'f','t','F','T'}),mexp('x',{'f','t','F','T'}))},
  {'arp242/jumpy.vim',keys={'[[','<char-93><char-93>'}},
  {'lambdalisue/lista.nvim',config=get_rplugin(),cmd='Lista'},
  {'jeetsukumaran/vim-indentwise',keys=mexp('n',extend(cexp('[',{'-','+','=','_','%'}),cexp(']',{'-','+','=','_','%'})))},
  {'mg979/vim-visual-multi',init=function() vim.cmd"let g:VM_maps={}" end,keys=mexp('n',{'\\\\','<C-n>'})},
  {'xiyaowong/accelerated-jk.nvim',config=function ()
    require('accelerated-jk').setup{}
    local xno=require'utils.keymap'.xno
    xno('j','<cmd>lua require"accelerated-jk".command("gj")\r')
    xno('k','<cmd>lua require"accelerated-jk".command("gk")\r')
  end,keys={{'n','j'},{'n','k'},{'x','j'},{'x','j'}}},

  ----utils
  {'kazhala/close-buffers.nvim',cmd={'BDelete','BWipeout'}},
  {'chrisgrieser/nvim-genghis',lazy=true,cmd={'NewFromSelection','Duplicate','Rename','Trash','Move','CopyFilename','CopyFilepath','Chmodx','New'}},
  {'tpope/vim-abolish',cmd={'Abolish','Subvert'},keys={{'n','cr'}}},
  {'sqve/sort.nvim',cmd='Sort'},
  {'simonefranza/nvim-conv',cmd=cexp('Conv',{'Bin','Dec','Hex','Oct','Farenheit',
    'Celsius','Str','Bytes','MetricImperial','DataTransRate','Color','SetPrecision'})},
  {'nanotee/zoxide.vim',cmd={'Z','Zi'}},
  {'tyru/capture.vim',cmd='Capture'},
  {'johmsalas/text-case.nvim',lazy=true},

  ----file
  {'micmine/jumpwire.nvim',lazy=true},
  {'everduin94/nvim-quick-switcher',lazy=true},
  {'will133/vim-dirdiff',cmd='DirDiff'},
  {'pianocomposer321/project-templates.nvim',cmd={'LoadTemplate','DeleteTemplate','SaveAsTemplate'}},

  ----buf-app
  {'krady21/compiler-explorer.nvim',cmd='CECompile'},
  {'felipec/notmuch-vim',cmd='NotMuch'},
  {'rbtnn/vim-mario',dependencies={'rbtnn/vim-game_engine'},cmd='Mario'},
  {'rbtnn/vim-puyo',dependencies={'rbtnn/vim-game_engine'},cmd='Puyo'},
  {'rktjmp/shenzhen-solitaire.nvim',cmd='ShenzhenSolitaireNewGame'},
  {'alec-gibson/nvim-tetris',cmd='Tetris'},
  {'seandewar/killersheep.nvim',cmd='KillKillKill'},
  {'seandewar/nvimesweeper',cmd='Nvimesweeper'},
  {'kassio/neoterm',cmd={'T','Tnew','Topen','Texec'}},
  {'elihunter173/dirbuf.nvim',cmd='Dirbuf',init=function()
    vim.api.nvim_create_autocmd('BufEnter',{
      command="if isdirectory(expand('%')) && !&modified|execute 'Dirbuf'|endif"
    })end},
  {'mtth/scratch.vim',cmd=cexp('Scratch',{'Insert','Preview','Selection'},true),init=function ()
    vim.g.scratch_no_mappings=1
  end},
  {'voldikss/vim-floaterm',cmd='FloatermToggle'},

  ----buffer
  {'stevearc/stickybuf.nvim',cmd=extend(cexp('Pin',{'Buffer','Buftype','Filetype'}),{'UnpinBuffer'})},
  {'nyngwang/neononame.lua',cmd='NeoNoName'},

  ----command
  {'cshuaimin/ssr.nvim',config=function()
    require("ssr").setup {}
    vim.keymap.set({'n','x'},'\\sr',require("ssr").open)
  end,keys={{'n','\\sr'},{'x','\\sr'}}},
  {'acksld/nvim-femaco.lua',config=get_setup'femaco',cmd='FeMaco'},
  {'ray-x/web-tools.nvim',config=get_setup'web-tools',cmd='BrowserOpen'},
  {'smjonas/inc-rename.nvim',config=function()
    require 'inc_rename'.setup{}
    require'utils.keymap'.nno('gr',':IncRename <C-r>=expand("<cword>")\r',{noremap=true})
  end,cmd='IncRename',keys={{'n','gr'}}},
  {'ludopinelli/comment-box.nvim',lazy=true},
  {'s1n7ax/nvim-comment-frame',lazy=true},
  {'nvim-colortils/colortils.nvim',cmd="Colortils",config=get_setup'colortils'},
  {'skywind3000/asyncrun.vim',cmd={'AsyncRun','AsyncStop'}},
  {'skywind3000/asynctasks.vim',cmd=cexp('AsyncTask',{'Edit','Last','List','Macro','Profile'},true)},
  {'michaelb/sniprun',build='bash ./install.sh',cmd=cexp('Snip',{'Run','Info','Close','Reset','Terminate','ReplMemoryClean'})},
  {'nyngwang/NeoWell.lua',config=get_setup'neo-well',cmd=cexp('NeoWell',{'Toggle','Append','Jump','Edit','Out','WipeOut'})},
  {'godlygeek/tabular',cmd='Tabularize'},
  {"ellisonleao/carbon-now.nvim", config = function() require('carbon-now').setup() end,cmd='CarbonNow'},
  {'andrewradev/linediff.vim',cmd={'Linediff','LinediffReset'}},
  --{'jbyuki/instant.nvim',config=function ()
    --vim.g.instant_username='UsEr'
  --end,opt=true},
  {'tpope/vim-dadbod',cmd='DB'},
  {'danymat/neogen',lazy=true,config=get_setup('neogen',{snippet_engine='snippy'})},
  {'https://gitlab.com/Groctel/jobsplit.nvim',cmd='Jobsplit'},
  --{'lifepillar/vim-colortemplate',opt=true},
  {'tommcdo/vim-express',cmd={'MapExpress','MapSubpress'}},
  {'sbdchd/neoformat',cmd='Neoformat'},
  {'skywind3000/vim-rt-format',cmd='RTFormatEnable'},
  {'shinglyu/vim-codespell',cmd='Codespell'},
  {'rraks/pyro',cmd='Pyro',config=get_rplugin(),init=function ()
    vim.g.pyro_macro_path='/home/user/.macro'
  end},
  {'amadeus/vim-convert-color-to',cmd='ConvertColorTo'},

  ----sidepannel
  {'majutsushi/tagbar',cmd='TagbarToggle'},
  {'itchyny/calendar.vim',cmd='Calendar'},
  {'simnalamburt/vim-mundo',cmd='MundoToggle'},
  {'nvim-neo-tree/neo-tree.nvim',dependencies={'MunifTanjim/nui.nvim'},config=get_config'neotree',cmd='Neotree'},
  {'gorbit99/codewindow.nvim',config=function()
    local codewindow=require'codewindow'
    codewindow.setup()
    vim.api.nvim_create_user_command('CodeWindow',codewindow.toggle_minimap,{})
  end,cmd='CodeWindow'},

  ----search
  {'nvim-pack/nvim-spectre',lazy=true},
  {'roosta/fzf-folds.vim',cmd='Folds',config=function ()
    vim.cmd[[
      if g:loaded_fzf==1
      unlet g:loaded_fzf
      source /usr/share/vim/vimfiles/plugin/fzf.vim
      endif
      ]]
  end},
  ------telescope
  {'nvim-telescope/telescope.nvim',dependencies={
    'nvim-neorg/neorg-telescope',
    'nvim-telescope/telescope-symbols.nvim',
    'nvim-telescope/telescope-project.nvim',
    {'nvim-telescope/telescope-fzf-native.nvim',build='make'},
    'olacin/telescope-cc.nvim',
    'nvim-telescope/telescope-live-grep-args.nvim',
    'nvim-telescope/telescope-packer.nvim',
    {'nvim-telescope/telescope-ui-select.nvim',init=function ()
      ---@diagnostic disable-next-line: duplicate-set-field
      function vim.ui.select(...)
        local telescope=require "telescope"
        telescope.load_extension'ui-select'
        vim.ui.select(...)
      end
    end
    },
    'tc72/telescope-tele-tabby.nvim',
    'nvim-telescope/telescope-file-browser.nvim',
    'GustavoKatel/telescope-asynctasks.nvim',
    'debugloop/telescope-undo.nvim',
    'otavioschwanck/telescope-alternate.nvim',
  },config=function ()
      local telescope=require'telescope'
      telescope.load_extension'fzf'
      telescope.setup{}
    end,cmd='Telescope',lazy=true},

  ----window
  {'wellle/visual-split.vim',keys={{'n','<C-W>gr'},{'n','<C-W>gss'},{'n','<C-W>gsa'},
    {'n','<C-W>gsb'},{'x','<C-W>gr'},{'x','<C-W>gss'},{'x','<C-W>gsa'},{'x','<C-W>gsb'}},
    cmd=extend(cexp('VSSplit',{'Above','Below'},true),{'VSResize'})},
  {'chrisbra/nrrwrgn',cmd=extend(cexp('NR',{'V','P','M','S','L','N'},true),{'NW','WR','NUD'})},
  {'mattboehm/vim-accordion',cmd=cexp('Accordion',{'All','Diff','Stop','ZoomIn','ZoomOut','Once','Clear'},true)},
  {'sindrets/winshift.nvim',config=function ()
    require'winshift'.setup{}
    for k,v in pairs({h='left',j='down',k='up',l='right'}) do
      require'utils.keymap'.nno('<C-S-'..k..'>',':WinShift '..v..'\r')
    end end,keys=mexp('n',{'<C-S-h>','<C-S-j>','<C-S-k>','<C-S-l>'})},
  {'wesQ3/vim-windowswap',keys='\\ww'},
  {'https://gitlab.com/yorickpeterse/nvim-window',config=function ()
    require'utils.keymap'.nno('<C-w>g ',':lua require("nvim-window").pick()\r')
  end,keys='<C-w>g<space>'},
  {'t9md/vim-choosewin',config=function ()
    vim.g.choosewin_overlay_enable=1
    require'utils.keymap'.nno('<C-w> ',':ChooseWin\r')
  end,keys='<C-w><space>',command=':ChooseWin'},
  {"anuvyklack/windows.nvim",config=get_setup'windows',dependencies={"anuvyklack/middleclass","anuvyklack/animation.nvim"},cmd='WindowsToggleAutowidth'},

  ----treesitter
  {'nvim-treesitter/nvim-treesitter',dependencies={
    'nvim-lua/plenary.nvim',
    --{'hiphish/nvim-ts-rainbow2',event='User s1',config=function() vim.cmd"TSEnable rainbow" end},
    --{'nvim-treesitter/playground',dependencies={'nvim-lua/popup.nvim'},cmd='TSPlaygroundToggle'},
    --{'windwp/nvim-ts-autotag',event='User autotag',config=function() vim.cmd"TSEnable autotag" end,ft='html'},
    --{'mfussenegger/nvim-treehopper',lazy=true},
    --{'JoosepAlviste/nvim-ts-context-commentstring',event='User s1'}, --TODO
    --{'nvim-treesitter/nvim-treesitter-refactor',keys={{'n','gR'}}},
    --{'rrethy/nvim-treesitter-endwise',event='InsertEnter',config=function() vim.cmd"TSEnable endwise" end},
  },config=get_config'treesitter'},
  {'ziontee113/syntax-tree-surfer',config=get_config'minimove-treesurfer',
    keys=extend(mexp('n',{'vx','vn','<A-j>','<A-k>','<A-S-k>','<A-S-j>','gF'}),mexp('x',{'<C-j>','<C-k>','<C-h>','<C-l>','<C-S-h>','<C-S-j>','<C-S-k>','<C-S-l>','<A-k>','<A-j>'})),lazy=true},

  ----other
  {'neovim/nvim-lspconfig',config=get_config'lsp',dependencies={
    {'williamboman/mason.nvim',lazy=true},
    {'folke/neodev.nvim',lazy=true},
    {'onsails/lspkind.nvim',lazy=true}},event='User s1'},
  {'rbong/vim-buffest',
    cmd=extend(cexp('Reg',{'split','vsplit','tabedit','edit','pedit'}),
      extend(cexp('Qflist',{'split','vsplit','tabedit','edit'}),
        cexp('Loclist',{'split','vsplit','tabedit','edit'})))},
  {'glepnir/dashboard-nvim',config=get_config('dashboard'),cmd={'Dashboard','DashboardNewFile'},init=function ()
    vim.api.nvim_create_autocmd({'Vimenter'},{callback=function()
      if vim.fn.argc()==0 and vim.api.nvim_buf_line_count(0)==1 and vim.api.nvim_get_current_line()=='' and vim.api.nvim_buf_get_name(0)=='' then
        vim.cmd('Dashboard')
      end end})end},
  {'metakirby5/codi.vim',cmd=cexp('Codi',{'New','Expand','Select','Update'},true)},
  {'ThePrimeagen/refactoring.nvim',config=function ()
    local xno=require'utils.keymap'.xno
    xno('<leader>re',[[<Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]])
    xno('<leader>rf',[[<Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]])
    xno('<leader>rv',[[<Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]])
    xno('<leader>ri',[[<Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]])
  end,keys=mexp('x',{'\\re','\\rf','\\rv','\\ri'})},
  {'m-demare/attempt.nvim',config=get_config'attempt',keys={{'n','\\a'}}},
  {'rcarriga/nvim-notify',init=function() vim.notify=function (...) require"notify"(...) end end,lazy=true},
  {'kkharji/lspsaga.nvim',config=function ()
    require'utils.keymap'.nno('K',':Lspsaga hover_doc\r')
  end,keys={{'n','K'}}},
  {'echasnovski/mini.nvim',config=get_config'mini'},
  {'nmac427/guess-indent.nvim',config=get_setup'guess-indent'},
  {'norcalli/nvim-terminal.lua',config=get_setup'terminal',ft='terminal'},
  {'raghur/vim-ghost',build=':GhostInstall',cmd='GhostStart',config=get_rplugin()},
  {'andweeb/presence.nvim',lazy=true},
  {'cbochs/grapple.nvim',confog=get_setup'grapple',lazy=true},
  --{'mickael-menu/shadowvim',opt=true},
  --{'rest-nvim/rest.nvim',opt=true}, --TODO

  ----auto complete (nvim-cmp & snippy)
  --{'hrsh7th/nvim-cmp',config=get_config('cmp-nvim'),dependencies={
    --{'dcampos/cmp-snippy',after='nvim-cmp'},
    --{'dmitmel/cmp-cmdline-history',after='nvim-cmp'},
    --{'f3fora/cmp-spell',after='nvim-cmp'},
    --{'hrsh7th/cmp-calc',after='nvim-cmp'},
    --{'hrsh7th/cmp-cmdline',after='nvim-cmp'},
    --{'hrsh7th/cmp-buffer',after='nvim-cmp'},
    --{'hrsh7th/cmp-nvim-lsp',after='nvim-cmp'},
    --{'hrsh7th/cmp-nvim-lsp-signature-help',after='nvim-cmp'},
    --{'hrsh7th/cmp-nvim-lua',after='nvim-cmp'},
    --{'hrsh7th/cmp-path',after='nvim-cmp'},
    --{'lukas-reineke/cmp-rg',after='nvim-cmp'},
    --{'quangnguyen30192/cmp-nvim-tags',after='nvim-cmp'},
    --{'ray-x/cmp-treesitter',after='nvim-cmp'},
    ----{'mtoohey31/cmp-fish',after='nvim-cmp'},
    --{'tzachar/cmp-tabnine',build='./install.sh',after='nvim-cmp',lazy=true},
    --{'jcdickinson/codeium.nvim',config=get_setup('codeium'),after='nvim-cmp'},
  --},event={'InsertEnter','CmdlineEnter'}},
  --{'dcampos/nvim-snippy',dependencies={'honza/vim-snippets'},config=get_config'snippy',after='nvim-cmp'},

  ----improve
  {'brglng/vim-im-select',event='User s1'},
  {'ethanholz/nvim-lastplace',config=get_setup'nvim-lastplace'},

  ----lua utils
  {'shoumodip/helm.nvim',lazy=true},
  {'nvim-lua/plenary.nvim',lazy=true},
  {'tastyep/structlog.nvim',lazy=true},
  {'s1n7ax/nvim-window-picker',lazy=true},
  {'rktjmp/fwatch.nvim',lazy=true},
  {'edluffy/hologram.nvim',lazy=true},
  {'rrethy/nvim-animator',lazy=true},

  ----speed
  {'Konfekt/FastFold',config=function ()
    require'utils.keymap'.nno('Z','<Plug>(FastFoldUpdate)')
  end,event='User isfolded',cmd='FastFoldUpdate',keys='Z'},

  ----git
  {'timuntersberger/neogit',cmd='Neogit'},
  {'rbong/vim-flog',after='vim-fugitive',cmd=cexp('Flog',{'git','split'},true)},
  {'tpope/vim-fugitive',cmd='Git',fn='FugitiveIsGitDir'},
  {'sindrets/diffview.nvim',cmd=cexp('Diffview',{'Open','FileHistory','Close','FocusFiles','ToggleFiles','Refresh','Log'})},

  ----debug
  --[[
  puremourning/vimspector
  nvim-neotest/neotest
  xeluxee/competitest.nvim
  mfussenegger/nvim-dap
  pocco81/dap-buddy.nvim
  andythigpen/nvim-coverage
  nvim-telescope/telescope-vimspector.nvim
  nvim-telescope/telescope-dap.nvim
  thehamsta/nvim-dap-virtual-text
  rcarriga/nvim-dap-ui
  ofirgall/goto-breakpoints.nvim
  --]]

  ----writing
  {'JellyApple102/easyread.nvim',config=get_setup('easyread',{fileTypes={'markdown','text'}}),ft={'markdown','text'}},
  {'voldikss/vim-translator',config=get_config'translator',keys=mexp('x',{'þ','Þ'})},
  {'potamides/pantran.nvim',cmd='Pantran'},
  {'jbyuki/venn.nvim',cmd=extend(cexp('VBox',{'D','H','O','DO','HO'},true),{'VFill'})},
  {'dhruvasagar/vim-table-mode',cmd='TableModeToggle'},
  {'dbmrq/vim-ditto',cmd=extend(cexp('Ditto',{'Sent','Par','File','On','Off','Update','SentOn','ParOn','FileOn'},true),{'NoDitto','ToggleDitto'})},
  {'reedes/vim-wordy',cmd={'Wordy','NoWordy'}},
  {'ron89/thesaurus_query.vim',cmd=cexp('Thesaurus',{'QueryReplaceCurrentWord','QueryLookupCurrentWord','QueryReplace'},true)},
  --{'phaazon/mind.nvim',opt=true},

  ----filetype
  {'lhkipp/nvim-nu',ft='nu',config=get_setup('nu',{use_lsp_features=false})},
  {'vim-latex/vim-latex',ft='latex'},
  {'mrcjkb/haskell-tools.nvim',ft='haskell'},
  {'nvim-orgmode/orgmode',config=function ()
    require('orgmode').setup_ts_grammar()
    require('orgmode').setup{}
  end,ft='org'},
  {'nvim-neorg/neorg',config=get_setup(
    'neorg',{load={
      ['core.defaults']={},
      ['core.export']={},
      ['core.export.markdown']={},
      ['core.concealer']={},
      --['core.presenter']={}, --TODO
      --['core.completion']={}, --TODO
    }}),ft='norg'},
  {'mzlogin/vim-markdown-toc',ft='markdown'},
  { "iamcco/markdown-preview.nvim", run = "cd app && npm install",ft='markdown'},
  {'weirongxu/plantuml-previewer.vim',dependencies={'tyru/open-browser.vim'},ft='puml'},
  {'renerocksai/telekasten.nvim',cmd='Telekasten'},
  {'aklt/plantuml-syntax',ft='puml'},
  {'jakewvincent/mkdnflow.nvim',ft='markdown'},
  {'scrooloose/vim-slumlord',ft='puml'},
  {'ahmedkhalf/jupyter-nvim',ft='ipynb'},

  ----end--
  {'folke/lazy.nvim'},
},{})
-- vim:fen:
