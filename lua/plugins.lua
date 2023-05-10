----init--
local function get_config(name)
  return string.format('require("config.%s")', name)
end
local function get_setup(name,conf)
  return string.format('require"%s".setup%s',name,vim.inspect(conf or {}))
end
local function get_rplugin()
  return function()
    vim.cmd[[
      if g:loaded_remote_plugins==1
      unlet g:loaded_remote_plugins
      source /usr/share/nvim/runtime/plugin/rplugin.vim
      endif
      ]]
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
require'packer'.startup(function (use)
  ----TEST

  ----colorschm
  use 'sainnhe/sonokai'
  use 'felipec/vim-felipec'
  use 'ray-x/starry.nvim'
  use 'everblush/everblush.nvim'
  use 'lmburns/kimbox'
  use 'mhartington/oceanic-next'
  use 'folke/tokyonight.nvim'
  use 'challenger-deep-theme/vim'
  use 'NTBBloodbath/doom-one.nvim'
  use 'gbprod/nord.nvim'
  use 'rafamadriz/neon'
  use 'luisiacc/gruvbox-baby'
  use 'ellisonleao/gruvbox.nvim'
  use 'kuznetsss/meadow-nvim'
  use 'matsuuu/pinkmare'
  use 'jaredgorski/spacecamp'
  use 'mjlbach/onedark.nvim'
  use 'bluz71/vim-nightfly-colors'
  use 'rakr/vim-one'
  use 'preservim/vim-colors-pencil'
  use{'edeneast/nightfox.nvim',event='User s1'}
  use{'fenetikm/falcon',event='User s1'}
  use{'folke/lsp-colors.nvim',event='User s1'}
  use{'vigoux/oak',event='User s1'}
  use{'folke/styler.nvim',config=get_setup('styler',{themes={}}),cmd='Styler'}

  ----zen
  use{'folke/zen-mode.nvim',config=get_setup'zen-mode',cmd='ZenMode'}
  use{'folke/twilight.nvim',cmd='Twilight',module='twilight',config=get_setup'twilight'}
  use{'junegunn/limelight.vim',cmd='Limelight'}
  use{'koenverburg/peepsight.nvim',config=get_setup('peepsight',{'function_definition'}),cmd=cexp('Peepsight',{'Enable','Disable'},true)}

  ----visual
  ------fun
  use{'lukas-reineke/indent-blankline.nvim',config=get_setup('indent_blankline',{show_current_context=true}),event='User s1'}
  use{'rrethy/vim-hexokinase',run='make hexokinase',setup=function ()
    vim.g.Hexokinase_highlighters={'backgroundfull'}
  end,event='User s1'}
  use{'anuvyklack/pretty-fold.nvim',
    config=get_setup'pretty-fold',event='User isfolded'}
  use{'https://gitlab.com/yorickpeterse/nvim-pqf',config=get_setup'pqf',event='User qfopen'}
  use{'karb94/neoscroll.nvim',config=get_setup'neoscroll',keys={'<C-u>','<C-d>','<C-b>','<C-f>','<C-y>','<C-e>'},module='neoscroll'}
  use{'m-demare/hlargs.nvim',config=get_setup'hlargs',event='User s1'}
  use{'winston0410/range-highlight.nvim',config=get_setup'range-highlight',requires='winston0410/cmd-parser.nvim',event='CmdlineEnter'}
  use{'nacro90/numb.nvim',config=get_setup'numb',event='CmdlineEnter'}
  use{'kevinhwang91/nvim-hlslens',config=get_config'hlslens',event='CmdlineEnter'}
  use{'jxstxs/conceal.nvim',opt=true} --TODO
  ------important-info
  use{'chentoast/marks.nvim',config=get_setup'marks',keys={{'n','m'}}}
  use{'smjonas/live-command.nvim',config=get_setup('live-command',{commands={Norm={cmd='norm!'},G={cmd='g'},V={cmd='v'}}}),cmd={'G','V','Norm'}}
  use{'lcheylus/overlength.nvim',config=get_setup('overlength',{enabled=false,textwidth_mode=1}),cmd='OverlengthToggle'}
  use{'azabiong/vim-highlighter',setup=function ()
    vim.g.HiSet='M<CR>'
    vim.g.HiErase='M<BS>'
    vim.g.HiClear='M<C-L>'
    vim.g.HiFind='M<tab>'
  end,keys=mexp('x',{'M<CR>','M<BS>','M<C-l>','M<Tab>'})}
  use{'Pocco81/HighStr.nvim',cmd={'HSHighlight','HSRmHighlight'}}
  use{'dbmrq/vim-redacted',cmd='Redact'}
  use{'monkoose/matchparen.nvim',config=get_setup'matchparen',event='User s1'}
  use{'nvim-lualine/lualine.nvim',config=get_setup('lualine',{options={theme='powerline'}})}
  use{'0styx0/abbreinder.nvim',requires={'0styx0/abbremand.nvim',module='abbremand'},config=get_setup'abbreinder',event='InsertEnter'}
  use{'folke/which-key.nvim',config=get_config'which-key',keys={{'n','<space>'},{'n','g'},{'n','<char-92>'}},cmd='WhichKey'}
  use{'nfrid/due.nvim',config=get_setup('due_nvim',{update_rate=1000})..';require("due_nvim").async_update(0)',event='User s1'}

  ----keys
  use{'Exafunction/codeium.vim',setup=function()
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
    end,keys={{'i','<A-\'>'}}}
  use{'weissle/easy-action',opt=true} --TODO
  use{'chrisgrieser/nvim-recorder',config=get_setup('recorder',{slots={'a','b','c'}}),keys=mexp('n',{'q','Q','cq','yq','<C-q>'})}
  use{'tyru/open-browser.vim',config=function ()
    local k=require 'utils.keymap'
    k.nno('gx','<Plug>(openbrowser-smart-search)')
    k.xno('gx','<Plug>(openbrowser-smart-search)')
  end,keys={{'x','gx'},{'n','gx'}},ft='puml'}
  use{'drzel/vim-split-line',config=function ()
    require'utils.keymap'.nno('<A-s>',':SplitLine\r')
  end,keys={{'n','<A-s>'}}}
  use{'tpope/vim-characterize',keys={{'n','ga'}},config=function ()
    require'utils.keymap'.nno('ga','<Plug>(characterize)')
  end}
  use{'tommcdo/vim-exchange',keys={{'n','cx'},{'x','X'}}}
  use{'AndrewRadev/sideways.vim',config=function ()
    local nno=require 'utils.keymap'.nno
    nno('>A',':SidewaysRight\r')
    nno('<A',':SidewaysLeft\r')
  end,keys=mexp('n',{'>A','<A'})}
  use{'wansmer/sibling-swap.nvim',requires='nvim-treesitter',config=function()
    local swap=require('sibling-swap')
    local nno=require'utils.keymap'.nno
    swap.setup({use_default_keymaps=false})
    nno('>a',swap.swap_with_right)
    nno('<a',swap.swap_with_left)
  end,keys=mexp('n',{'>a','<a'})}
  use{'gbprod/yanky.nvim',config=get_config'yanky',event='TextYankPost',
    keys=extend(mexp('n',{'p','P','<A-p>','<A-P>'}),{{'x','p'},{'x','P'}})}
  use{'allendang/nvim-expand-expr',config=function ()
    require'utils.keymap'.nno('gE',':lua require"expand_expr".expand()\r')
  end,keys={{'n','gE'}}}
  use{'andrewradev/switch.vim',keys='gs',cmd=cexp('Switch',{'Extend','Reverse'},true)}
  use{'monaqa/dial.nvim',config=get_config'dial',keys={{'n','<C-a>'},{'n','<C-x>'},{'x','<C-a>'},{'x','<C-x>'}}}
  use{'glts/vim-radical',requires='glts/vim-magnum',keys=extend(mexp('n',{'gA','crx','cro','crd','crb'}),{{'x','gA'}})}
  use{'preservim/nerdcommenter',config=function ()
    vim.g.NERDCreateDefaultMappings=0
    vim.g.NERDCustomDelimiters={fish={left='#'}}
    local k=require 'utils.keymap'
    k.xno('gc','<Plug>NERDCommenterToggle gv')
    k.nno('gc','<Plug>NERDCommenterToggle')
  end,keys={{'x','gc'},{'n','gc'}}}
  use{'gennaro-tedesco/nvim-peekup',keys={{'n','<char-34><char-34>'}}}
  use{'mattn/emmet-vim',keys={{'i','<C-y>'}}}
  use{'kylechui/nvim-surround',config=get_setup'nvim-surround',keys={{'i','<C-g>s'},{'i','<C-g>S'},{'n','ys'},{'n','yS'},{'x','S'},{'x','gS'},{'n','cs'},{'n','ds'}}}
  use{'rrethy/vim-tranquille',keys='g/',config=function ()
    require'utils.keymap'.nno('g/','<Plug>(tranquille_search)')
  end}
  use{'iron-e/vim-tabmode',requires='Iron-E/vim-libmodal',cmd='TabmodeEnter',keys={{'n','\\<tab>'}}}

  ----text object
  use{'s1n7ax/nvim-lazy-inner-block',config=get_setup'nvim-lazy-inner-block'}
  use{'coderifous/textobj-word-column.vim',keys=extend(moa'c',moa'C')}
  use{'deathlyfrantic/vim-textobj-blanklines',requires='kana/vim-textobj-user',keys=moa'<space>'}
  use{'Julian/vim-textobj-variable-segment',keys=moa'v'}

  ----movement
  use{'ggandor/leap.nvim',module='leap',config=function()
    require'leap'.opts.safe_labels=vim.split('abcdefghijklmnopqrstuvwxyz','')
    require'leap'.opts.labels={}
  end}
  use{'haya14busa/vim-edgemotion',config=function()
    local k=require 'utils.keymap'
    k.nno('<S-A-n>','<Plug>(edgemotion-j)')
    k.nno('<S-A-p>','<Plug>(edgemotion-k)')
    k.xno('<S-A-n>','<Plug>(edgemotion-j)')
    k.xno('<S-A-p>','<Plug>(edgemotion-k)')
  end,keys=extend(mexp('x',{'<S-A-p>','<S-A-n>'}),mexp('n',{'<S-A-p>','<S-A-n>'}))}
  use{'abecodes/tabout.nvim',config=get_setup('tabout',{tabkey='<A-tab>',backwards_tabkey='<A-S-tab>',act_as_tab=false}),keys={{'i','<A-tab>'},{'i','<A-S-tab>'}}}
  use{'phaazon/hop.nvim',config=get_setup'hop',module='hop'}
  use{'rhysd/clever-f.vim',config=function ()
    vim.g.clever_f_smart_case=1
    vim.g.clever_f_mark_direct=1
    require'utils.keymap'.nno('<esc>','<Plug>(clever-f-reset)')
  end,keys=extend(mexp('n',{'f','t','F','T'}),mexp('x',{'f','t','F','T'}))}
  use{'arp242/jumpy.vim',keys={'[[','<char-93><char-93>'}}
  use{'lambdalisue/lista.nvim',config=get_rplugin(),cmd='Lista'}
  use{'jeetsukumaran/vim-indentwise',keys=mexp('n',extend(cexp('[',{'-','+','=','_','%'}),cexp(']',{'-','+','=','_','%'})))}
  use{'mg979/vim-visual-multi',setup='vim.cmd"let g:VM_maps={}"',keys=mexp('n',{'\\\\','<C-n>'})}
  use{'xiyaowong/accelerated-jk.nvim',config=function ()
    require('accelerated-jk').setup{}
    local xno=require'utils.keymap'.xno
    xno('j','<cmd>lua require"accelerated-jk".command("gj")\r')
    xno('k','<cmd>lua require"accelerated-jk".command("gk")\r')
  end,keys={{'n','j'},{'n','k'},{'x','j'},{'x','j'}}}

  ----utils
  use{'kazhala/close-buffers.nvim',cmd={'BDelete','BWipeout'}}
  use{'chrisgrieser/nvim-genghis',module='genghis',cmd={'NewFromSelection','Duplicate','Rename','Trash','Move','CopyFilename','CopyFilepath','Chmodx','New'}}
  use{'tpope/vim-abolish',cmd={'Abolish','Subvert'},keys={{'n','cr'}}}
  use{'sqve/sort.nvim',cmd='Sort'}
  use{'simonefranza/nvim-conv',cmd=cexp('Conv',{'Bin','Dec','Hex','Oct','Farenheit',
    'Celsius','Str','Bytes','MetricImperial','DataTransRate','Color','SetPrecision'})}
  use{'nanotee/zoxide.vim',cmd={'Z','Zi'}}
  use{'tyru/capture.vim',cmd='Capture'}
  use{'johmsalas/text-case.nvim',module='textcase'}

  ----file
  use{'micmine/jumpwire.nvim',module='jumpwire'}
  use{'everduin94/nvim-quick-switcher',module='nvim-quick-switcher'}
  use{'will133/vim-dirdiff',cmd='DirDiff'}
  use{'pianocomposer321/project-templates.nvim',cmd={'LoadTemplate','DeleteTemplate','SaveAsTemplate'}}

  ----buf-app
  use{'krady21/compiler-explorer.nvim',cmd='CECompile'}
  use{'felipec/notmuch-vim',cmd='NotMuch'}
  use{'rbtnn/vim-mario',requires='rbtnn/vim-game_engine',cmd='Mario'}
  use{'rbtnn/vim-puyo',requires='rbtnn/vim-game_engine',cmd='Puyo'}
  use{'rktjmp/shenzhen-solitaire.nvim',cmd='ShenzhenSolitaireNewGame'}
  use{'alec-gibson/nvim-tetris',cmd='Tetris'}
  use{'seandewar/killersheep.nvim',cmd='KillKillKill'}
  use{'seandewar/nvimesweeper',cmd='Nvimesweeper'}
  use{'kassio/neoterm',cmd={'T','Tnew','Topen','Texec'}}
  use{'elihunter173/dirbuf.nvim',cmd='Dirbuf',setup=function()
    vim.api.nvim_create_autocmd('BufEnter',{
      command="if isdirectory(expand('%')) && !&modified|execute 'Dirbuf'|endif"
    })end}
  use{'mtth/scratch.vim',cmd=cexp('Scratch',{'Insert','Preview','Selection'},true),setup=function ()
    vim.g.scratch_no_mappings=1
  end}
  use{'voldikss/vim-floaterm',cmd='FloatermToggle'}

  ----buffer
  use{'stevearc/stickybuf.nvim',cmd=extend(cexp('Pin',{'Buffer','Buftype','Filetype'}),{'UnpinBuffer'})}
  use{'nyngwang/neononame.lua',cmd='NeoNoName'}

  ----command
  use{'cshuaimin/ssr.nvim',config=function()
    require("ssr").setup {}
    vim.keymap.set({'n','x'},'\\sr',require("ssr").open)
  end,keys={{'n','\\sr'},{'x','\\sr'}}}
  use{'acksld/nvim-femaco.lua',config=get_setup'femaco',cmd='FeMaco'}
  use{'ray-x/web-tools.nvim',config=get_setup'web-tools',cmd='BrowserOpen'}
  use{'smjonas/inc-rename.nvim',config=function()
    require 'inc_rename'.setup{}
    require'utils.keymap'.nno('gr',':IncRename <C-r>=expand("<cword>")\r',{noremap=true})
  end,cmd='IncRename',keys={{'n','gr'}}}
  use{'ludopinelli/comment-box.nvim',module='comment-box'}
  use{'s1n7ax/nvim-comment-frame',module='nvim-comment-frame'}
  use{'nvim-colortils/colortils.nvim',cmd="Colortils",config=get_setup'colortils'}
  use{'skywind3000/asyncrun.vim',cmd={'AsyncRun','AsyncStop'}}
  use{'skywind3000/asynctasks.vim',cmd=cexp('AsyncTask',{'Edit','Last','List','Macro','Profile'},true)}
  use{'michaelb/sniprun',run='bash ./install.sh',cmd=cexp('Snip',{'Run','Info','Close','Reset','Terminate','ReplMemoryClean'})}
  use{'nyngwang/NeoWell.lua',config=get_setup'neo-well',cmd=cexp('NeoWell',{'Toggle','Append','Jump','Edit','Out','WipeOut'})}
  use{'godlygeek/tabular',cmd='Tabularize'}
  use{"ellisonleao/carbon-now.nvim", config = function() require('carbon-now').setup() end,cmd='CarbonNow'}
  use{'andrewradev/linediff.vim',cmd={'Linediff','LinediffReset'}}
  use{'jbyuki/instant.nvim',config=function ()
    vim.g.instant_username='UsEr'
  end,opt=true}
  use{'tpope/vim-dadbod',cmd='DB'}
  use{'danymat/neogen',module='neogen',config=get_setup('neogen',{snippet_engine='snippy'})}
  use{'https://gitlab.com/Groctel/jobsplit.nvim',cmd='Jobsplit'}
  use{'lifepillar/vim-colortemplate',opt=true}
  use{'tommcdo/vim-express',cmd={'MapExpress','MapSubpress'}}
  use{'sbdchd/neoformat',cmd='Neoformat'}
  use{'skywind3000/vim-rt-format',cmd='RTFormatEnable'}
  use{'shinglyu/vim-codespell',cmd='Codespell'}
  use{'rraks/pyro',cmd='Pyro',config=get_rplugin(),setup=function ()
    vim.g.pyro_macro_path='/home/user/.macro'
  end}
  use{'amadeus/vim-convert-color-to',cmd='ConvertColorTo'}

  ----sidepannel
  use{'majutsushi/tagbar',cmd='TagbarToggle'}
  use{'itchyny/calendar.vim',cmd='Calendar'}
  use{'simnalamburt/vim-mundo',cmd='MundoToggle'}
  use{'nvim-neo-tree/neo-tree.nvim',requires='MunifTanjim/nui.nvim',config=get_config'neotree',cmd='Neotree'}
  use{'gorbit99/codewindow.nvim',config=function()
    local codewindow=require'codewindow'
    codewindow.setup()
    vim.api.nvim_create_user_command('CodeWindow',codewindow.toggle_minimap,{})
  end,cmd='CodeWindow'}

  ----search
  use{'nvim-pack/nvim-spectre',module='spectre'}
  use{'roosta/fzf-folds.vim',cmd='Folds',config=function ()
    vim.cmd[[
      if g:loaded_fzf==1
      unlet g:loaded_fzf
      source /usr/share/vim/vimfiles/plugin/fzf.vim
      endif
      ]]
  end}
  ------telescope
  use{'nvim-telescope/telescope.nvim',requires={
    'nvim-neorg/neorg-telescope',
    'nvim-telescope/telescope-symbols.nvim',
    'nvim-telescope/telescope-project.nvim',
    {'nvim-telescope/telescope-fzf-native.nvim',run='make'},
    'olacin/telescope-cc.nvim',
    'nvim-telescope/telescope-live-grep-args.nvim',
    'nvim-telescope/telescope-packer.nvim',
    {'nvim-telescope/telescope-ui-select.nvim',setup=function ()
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
    end,cmd='Telescope',module='telescope'}

  ----window
  use{'wellle/visual-split.vim',keys={{'n','<C-W>gr'},{'n','<C-W>gss'},{'n','<C-W>gsa'},
    {'n','<C-W>gsb'},{'x','<C-W>gr'},{'x','<C-W>gss'},{'x','<C-W>gsa'},{'x','<C-W>gsb'}},
    cmd=extend(cexp('VSSplit',{'Above','Below'},true),{'VSResize'})}
  use{'chrisbra/nrrwrgn',cmd=extend(cexp('NR',{'V','P','M','S','L','N'},true),{'NW','WR','NUD'})}
  use{'mattboehm/vim-accordion',cmd=cexp('Accordion',{'All','Diff','Stop','ZoomIn','ZoomOut','Once','Clear'},true)}
  use{'sindrets/winshift.nvim',config=function ()
    require'winshift'.setup{}
    for k,v in pairs({h='left',j='down',k='up',l='right'}) do
      require'utils.keymap'.nno('<C-S-'..k..'>',':WinShift '..v..'\r')
    end end,keys=mexp('n',{'<C-S-h>','<C-S-j>','<C-S-k>','<C-S-l>'})}
  use{'wesQ3/vim-windowswap',keys='\\ww'}
  use{'https://gitlab.com/yorickpeterse/nvim-window',config=function ()
    require'utils.keymap'.nno('<C-w>g ',':lua require("nvim-window").pick()\r')
  end,keys='<C-w>g<space>'}
  use{'t9md/vim-choosewin',config=function ()
    vim.g.choosewin_overlay_enable=1
    require'utils.keymap'.nno('<C-w> ',':ChooseWin\r')
  end,keys='<C-w><space>',command=':ChooseWin'}
  use{"anuvyklack/windows.nvim",config=get_setup'windows',requires={"anuvyklack/middleclass","anuvyklack/animation.nvim"},cmd='WindowsToggleAutowidth'}

  ----treesitter
  use{'nvim-treesitter/nvim-treesitter',run='vim.cmd"TSUpdate"',requires={
    'nvim-lua/plenary.nvim',
    {'hiphish/nvim-ts-rainbow2',event='User s1',config='vim.cmd"TSEnable rainbow"'},
    {'nvim-treesitter/playground',requires={'nvim-lua/popup.nvim'},cmd='TSPlaygroundToggle'},
    {'windwp/nvim-ts-autotag',event='User autotag',config='vim.cmd"TSEnable autotag"',ft='html'},
    {'mfussenegger/nvim-treehopper',module='tsht'},
    {'JoosepAlviste/nvim-ts-context-commentstring',event='User s1'}, --TODO
    {'nvim-treesitter/nvim-treesitter-refactor',keys={{'n','gR'}}},
    {'rrethy/nvim-treesitter-endwise',event='InsertEnter',config='vim.cmd"TSEnable endwise"'},
  },config=get_config'treesitter'}
  use{'ziontee113/syntax-tree-surfer',config=get_config'minimove-treesurfer',
    keys=extend(mexp('n',{'vx','vn','<A-j>','<A-k>','<A-S-k>','<A-S-j>','gF'}),mexp('x',{'<C-j>','<C-k>','<C-h>','<C-l>','<C-S-h>','<C-S-j>','<C-S-k>','<C-S-l>','<A-k>','<A-j>'})),module='syntax-tree-surfer'}

  ----other
  use{'neovim/nvim-lspconfig',config=get_config'lsp',requires={
    {'williamboman/mason.nvim',module='mason'},
    'onsails/lspkind.nvim',module='lspkind'},event='User s1'}
  use{'rbong/vim-buffest',
    cmd=extend(cexp('Reg',{'split','vsplit','tabedit','edit','pedit'}),
      extend(cexp('Qflist',{'split','vsplit','tabedit','edit'}),
        cexp('Loclist',{'split','vsplit','tabedit','edit'})))}
  use{'glepnir/dashboard-nvim',config=get_config('dashboard'),cmd={'Dashboard','DashboardNewFile'},setup=function ()
    vim.api.nvim_create_autocmd({'Vimenter'},{callback=function()
      if vim.fn.argc()==0 and vim.fn.line2byte('$')==-1 then
        vim.cmd('Dashboard')
      end end})end}
  use{'metakirby5/codi.vim',cmd=cexp('Codi',{'New','Expand','Select','Update'},true)}
  use{'ThePrimeagen/refactoring.nvim',config=function ()
    local xno=require'utils.keymap'.xno
    xno('<leader>re',[[<Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]])
    xno('<leader>rf',[[<Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]])
    xno('<leader>rv',[[<Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]])
    xno('<leader>ri',[[<Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]])
  end,keys=mexp('x',{'\\re','\\rf','\\rv','\\ri'})}
  use{'m-demare/attempt.nvim',config=get_config'attempt',keys={{'n','\\a'}}}
  use{'rcarriga/nvim-notify',setup='vim.notify=function (...) require"notify"(...) end',module='notify'}
  use{'kkharji/lspsaga.nvim',config=function ()
    require'utils.keymap'.nno('K',':Lspsaga hover_doc\r')
  end,keys={{'n','K'}}}
  use{'echasnovski/mini.nvim',config=get_config'mini'}
  use{'nmac427/guess-indent.nvim',config=get_setup'guess-indent'}
  use{'norcalli/nvim-terminal.lua',config=get_setup'terminal',ft='terminal'}
  use{'raghur/vim-ghost',run=':GhostInstall',cmd='GhostStart',config=get_rplugin()}
  use{'andweeb/presence.nvim',module='presence'}
  use{'cbochs/grapple.nvim',confog=get_setup'grapple',module='grapple'}
  use{'mickael-menu/shadowvim',opt=true}
  use{'rest-nvim/rest.nvim',opt=true} --TODO

  ----auto complete (nvim-cmp & snippy)
  use{'hrsh7th/nvim-cmp',config=get_config('cmp-nvim'),requires={
    {'dcampos/cmp-snippy',after='nvim-cmp'},
    {'dmitmel/cmp-cmdline-history',after='nvim-cmp'},
    {'f3fora/cmp-spell',after='nvim-cmp'},
    {'hrsh7th/cmp-calc',after='nvim-cmp'},
    {'hrsh7th/cmp-cmdline',after='nvim-cmp'},
    {'hrsh7th/cmp-buffer',after='nvim-cmp'},
    {'hrsh7th/cmp-nvim-lsp',after='nvim-cmp'},
    {'hrsh7th/cmp-nvim-lsp-signature-help',after='nvim-cmp'},
    {'hrsh7th/cmp-nvim-lua',after='nvim-cmp'},
    {'hrsh7th/cmp-path',after='nvim-cmp'},
    {'lukas-reineke/cmp-rg',after='nvim-cmp'},
    {'quangnguyen30192/cmp-nvim-tags',after='nvim-cmp'},
    {'ray-x/cmp-treesitter',after='nvim-cmp'},
    {'mtoohey31/cmp-fish',after='nvim-cmp'},
    {'tzachar/cmp-tabnine',run='./install.sh',after='nvim-cmp',module='cmp_tabnine'},
    {'jcdickinson/codeium.nvim',config=get_setup('codeium'),after='nvim-cmp'},
  },event={'InsertEnter','CmdlineEnter'}}
  use{'dcampos/nvim-snippy',requires='honza/vim-snippets',config=get_config'snippy',after='nvim-cmp'}

  ----improve
  use{'brglng/vim-im-select',event='User s1'}
  use{'ethanholz/nvim-lastplace',config=get_setup'nvim-lastplace'}

  ----lua utils
  use{'shoumodip/helm.nvim',module='helm'}
  use{'nvim-lua/plenary.nvim',module='plenary'}
  use{'tastyep/structlog.nvim',module='structlog'}
  use{'s1n7ax/nvim-window-picker',module='window-picker'}
  use{'rktjmp/fwatch.nvim',module='fwatch'}
  use{'edluffy/hologram.nvim',module='hologram'}
  use{'rrethy/nvim-animator',module='value_animator'}

  ----speed
  use{'Konfekt/FastFold',config=function ()
    require'utils.keymap'.nno('Z','<Plug>(FastFoldUpdate)')
  end,event='User isfolded',cmd='FastFoldUpdate',keys='Z'}

  ----git
  use{'timuntersberger/neogit',cmd='Neogit'}
  use{'rbong/vim-flog',after='vim-fugitive',cmd=cexp('Flog',{'git','split'},true)}
  use{'tpope/vim-fugitive',cmd='Git',fn='FugitiveIsGitDir'}
  use{'sindrets/diffview.nvim',cmd=cexp('Diffview',{'Open','FileHistory','Close','FocusFiles','ToggleFiles','Refresh','Log'})}

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
  use{'JellyApple102/easyread.nvim',config=get_setup('easyread',{fileTypes={'markdown','text'}}),ft={'markdown','text'}}
  use{'voldikss/vim-translator',config=get_config'translator',keys=mexp('x',{'þ','Þ'})}
  use{'potamides/pantran.nvim',cmd='Pantran'}
  use{'jbyuki/venn.nvim',cmd=extend(cexp('VBox',{'D','H','O','DO','HO'},true),{'VFill'})}
  use{'dhruvasagar/vim-table-mode',cmd='TableModeToggle'}
  use{'dbmrq/vim-ditto',cmd=extend(cexp('Ditto',{'Sent','Par','File','On','Off','Update','SentOn','ParOn','FileOn'},true),{'NoDitto','ToggleDitto'})}
  use{'reedes/vim-wordy',cmd={'Wordy','NoWordy'}}
  use{'ron89/thesaurus_query.vim',cmd=cexp('Thesaurus',{'QueryReplaceCurrentWord','QueryLookupCurrentWord','QueryReplace'},true)}
  use{'phaazon/mind.nvim',opt=true}

  ----filetype
  use{'vim-latex/vim-latex',ft='latex'}
  use{'mrcjkb/haskell-tools.nvim',ft='haskell'}
  use{'nvim-orgmode/orgmode',config=function ()
    require('orgmode').setup_ts_grammar()
    require('orgmode').setup{}
  end,ft='org'}
  use{'nvim-neorg/neorg',config=get_setup(
    'neorg',{load={
      ['core.defaults']={},
      ['core.export']={},
      ['core.export.markdown']={},
      ['core.concealer']={},
      --['core.presenter']={}, --TODO
      --['core.completion']={}, --TODO
    }}),ft='norg'}
  use{'mzlogin/vim-markdown-toc',ft='markdown'}
  use{ "iamcco/markdown-preview.nvim", run = "cd app && npm install",ft='markdown'}
  use{'weirongxu/plantuml-previewer.vim',requires='tyru/open-browser.vim',ft='puml'}
  use{'renerocksai/telekasten.nvim',cmd='Telekasten'}
  use{'aklt/plantuml-syntax',ft='puml'}
  use{'jakewvincent/mkdnflow.nvim',ft='markdown'}
  use{'scrooloose/vim-slumlord',ft='puml'}
  use{'ahmedkhalf/jupyter-nvim',ft='ipynb'}

  ----end--
  use 'wbthomason/packer.nvim'
end)
-- vim:fen:
