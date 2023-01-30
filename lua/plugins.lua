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
  --use{"anuvyklack/windows.nvim",config=get_setup'windows',requires={"anuvyklack/middleclass","anuvyklack/animation.nvim"},event='User s1'}
  use{'acksld/nvim-femaco.lua',config=get_setup'femaco',cmd='FeMaco'}
  use{'axkirillov/easypick.nvim',opt=true}
  use{'folke/styler.nvim',config=get_setup('styler',{themes={}}),cmd='Styler'}

  ----colorschm
  --use 'base16-project/base16-vim'
  --use'ray-x/starry.nvim'
  use 'everblush/everblush.nvim'
  use 'lmburns/kimbox'
  use 'mhartington/oceanic-next'--
  use 'folke/tokyonight.nvim'
  use 'challenger-deep-theme/vim'
  use 'NTBBloodbath/doom-one.nvim'
  use 'gbprod/nord.nvim'
  use 'rafamadriz/neon'
  use 'luisiacc/gruvbox-baby'
  use{'edeneast/nightfox.nvim',event='User s1'}
  use{'fenetikm/falcon',event='User s1'}
  use 'ellisonleao/gruvbox.nvim'
  use 'kuznetsss/meadow-nvim'
  use 'matsuuu/pinkmare'
  use 'jaredgorski/spacecamp'
  use{'vigoux/oak',event='User s1'}
  use 'mjlbach/onedark.nvim'
  use{'folke/lsp-colors.nvim',event='User s1'}
  use'bluz71/vim-nightfly-colors'
  use'rakr/vim-one'

  ----zen
  use{'folke/zen-mode.nvim',config=get_setup'zen-mode',cmd='ZenMode'}
  use{'folke/twilight.nvim',cmd='Twilight',module='twilight',config=get_setup'twilight'}
  use{'pocco81/truezen.nvim',cmd={'TZMinimalist','TZFocus','TZAtaraxis'}}
  use{'junegunn/limelight.vim',cmd='Limelight'}
  use{'koenverburg/peepsight.nvim',config=get_setup('peepsight',{'function_definition'}),cmd=cexp('Peepsight',{'Enable','Disable'},true)}

  ----visual
  use{'smjonas/live-command.nvim',config=get_setup('live-command',{commands={Norm={cmd='norm!'},G={cmd='g'},V={cmd='v'}}}),cmd={'G','V','Norm'}}
  use{'lukas-reineke/indent-blankline.nvim',config=get_setup('indent_blankline',{show_current_context=true})}
  use{'rrethy/vim-hexokinase',run='make hexokinase',setup=function ()
    vim.g.Hexokinase_highlighters={'backgroundfull'}
  end,event='User s1'}
  use{'anuvyklack/pretty-fold.nvim',
    config=get_setup'pretty-fold',event='User isfolded'}
  use{'azabiong/vim-highlighter',setup=function ()
    vim.g.HiSet='M<CR>'
    vim.g.HiErase='M<BS>'
    vim.g.HiClear='M<C-L>'
    vim.g.HiFind='M<tab>'
  end,keys=mexp('x',{'M<CR>','M<BS>','M<C-l>','M<Tab>'})}
  use{'Pocco81/HighStr.nvim',cmd={'HSHighlight','HSRmHighlight'}}
  use{'lcheylus/overlength.nvim',config=get_setup('overlength',{enabled=false,textwidth_mode=1}),cmd='OverlengthToggle'}
  use{'monkoose/matchparen.nvim',config=get_setup'matchparen',event='User s1'}
  use{'https://gitlab.com/yorickpeterse/nvim-pqf',config=get_setup'pqf',event='User qfopen'}
  use{'nvim-lualine/lualine.nvim',config=get_setup('lualine',{options={theme='powerline'}})}
  use{'karb94/neoscroll.nvim',config=get_setup'neoscroll',keys={'<C-u>','<C-d>','<C-b>','<C-f>','<C-y>','<C-e>'},module='neoscroll'}
  use{'0styx0/abbreinder.nvim',requires='0styx0/abbremand.nvim',config=get_setup'abbreinder',event='User s1'}
  use{'folke/which-key.nvim',config=get_config'which-key',keys={{'n','<space>'},{'n','g'},{'n','<char-92>'}},cmd='WhichKey'}
  use{'winston0410/range-highlight.nvim',config=get_setup'range-highlight',requires='winston0410/cmd-parser.nvim',event='CmdlineEnter'}
  use{'nacro90/numb.nvim',config=get_setup'numb',event='CmdlineEnter'}
  use{'mattesgroeger/vim-bookmarks',keys=mexp('n',{'mg','mjj','mkk','mx','mc','mp','mn','mi','mm','ma'})}
  use{'luukvbaal/stabilize.nvim',config=get_setup'stabilize',event='User s1'} --TODO: wait
  use{'kevinhwang91/nvim-hlslens',config=get_config'hlslens',event='CmdlineEnter'}
  use{'nfrid/due.nvim',config=get_setup('due_nvim',{update_rate=1000})..';require("due_nvim").async_update(0)',event='User s1'}
  use{'m-demare/hlargs.nvim',config=get_setup'hlargs',event='User s1'}
  use{'mawkler/modicator.nvim',config=get_setup'modicator',after='mini.nvim',opt=true} --TODO

  ----syntax
  use{'nvim-neorg/neorg',config=get_setup(
    'neorg',{load={
      ['core.defaults']={},
      ['core.export']={},
      ['core.export.markdown']={},
      ['core.norg.concealer']={},
      --['core.presenter']={}, --TODO
      --['core.norg.completion']={}, --TODO
    }}),ft='norg'}
  use{'neovim/nvim-lspconfig',config=get_config'lsp'..';vim.cmd"doautocmd BufReadPost"',requires={
    {'williamboman/nvim-lsp-installer',module='nvim-lsp-installer'},
    'onsails/lspkind.nvim',module='lspkind'},event='User s1'}
  use{'nvim-orgmode/orgmode',config=function ()
    require('orgmode').setup_ts_grammar()
    require('orgmode').setup{}
  end,ft='org'}

  ----keys
  use{'junegunn/vim-easy-align',config=function ()
    local k=require 'utils.keymap'
    k.nno('gb','<Plug>(LiveEasyAlign)')
    k.xno('gb','<Plug>(LiveEasyAlign)')
  end,keys={{'x','gb'},{'n','gb'}},cmd={'EasyAlign','LiveEasyAlign'}}
  use{'ap/vim-you-keep-using-that-word',keys={{'n','cw'},{'n','cW'}}}
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
  end,key=mexp('n',{'>a','<a'})}
  use{'gbprod/yanky.nvim',config=get_config'yanky',event='TextYankPost',
    keys=extend(mexp('n',{'p','P','<A-p>','<A-P>','<C-p>','<C-n>'}),{{'x','p'},{'x','P'}})}
  use{'abecodes/tabout.nvim',config=get_setup('tabout',{tabkey='<A-tab>',backwards_tabkey='<A-S-tab>',act_as_tab=false}),keys={{'i','<A-tab>'},{'i','<A-S-tab>'}}}
  use{'allendang/nvim-expand-expr',config=function ()
    require'utils.keymap'.nno('gE',':lua require"expand_expr".expand()\r')
  end,keys={{'n','gE'}}}
  use{'acksld/nvim-trevj.lua',config=function ()
    require'utils.keymap'.nno('gS',':lua require("trevj").format_at_cursor()\r')
  end,keys={{'n','gS'}}}
  use{'andrewradev/switch.vim',keys='gs',cmd=cexp('Switch',{'Extend','Reverse'},true)}
  use{'andrewradev/splitjoin.vim',keys='gJ',setup=function ()
    vim.g.splitjoin_split_mapping='<nul>'
  end}
  --use{'windwp/nvim-autopairs',config=get_config'autopairs',event='InsertEnter'}
  use{'monaqa/dial.nvim',config=get_config'dial',keys={{'n','<C-a>'},{'n','<C-x>'},{'x','<C-a>'},{'x','<C-x>'}}}
  use{'ghillb/cybu.nvim',config=function ()
    require'cybu'.setup{style={devicons={enabled=false}}}
    local nno=require'utils.keymap'.nno
    nno('[b','<Plug>(CybuPrev)')
    nno(']b','<Plug>(CybuNext)')
    nno('[B','<plug>(CybuLastusedPrev)')
    nno(']B','<plug>(CybuLastusedNext)')
  end,keys={{'n',']b'},{'n','[b'},{'n',']B'},{'n','[B'}}}
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
  use{'justinmk/vim-sneak',keys={{'n','s'}}}
  use{'johmsalas/text-case.nvim',module='textcase'}
  use{'rrethy/vim-tranquille',keys='g/',config=function ()
    require'utils.keymap'.nno('g/','<Plug>(tranquille_search)')
  end}
  use{'xiyaowong/accelerated-jk.nvim',config=function ()
    require('accelerated-jk').setup{}
    local xno=require'utils.keymap'.xno
    xno('j','<cmd>lua require"accelerated-jk".command("gj")\r')
    xno('k','<cmd>lua require"accelerated-jk".command("gk")\r')
  end,keys={{'n','j'},{'n','k'},{'x','j'},{'x','j'}}}
  use{'iron-e/vim-tabmode',requires='Iron-E/vim-libmodal',cmd='TabmodeEnter',keys={{'n','\\<tab>'}}}

  ----text object
  use{'s1n7ax/nvim-lazy-inner-block',config=get_setup'nvim-lazy-inner-block'}
  use{'michaeljsmith/vim-indent-object',keys=extend(moa'i',moa'I')}
  use{'coderifous/textobj-word-column.vim',keys=extend(moa'c',moa'C')}
  use{'deathlyfrantic/vim-textobj-blanklines',requires='kana/vim-textobj-user',keys=moa'<space>'}
  use{'Julian/vim-textobj-variable-segment',keys=moa'v'}
  use{'junegunn/vim-after-object',opt=true}

  ----movement
  use{'phaazon/hop.nvim',config=get_setup'hop',module='hop'}
  use{'rhysd/clever-f.vim',config=function ()
    vim.g.clever_f_smart_case=1
    vim.g.clever_f_mark_direct=1
    require'utils.keymap'.nno('<esc>','<Plug>(clever-f-reset)')
  end,keys=extend(mexp('n',{'f','t','F','T'}),mexp('x',{'f','t','F','T'}))}
  use{'arp242/jumpy.vim',keys={'[[','<char-93><char-93>'}}
  use{'lambdalisue/lista.nvim',config=get_rplugin(),cmd='Lista'}
  use{'ripxorip/aerojump.nvim',config=get_rplugin(),cmd='Aerojump'}
  use{'t9md/vim-smalls',cmd={'Smalls','SmallsExcursion'}}
  use{'jeetsukumaran/vim-indentwise',keys=mexp('n',extend(cexp('[',{'-','+','=','_','%'}),cexp(']',{'-','+','=','_','%'})))}
  use{'mg979/vim-visual-multi',setup='vim.cmd"let g:VM_maps={}"',opt=true} --TODO

  ----utils
  use{'kazhala/close-buffers.nvim',cmd={'BDelete','BWipeout'}}
  use{'tpope/vim-eunuch',cmd={'Cfind','Chmod','Clocate','Copy',
    'Delete','Duplicate','Lfind','Llocate','Mkdir','Move','Remove',
    'Rename','SudoEeit','SudoWrite','Unlink','W','Wall'}}
  use{'tpope/vim-abolish',cmd={'Abolish','Subvert'},keys={{'n','cr'}}}
  use{'sqve/sort.nvim',cmd='Sort'}
  use{'simonefranza/nvim-conv',cmd=cexp('Conv',{'Bin','Dec','Hex','Oct','Farenheit',
    'Celsius','Str','Bytes','MetricImperial','DataTransRate','Color','SetPrecision'})}
  use{'nanotee/zoxide.vim',cmd={'Z','Zi'}}
  use{'tyru/capture.vim',cmd='Capture'}

  ----command
  use{'smjonas/inc-rename.nvim',config=function()
    require 'inc_rename'.setup{}
    require'utils.keymap'.nno('gr',':IncRename <C-r>=expand("<cword>")\r',{noremap=true})
  end,cmd='IncRename',keys={{'n','gr'}}}
  use{'micmine/jumpwire.nvim',module='jumpwire'}
  use{'will133/vim-dirdiff',cmd='DirDiff'}
  use{'ludopinelli/comment-box.nvim',module='comment-box'}
  use{'s1n7ax/nvim-comment-frame',module='nvim-comment-frame'}
  use{'voldikss/vim-floaterm',cmd='FloatermToggle'}
  use{'nvim-colortils/colortils.nvim',cmd="Colortils",config=get_setup'colortils'}
  use{'nyngwang/neononame.lua',cmd='NeoNoName'}
  use{'nvim-pack/nvim-spectre',module='spectre'}
  use{'ThePrimeagen/harpoon',requires='nvim-lua/plenary.nvim',module='harpoon'} --TODO
  use{'wellle/visual-split.vim',keys={{'n','<C-W>gr'},{'n','<C-W>gss'},{'n','<C-W>gsa'},
    {'n','<C-W>gsb'},{'x','<C-W>gr'},{'x','<C-W>gss'},{'x','<C-W>gsa'},{'x','<C-W>gsb'}},
    cmd=extend(cexp('VSSplit',{'Above','Below'},true),{'VSResize'})}
  use{'skywind3000/asyncrun.vim',cmd={'AsyncRun','AsyncStop'}}
  use{'kassio/neoterm',cmd={'T','Tnew','Topen','Texec'}}
  use{'elihunter173/dirbuf.nvim',cmd='Dirbuf',setup=function()
    vim.api.nvim_create_autocmd('BufEnter',{
      command="if isdirectory(expand('%')) && !&modified|execute 'Dirbuf'|endif"
    })end}
  use{'skywind3000/asynctasks.vim',cmd=cexp('AsyncTask',{'Edit','Last','List','Macro','Profile'},true)}
  use{'michaelb/sniprun',run='bash ./install.sh',cmd=cexp('Snip',{'Run','Info','Close','Reset','Terminate','ReplMemoryClean'})}
  use{'nyngwang/NeoWell.lua',config=get_setup'neo-well',cmd=cexp('NeoWell',{'Toggle','Append','Jump','Edit','Out','WipeOut'})}
  use{'rbtnn/vim-mario',requires='rbtnn/vim-game_engine',cmd='Mario'}
  use{'rbtnn/vim-puyo',requires='rbtnn/vim-game_engine',cmd='Puyo'}
  use{'alec-gibson/nvim-tetris',cmd='Tetris'}
  use{'seandewar/killersheep.nvim',cmd='KillKillKill'}
  use{'seandewar/nvimesweeper',cmd='Nvimesweeper'}
  use{'toppair/reach.nvim',cmd='ReachOpen'}
  use{'godlygeek/tabular',cmd='Tabularize'}
  use {"ellisonleao/carbon-now.nvim", config = function() require('carbon-now').setup() end,cmd='CarbonNow'}
  use{'mattboehm/vim-accordion',cmd=cexp('Accordion',{'All','Diff','Stop','ZoomIn','ZoomOut','Once','Clear'},true)}
  use{'andrewradev/linediff.vim',cmd={'Linediff','LinediffReset'}}
  use{'jbyuki/instant.nvim',config=function ()
    vim.g.instant_username='UsEr'
  end} --NULL
  use{'tpope/vim-dadbod',cmd='DB'}
  use 'dosimple/workspace.vim' --NULL
  use{'danymat/neogen',module='neogen',config=get_setup('neogen',{snippet_engine='snippy'})}
  use{'https://gitlab.com/Groctel/jobsplit.nvim',cmd='Jobsplit'}
  use{'chrisbra/nrrwrgn',cmd=extend(cexp('NR',{'V','P','M','S','L','N'},true),{'NW','WR','NUD'})}
  use{'skywind3000/vim-rt-format',cmd='RTFormatEnable'}
  use{'lifepillar/vim-colortemplate',opt=true}
  use{'pianocomposer321/project-templates.nvim',cmd={'LoadTemplate','DeleteTemplate','SaveAsTemplate'}}
  use{'tommcdo/vim-express',cmd={'MapExpress','MapSubpress'}}
  use{'mtth/scratch.vim',cmd=cexp('Scratch',{'Insert','Preview','Selection'},true),setup=function ()
    vim.g.scratch_no_mappings=1
  end}
  use{'powerman/vim-plugin-ansiesc',cmd='AnsiEsc'}
  use{'sbdchd/neoformat',cmd='Neoformat'}
  use{'shinglyu/vim-codespell',cmd='Codespell'}
  use{'felipec/notmuch-vim',cmd='NotMuch'}
  use{'rraks/pyro',cmd='Pyro',config=get_rplugin(),setup=function ()
    vim.g.pyro_macro_path='/home/user/.macro'
  end}
  use{'ntbbloodbath/color-converter.nvim',opt=true}
  use{'amadeus/vim-convert-color-to',cmd='ConvertColorTo'}
  use{'roosta/fzf-folds.vim',cmd='Folds'}
  use{'everduin94/nvim-quick-switcher',module='nvim-quick-switcher'}
  use{'stevearc/stickybuf.nvim',cmd=extend(cexp('Pin',{'Buffer','Buftype','Filetype'}),{'UnpinBuffer'})}

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

  ----telescope
  use{'nvim-telescope/telescope.nvim',requires={
    'nvim-neorg/neorg-telescope',
    'nvim-telescope/telescope-symbols.nvim',
    'tom-anders/telescope-vim-bookmarks.nvim',
    'nvim-telescope/telescope-project.nvim',
    {'nvim-telescope/telescope-fzf-native.nvim',run='make'},
    'olacin/telescope-cc.nvim',
    'nvim-telescope/telescope-github.nvim',
    'nvim-telescope/telescope-live-grep-args.nvim',
    'nvim-telescope/telescope-packer.nvim',
    {'nvim-telescope/telescope-rs.nvim',opt=true},
    {'nvim-telescope/telescope-ui-select.nvim',setup=function ()
      function vim.ui.select(...)
        local telescope=require "telescope"
        telescope.load_extension'ui-select'
        vim.ui.select(...)
      end
    end
    },
    'olacin/telescope-gitmoji.nvim',
    'tc72/telescope-tele-tabby.nvim',
    'nvim-telescope/telescope-file-browser.nvim',
    'GustavoKatel/telescope-asynctasks.nvim',
    'nvim-telescope/telescope-hop.nvim',
    'debugloop/telescope-undo.nvim',
  },config=function ()
      local telescope=require'telescope'
      telescope.load_extension'fzf'
      telescope.setup{
        defaults={mappings={i={
          ['<C-h>']=function (...)telescope.extensions.hop.hop(...)end
        }}}}
    end,cmd='Telescope',module='telescope'}

  ----window
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

  ----treesitter
  use{'nvim-treesitter/nvim-treesitter',run='vim.cmd"TSUpdate"',requires={
    'nvim-lua/plenary.nvim',
    {'p00f/nvim-ts-rainbow',event='User s1',config='vim.cmd"TSEnable rainbow"'},
    {'nvim-treesitter/playground',requires={'nvim-lua/popup.nvim'},cmd='TSPlaygroundToggle'},
    {'theHamsta/nvim-treesitter-pairs',event='User s1'},
    {'windwp/nvim-ts-autotag',event='User autotag',config='vim.cmd"TSEnable autotag"',ft='html'},
    {'mfussenegger/nvim-treehopper',module='tsht'},
    {'JoosepAlviste/nvim-ts-context-commentstring',event='User s1'},
    {'nvim-treesitter/nvim-treesitter-refactor',config='vim.cmd"TSEnable refactor"',opt=true}, --TODO
    {'rrethy/nvim-treesitter-endwise',opt=true}, --TODO
  },config=get_config'treesitter'}
  use{'booperlv/nvim-gomove',config=get_setup('gomove',{map_defaults=false}),keys=extend(mexp('n',{'<Plug>GoNDLineDown','<Plug>GoNDLineUp','<Plug>GoNMLineDown','<Plug>GoNMLineUp'}),mexp('x',{'<Plug>GoVDLineDown','<Plug>GoVDLineUp','<Plug>GoVMLineDown','<Plug>GoVMLineUp','<Plug>GoVSDDown','<Plug>GoVSDLeft','<Plug>GoVSDRight','<Plug>GoVSDUp','<Plug>GoVSMDown','<Plug>GoVSMLeft','<Plug>GoVSMRight','<Plug>GoVSMUp'}))} --not treesitter
  use{'ziontee113/syntax-tree-surfer',config=get_config'gomove-treesurfer',
    keys=extend(mexp('n',{'vx','vn','<A-j>','<A-k>','<A-S-k>','<A-S-j>','<C-S-o>','gFu','gFe','gFo','gFv','gFs','gFi','gFa','<A-i>','<A-o>'}),mexp('x',{'<C-j>','<C-k>','<C-h>','<C-l>','<C-S-h>','<C-S-j>','<C-S-k>','<C-S-l>','<A-k>','<A-j>','<A-S-k>','<A-S-j>'})),module='syntax-tree-surfer'}

  ----other
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
  use{'ahmedkhalf/notif.nvim',opt=true}
  use{'m-demare/attempt.nvim',config=get_config'attempt',keys=mexp('n',{'\\an','\\ai','\\ar','\\ad','\\ac','\\al'})}
  use{'rcarriga/nvim-notify',setup='vim.notify=function (...) require"notify"(...) end',module='notify'}
  use{'kkharji/lspsaga.nvim',config=function ()
    require'utils.keymap'.nno('K',':Lspsaga hover_doc\r')
  end,keys={{'n','K'}}}
  use{'echasnovski/mini.nvim',config=get_config'mini'}
  use{'shaeinst/penvim',config=get_setup('penvim',{rooter={enable=false},project_env={enable=false}})}
  use 'wsdjeg/vim-fetch'
  use{'norcalli/nvim-terminal.lua',ft='terminal'}
  use{'raghur/vim-ghost',run=':GhostInstall',cmd='GhostStart',config=get_rplugin()}
  use{'andweeb/presence.nvim',module='presence'}

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
    {'tzachar/cmp-fuzzy-buffer',requires='tzachar/fuzzy.nvim',after='nvim-cmp'},
    {'tzachar/cmp-tabnine',run='./install.sh',after='nvim-cmp',module='cmp_tabnine'},
  },event={'InsertEnter','CmdlineEnter'}}
  use{'dcampos/nvim-snippy',requires='honza/vim-snippets',config=get_config'snippy',after='nvim-cmp'}

  ----improve
  use{'antoinemadec/FixCursorHold.nvim',event='User s1'} --TODO: wait
  use{'brglng/vim-im-select',event='User s1'}
  use{'jghauser/mkdir.nvim',event='User s1'}
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
  use 'lewis6991/impatient.nvim'
  use{'Konfekt/FastFold',config=function ()
    require'utils.keymap'.nno('Z','<Plug>(FastFoldUpdate)')
  end,event='User isfolded',cmd='FastFoldUpdate',keys='Z'}

  ----git
  use{'timuntersberger/neogit',cmd='Neogit'}
  use{'rbong/vim-flog',setup=function ()
    local function create_cmd(cmd)
      vim.api.nvim_create_user_command(cmd,[[
lua require"packer.load"({"vim-fugitive"},{},_G.packer_plugins)
require"packer.load"({"vim-flog"},{cmd="]]..cmd..[[",l1=<line1>,l2=<line2>,bang=<q-bang>,args=<q-args>,mods="<mods>"},_G.packer_plugins)]],
        {nargs='*',range=true,bang=true,complete='file'})
    end
    create_cmd'Flog'
    create_cmd'Flogsplit'
    create_cmd'Floggit'
  end,opt=true}
  use{'tpope/vim-fugitive',opt=true}
  use{'sindrets/diffview.nvim',cmd=cexp('Diffview',{'Open','FileHistory','Close','FocusFiles','ToggleFiles','Refresh','Log'})}

  ----markdown
  use{'mzlogin/vim-markdown-toc',ft='markdown'}
  use{ "iamcco/markdown-preview.nvim", run = "cd app && npm install",ft='markdown'}
  use{'renerocksai/telekasten.nvim',cmd='Telekasten'}
  use{'weirongxu/plantuml-previewer.vim',requires='tyru/open-browser.vim',ft='puml'}
  use{'aklt/plantuml-syntax',ft='puml'}
  use{'jakewvincent/mkdnflow.nvim',ft='markdown'}
  use{'scrooloose/vim-slumlord',ft='puml'}
  use{'ahmedkhalf/jupyter-nvim',ft='ipynb'}

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
  --]]

  ----writing
  use{'rexagod/samwise.nvim',cmd=cexp('Samwise',{'MoveBack','MoveFwd','ToggleBuffer','ToggleHighlight'})}
  use{'dbmrq/vim-ditto',cmd=extend(cexp('Ditto',{'Sent','Par','File','On','Off','Update','SentOn','ParOn','FileOn'},true),{'NoDitto','ToggleDitto'})}
  use{'dhruvasagar/vim-table-mode',cmd='TableModeToggle'}
  use{'voldikss/vim-translator',config=get_config'translator'} --NULL
  use{'rhysd/vim-grammarous',cmd={'GrammarousCheck','GrammarousReset'}}
  use{'kabbamine/lazylist.vim',cmd='LazyList'}
  use{'fmoralesc/vim-pad',config=function ()
    vim.g['pad#dir']='/home/user/.pad'
  end,cmd='Pad'}
  use{'ron89/thesaurus_query.vim',cmd=cexp('Thesaurus',{'QueryReplaceCurrentWord','QueryLookupCurrentWord','QueryReplace'},true)}
  use{'reedes/vim-wordy',cmd='Wordy'}
  use{'jbyuki/venn.nvim',cmd=extend(cexp('VBox',{'D','H','O','DO','HO'},true),{'VFill'})}

  ----end--
  use 'wbthomason/packer.nvim'
end)
-- vim:fen:
