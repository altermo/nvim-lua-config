----init--
local function get_config(name)
  return string.format('require("config.%s")', name)
end
local function get_setup(name,conf)
  return string.format('require"%s".setup%s',name,vim.inspect(conf or {}))
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
require'packer'.startup(function (use)
  ----TEST
  use{'windwp/nvim-autopairs',module'nvim-autopairs'}
  use{'altermo/ultimate-autopair.nvim',opt=true}
  use{'00sapo/visual.nvim',config=get_setup('visual'),opt=true} --TODO
  use{'ggandor/flit.nvim',config=get_setup('flit',{labeled_modes='nvo'})}

  ----colorschm
  use{'folke/styler.nvim',config=get_setup('styler',{themes={}}),cmd='Styler'}
  use 'folke/tokyonight.nvim'
  use 'ray-x/starry.nvim'
  use{'edeneast/nightfox.nvim',event='User s1'}
  use{'projekt0n/github-nvim-theme',event='User s1'}
  use 'bluz71/vim-nightfly-colors'
  use 'matsuuu/pinkmare'
  use 'lifepillar/vim-gruvbox8'
  use 'NTBBloodbath/doom-one.nvim'
  use 'hoprr/calvera-dark.nvim'

  ----zen
  use{'folke/zen-mode.nvim',config=get_setup'zen-mode',cmd='ZenMode'}
  use{'folke/twilight.nvim',cmd='Twilight',module='twilight',config=get_setup'twilight'}
  use{'junegunn/limelight.vim',cmd='Limelight'}
  use{'koenverburg/peepsight.nvim',config=get_setup('peepsight',{'function_definition'}),cmd=cexp('Peepsight',{'Enable','Disable'},true)}

  ----visual
  ------fun
  use{'lukas-reineke/indent-blankline.nvim',config=function()
    vim.g.indent_blankline_filetype_exclude={'dashboard'}
    local ib=require'indent_blankline'
    ib.setup{show_current_context=true}
    vim.cmd.IndentBlanklineRefresh()
  end,event='User s1'}
  use{'rrethy/vim-hexokinase',run='make hexokinase',setup=function ()
    vim.g.Hexokinase_highlighters={'backgroundfull'}
  end,event='User s1'}
  use{'anuvyklack/pretty-fold.nvim',
    config=get_setup'pretty-fold',event='User isfolded'}
  --use{'karb94/neoscroll.nvim',config=get_setup'neoscroll',keys={'<C-u>','<C-d>','<C-b>','<C-f>','<C-y>','<C-e>'},module='neoscroll'}
  use{'m-demare/hlargs.nvim',config=get_setup'hlargs',event='User s1'}
  use{'winston0410/range-highlight.nvim',config=get_setup'range-highlight',requires='winston0410/cmd-parser.nvim',event='CmdlineEnter'}
  use{'nacro90/numb.nvim',config=get_setup'numb',event='CmdlineEnter'}
  use{'dbmrq/vim-redacted',cmd='Redact'}
  ------important-info
  use{'chentoast/marks.nvim',config=get_setup'marks',keys={{'n','m'},{'n','dm'}}}
  use{'smjonas/live-command.nvim',config=get_setup('live-command',{commands={Norm={cmd='norm!'},G={cmd='g'},V={cmd='v'}}}),cmd={'G','V','Norm'}}
  use{'lcheylus/overlength.nvim',config=get_setup('overlength',{enabled=false,textwidth_mode=1}),cmd='OverlengthToggle'}
  use{'azabiong/vim-highlighter',setup=function ()
    vim.g.HiSet='M<CR>'
    vim.g.HiErase='M<BS>'
    vim.g.HiClear='M<C-L>'
    vim.g.HiFind='M<tab>'
  end,keys=mexp('x',{'M<CR>','M<BS>','M<C-l>','M<Tab>'})}
  use{'Pocco81/HighStr.nvim',cmd={'HSHighlight','HSRmHighlight'}}
  use{'monkoose/matchparen.nvim',config=get_setup'matchparen',event='User s1'}
  use{'nvim-lualine/lualine.nvim',config=get_setup'lualine'}
  use{'folke/which-key.nvim',config=get_config'which-key',keys={{'n','<space>'},{'n','g'},{'n','<char-92>'}},cmd='WhichKey'}
  use{'nfrid/due.nvim',config=get_setup('due_nvim',{update_rate=1000})..';require("due_nvim").async_update(0)',event='User s1'}

  ----keys
  use{'Exafunction/codeium.vim',setup=function() --https://github.com/Exafunction/codeium.vim/issues/118
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
  use{'gennaro-tedesco/nvim-peekup',keys={{'n','<char-34><char-34>'}}}
  use{'mattn/emmet-vim',keys={{'i','<C-y>'}}}
  use{'kylechui/nvim-surround',config=get_setup'nvim-surround',keys={{'n','ys'},{'n','yS'},{'x','S'},{'x','gS'},{'n','cs'},{'n','ds'}}}
  use{'iron-e/vim-tabmode',requires='Iron-E/vim-libmodal',cmd='TabmodeEnter',keys={{'n','\\<tab>'}}}

  ----text object
  use{'s1n7ax/nvim-lazy-inner-block',config=get_setup'nvim-lazy-inner-block'}
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
  use{'phaazon/hop.nvim',config=get_setup'hop',module='hop'}
  use{'arp242/jumpy.vim',keys={'[[','<char-93><char-93>'}}
  use{'lambdalisue/lista.nvim',config=get_rplugin(),cmd='Lista'}
  use{'jeetsukumaran/vim-indentwise',keys=mexp('n',extend(cexp('[',{'-','+','=','_','%'}),cexp(']',{'-','+','=','_','%'})))}
  use{'mg979/vim-visual-multi',setup='vim.cmd"let g:VM_maps={}"',keys=extend(mexp('n',{'\\\\','<C-n>'}),{'x','<C-n>'})}
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
  use{'nanotee/zoxide.vim',cmd={'Z'}}
  use{'tyru/capture.vim',cmd='Capture'}
  use{'johmsalas/text-case.nvim',module='textcase'}

  ----buf-app
  use{'will133/vim-dirdiff',cmd='DirDiff'}
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

  ----command
  use{'acksld/muren.nvim',config=get_setup'muren',cmd=cexp('Muren',{'Toggle','Open','Close','Fresh','Unique'})}
  use{'cshuaimin/ssr.nvim',config=get_setup('ssr'),module='ssr'}
  use{'ray-x/web-tools.nvim',config=get_setup'web-tools',cmd='BrowserOpen'}
  use{'smjonas/inc-rename.nvim',config=function()
    require'inc_rename'.setup{}
    require'utils.keymap'.nno('gr',':IncRename <C-r>=expand("<cword>")\r',{noremap=true})
  end,cmd='IncRename',keys={{'n','gr'}}}
  use{'ludopinelli/comment-box.nvim',module='comment-box'}
  use{'s1n7ax/nvim-comment-frame',module='nvim-comment-frame'}
  use{'nvim-colortils/colortils.nvim',cmd="Colortils",config=get_setup'colortils'}
  use{'skywind3000/asyncrun.vim',cmd={'AsyncRun','AsyncStop'}}
  use{'michaelb/sniprun',run='bash ./install.sh',cmd=cexp('Snip',{'Run','Info','Close','Reset','Terminate','ReplMemoryClean'})}
  use{'godlygeek/tabular',cmd='Tabularize'}
  use{"ellisonleao/carbon-now.nvim", config = function() require('carbon-now').setup() end,cmd='CarbonNow'}
  use{'andrewradev/linediff.vim',cmd={'Linediff','LinediffReset'}}
  use{'jbyuki/instant.nvim',config=function ()
    vim.g.instant_username='User'
  end,opt=true}
  use{'tpope/vim-dadbod',cmd='DB'}
  use{'danymat/neogen',module='neogen',config=get_setup('neogen',{snippet_engine='snippy'}),cmd='Neogen'}
  use{'lifepillar/vim-colortemplate',opt=true}
  use{'sbdchd/neoformat',cmd='Neoformat'}
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
    'nvim-telescope/telescope-live-grep-args.nvim',
    'nvim-telescope/telescope-packer.nvim',
    {'nvim-telescope/telescope-ui-select.nvim',setup=function ()
      ---@diagnostic disable-next-line: duplicate-set-field
      function vim.ui.select(...)
        local telescope=require "telescope"
        telescope.load_extension'ui-select'
        vim.ui.select(...)
      end
    end
    },
    'lukaspietzschmann/telescope-tabs',
    'nvim-telescope/telescope-file-browser.nvim',
    'debugloop/telescope-undo.nvim',
    'otavioschwanck/telescope-alternate.nvim', --TODO: look into it
  },config=function ()
      local telescope=require'telescope'
      telescope.load_extension'fzf'
      telescope.setup{}
    end,cmd='Telescope',module='telescope'}

  ----window
  use{'wellle/visual-split.vim',keys={{'n','<C-W>gr'},{'n','<C-W>gss'},{'n','<C-W>gsa'},
    {'n','<C-W>gsb'},{'x','<C-W>gr'},{'x','<C-W>gss'},{'x','<C-W>gsa'},{'x','<C-W>gsb'}},
    cmd=extend(cexp('VSSplit',{'Above','Below'},true),{'VSResize'})}
  use{'mattboehm/vim-accordion',cmd=cexp('Accordion',{'All','Diff','Stop','ZoomIn','ZoomOut','Once','Clear'},true)}
  use{'sindrets/winshift.nvim',config=function ()
    require'winshift'.setup{}
    for k,v in pairs({h='left',j='down',k='up',l='right'}) do
      require'utils.keymap'.nno('<C-S-'..k..'>',':WinShift '..v..'\r')
    end end,keys=mexp('n',{'<C-S-h>','<C-S-j>','<C-S-k>','<C-S-l>'})}
  use{'wesQ3/vim-windowswap',keys='\\ww'}
  use{'t9md/vim-choosewin',config=function ()
    vim.g.choosewin_overlay_enable=1
    require'utils.keymap'.nno('<C-w> ',':ChooseWin\r')
  end,keys='<C-w><space>',command=':ChooseWin'}
  use{"anuvyklack/windows.nvim",config=get_setup'windows',requires={"anuvyklack/middleclass","anuvyklack/animation.nvim"},cmd='WindowsToggleAutowidth'}

  ----treesitter
  use{'nvim-treesitter/nvim-treesitter',requires={
    'nvim-lua/plenary.nvim',
    {'https://gitlab.com/HiPhish/rainbow-delimiters.nvim',event='User s1',config=function()
      vim.g.rainbow_delimiters={blacklist={'zig'}}
      vim.cmd'TSEnable rainbow'
    end},
    {'nvim-treesitter/playground',requires={'nvim-lua/popup.nvim'},cmd='TSPlaygroundToggle'},
    {'windwp/nvim-ts-autotag',event='User autotag',config='vim.cmd"TSEnable autotag"',ft='html'},
    {'mfussenegger/nvim-treehopper',module='tsht'},
    {'rrethy/nvim-treesitter-endwise',event='InsertEnter',config='vim.cmd"TSEnable endwise"'},
  },config=get_config'treesitter'}
  use{'ziontee113/syntax-tree-surfer',config=get_config'minimove-treesurfer',
    keys=extend(mexp('n',{'vx','vn','<A-j>','<A-k>','<A-S-k>','<A-S-j>','gF','gX'}),mexp('x',{'<C-j>','<C-k>','<C-h>','<C-l>','<C-S-h>','<C-S-j>','<C-S-k>','<C-S-l>','<A-k>','<A-j>','gX'})),module='syntax-tree-surfer'}

  ----other
  use{'xeluxee/competitest.nvim',requires='MunifTanjim/nui.nvim',config=get_setup'competitest',cmd='CompetiTest',opt=true} --TODO
  use{'Konfekt/FastFold',config=function ()
    require'utils.keymap'.nno('Z','<Plug>(FastFoldUpdate)')
  end,event='User isfolded',cmd='FastFoldUpdate',keys='Z'}
  use{'stevearc/stickybuf.nvim',config=get_setup'stickybuf',cmd=extend(cexp('Pin',{'Buffer','Buftype','Filetype'}),{'Unpin'})}
  use{'neovim/nvim-lspconfig',config=get_config'lsp',requires={
    {'williamboman/mason.nvim',module='mason'},
    {'kosayoda/nvim-lightbulb',module='nvim-lightbulb'},
    {'folke/neodev.nvim',module='neodev'}},event='User s1',cmd='LspStart'}
  use{'glepnir/dashboard-nvim',config=get_config('dashboard'),cmd={'Dashboard','DashboardNewFile'},setup=function ()
    vim.api.nvim_create_autocmd({'Vimenter'},{callback=function()
      if vim.fn.argc()==0 and vim.api.nvim_buf_line_count(0)==1 and vim.api.nvim_get_current_line()=='' and vim.api.nvim_buf_get_name(0)=='' then
        vim.cmd('Dashboard')
      end end})end}
  use{'rafcamlet/nvim-luapad',module='luapad',cmd='Luapad',config=get_config'luapad'}
  use{'ThePrimeagen/refactoring.nvim',config=function ()
    require'refactoring'.setup()
    local xno=require'utils.keymap'.xno
    xno('<leader>re',[[<Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]])
    xno('<leader>rf',[[<Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]])
    xno('<leader>rv',[[<Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]])
    xno('<leader>ri',[[<Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]])
  end,keys=mexp('x',{'\\re','\\rf','\\rv','\\ri'}),module='refactoring',cmd='Refactor'}
  use{'m-demare/attempt.nvim',config=get_config'attempt',keys={{'n','\\a'}}}
  use{'rcarriga/nvim-notify',setup='vim.notify=function (...) require"notify"(...) end',module='notify'}
  use{'echasnovski/mini.nvim',config=get_config'mini'}
  use{'nmac427/guess-indent.nvim',config=get_setup'guess-indent'}
  use{'norcalli/nvim-terminal.lua',config=get_setup'terminal',ft='terminal'}
  use{'raghur/vim-ghost',run=':GhostInstall',cmd='GhostStart',config=get_rplugin()}
  use{'andweeb/presence.nvim',module='presence'}
  use{'cbochs/grapple.nvim',confog=get_setup'grapple',module='grapple'}
  use{'mickael-menu/shadowvim',opt=true}
  use{'rest-nvim/rest.nvim',opt=true} --TODO

  ----auto complete (nvim-cmp & snippy)
  use{'hrsh7th/nvim-cmp',commit='6c84bc7',config=get_config('cmp-nvim'),requires={ --TODO: temp commit; https://github.com/jcdickinson/codeium.nvim/issues/80
    {'hrsh7th/cmp-cmdline',after='nvim-cmp'},
    {'dmitmel/cmp-cmdline-history',after='nvim-cmp'},
    {'dcampos/cmp-snippy',after='nvim-cmp'},
    {'f3fora/cmp-spell',after='nvim-cmp'},
    {'hrsh7th/cmp-calc',after='nvim-cmp'},
    {'hrsh7th/cmp-buffer',after='nvim-cmp'},
    {'hrsh7th/cmp-nvim-lsp',after='nvim-cmp'},
    {'hrsh7th/cmp-nvim-lsp-signature-help',after='nvim-cmp'},
    {'FelipeLema/cmp-async-path',after='nvim-cmp'},
    {'lukas-reineke/cmp-rg',after='nvim-cmp'},
    {'quangnguyen30192/cmp-nvim-tags',after='nvim-cmp' },
    {'ray-x/cmp-treesitter',after='nvim-cmp'},
    {'jcdickinson/codeium.nvim',config=get_setup('codeium'),after='nvim-cmp'},
  },event={'InsertEnter','CmdlineEnter'}}
  use{'dcampos/nvim-snippy',requires='honza/vim-snippets',config=get_config'snippy',after='nvim-cmp'}

  ----lua utils
  use{'ido-nvim/ido.nvim',module='ido'} --TODO
  use{'nvim-lua/plenary.nvim',module='plenary'}
  use{'s1n7ax/nvim-window-picker',module='window-picker'}
  use{'rktjmp/fwatch.nvim',module='fwatch'}
  use{'edluffy/hologram.nvim',module='hologram'}
  use{'rrethy/nvim-animator',module='value_animator'}

  ----git
  use{'timuntersberger/neogit',cmd='Neogit',config=get_setup'neogit'}
  use{'rbong/vim-flog',after='vim-fugitive',cmd=cexp('Flog',{'git','split'},true),requires={'tpope/vim-fugitive'}}
  use{'sindrets/diffview.nvim',cmd=cexp('Diffview',{'Open','FileHistory','Close','FocusFiles','ToggleFiles','Refresh','Log'}),
    config=get_setup('diffview',{use_icons=false})}

  ----writing
  use{'JellyApple102/easyread.nvim',config=get_setup('easyread',{fileTypes={'markdown','text'}}),ft={'markdown','text'}}
  use{'voldikss/vim-translator',config=get_config'translator',keys=mexp('x',{'þ','Þ'})} --TODO better version
  use{'potamides/pantran.nvim',cmd='Pantran'} --TODO
  use{'jbyuki/venn.nvim',cmd=extend(cexp('VBox',{'D','H','O','DO','HO'},true),{'VFill'})}
  use{'dhruvasagar/vim-table-mode',cmd='TableModeToggle'}
  use{'dbmrq/vim-ditto',cmd=extend(cexp('Ditto',{'Sent','Par','File','On','Off','Update','SentOn','ParOn','FileOn'},true),{'NoDitto','ToggleDitto'})}
  use{'reedes/vim-wordy',cmd={'Wordy','NoWordy'}}
  use{'ron89/thesaurus_query.vim',cmd=cexp('Thesaurus',{'QueryReplaceCurrentWord','QueryLookupCurrentWord','QueryReplace'},true)} --TODO
  use{'epwalsh/obsidian.nvim',config=get_setup('obsidian'),ft='markdown'}

  ----filetype
  use{'lhkipp/nvim-nu',ft='nu',config=get_setup('nu',{use_lsp_features=false})}
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
      --['core.presenter']={},
      --['core.completion']={},
    }}),ft='norg'}
  use{'mzlogin/vim-markdown-toc',ft='markdown'} --TODO: maybe better alternative
  use{ "iamcco/markdown-preview.nvim", run = "cd app && npm install",ft='markdown'}
  use{'weirongxu/plantuml-previewer.vim',requires='tyru/open-browser.vim',ft='puml'}
  use{'renerocksai/telekasten.nvim',cmd='Telekasten'}
  use{'aklt/plantuml-syntax',ft='puml'}
  use{'scrooloose/vim-slumlord',ft='puml'}
  use{'ahmedkhalf/jupyter-nvim',ft='ipynb'}
  use{'andrewradev/tagalong.vim',ft='html'}

  ----end--
  use 'wbthomason/packer.nvim'
end)
-- vim:fen:
