----init--
local function get_config(name)
  return string.format('require("config.%s")', name)
end
local function get_setup(name,conf)
  return string.format('require"%s".setup%s',name,vim.inspect(conf or {}))
end
local function expander(part,exp,inc)
    local ret={}
    if inc then ret[#ret+1]=part end
    for _,i in pairs(exp) do
        ret[#ret+1]=part..i
    end
    return ret
end
require('packer').startup(function(use)

----test
use 'rlane/pounce.nvim' --TODO
use{'justinmk/vim-sneak',disable=true} --TODO
use{'ggandor/lightspeed.nvim',disable=true} --TODO
use 'ggandor/leap.nvim' --TODO
use{'matbme/JABS.nvim',config=get_setup'jabs'} --TODO
use{'skywind3000/asynctasks.vim',cmd=expander('AsyncTask',{'Edit','Last','List','Macro','Profile'},true)} --TODO

----ui creator
use 'muniftanjim/nui.nvim' --TODO
use 'skywind3000/vim-quickui' --TODO
use 'anuvyklack/hydra.nvim' --TODO

----list
use{'dkarter/bullets.vim',config=function ()
    vim.g.bullets_enabled_file_types={'*'}
    vim.g.bullets_set_mappings=1
    end}
use{'lervag/vim-rainbow-lists',config=function ()
    vim.api.nvim_create_autocmd('FileType',{command='RBListEnable'})
    end}
use{'lervag/lists.vim',config=function ()
    vim.g.lists_filetypes={'*'}
    end}
use 'kabbamine/lazylist.vim'

----colorschem
--use 'base16-project/base16-vim'
use 'lmburns/kimbox'
use 'mhartington/oceanic-next'
use 'ghifarit53/tokyonight-vim'
use 'challenger-deep-theme/vim'
use 'rmehri01/onenord.nvim'
use 'wittyjudge/gruvbox-material.nvim'
use 'NTBBloodbath/doom-one.nvim'
use 'catppuccin/nvim'
use 'shaunsingh/nord.nvim'
use 'rafamadriz/neon'
use 'luisiacc/gruvbox-baby'
use 'edeneast/nightfox.nvim'
use 'fenetikm/falcon'
use 'yong1le/darkplus.nvim'
use 'ellisonleao/gruvbox.nvim'
use 'vim-conf-live/vimconflive2021-colorscheme'
use 'yuttie/hydrangea-vim'
use{'mjlbach/onedark.nvim',config='vim.cmd"colorschem onedark"'}

----look
use{'anuvyklack/pretty-fold.nvim',requires='anuvyklack/nvim-keymap-amend',
    config=get_setup'pretty-fold'..get_setup'pretty-fold.preview',event='User isfolded'}
use 'itchyny/vim-cursorword'
use{'norcalli/nvim-colorizer.lua',config=get_setup('colorizer',{'*'})}
use{'ntpeters/vim-better-whitespace',config=function ()
    vim.g.better_whitespace_filetypes_blacklist={'dashboard','qf','term'}
    end}
use{'azabiong/vim-highlighter',setup=function ()
    vim.g.HiSet='M<CR>'
    vim.g.HiErase='M<BS>'
    vim.g.HiClear='M<C-L>'
    vim.g.HiFind='M<tab>'
    end,keys={'M<CR>','M<BS>','M<C-l>','M<Tab>'}}
use 'Pocco81/HighStr.nvim'
use 'folke/lsp-colors.nvim'

----visual
use{'haringsrob/nvim_context_vt',config=get_setup'nvim_context_vt'}
use{'sunjon/Shade.nvim',config=get_setup'shade',module='shade'}
use{'https://gitlab.com/yorickpeterse/nvim-pqf',config=get_setup'pqf'}
use{'folke/zen-mode.nvim',config=get_setup'zen-mode',requires='folke/twilight.nvim'}
use{'nvim-lualine/lualine.nvim',config=get_setup('lualine',{options={theme='powerline'}})}
use{'karb94/neoscroll.nvim',config=get_setup'neoscroll'}
use{'beauwilliams/focus.nvim',config=get_setup('focus',{autoresize=false})}
use{'0styx0/abbreinder.nvim',requires='0styx0/abbremand.nvim',config=get_setup'abbreinder'} --MD
use{'monkoose/matchparen.nvim',config=get_setup'matchparen'}
use 'tversteeg/registers.nvim'
use{'folke/which-key.nvim',config=get_config'which-key'}
use{'winston0410/range-highlight.nvim',config=get_setup'range-highlight',requires='winston0410/cmd-parser.nvim'}
use{'mattesgroeger/vim-bookmarks',keys={'mg','mjj','mkk','mx','mc','mp','mn','mi','mm','ma'}}
use{'nacro90/numb.nvim',config=get_setup'numb'}
use {'bennypowers/nvim-regexplainer',
    config=get_setup('regexplainer',{auto=true,filetypes={'*'}}),
    requires={'nvim-treesitter/nvim-treesitter','MunifTanjim/nui.nvim'},setup=function ()
        REGEXPLAINER=vim.api.nvim_create_autocmd('CursorMoved',{command='lua local a,_=require"regexplainer.utils.treesitter".get_regexp_pattern_at_cursor() if a then vim.api.nvim_del_autocmd(REGEXPLAINER) vim.api.nvim_exec_autocmds("User",{pattern="regexplainer"}) end'})
    end,event='User regexplainer'}
use{'luukvbaal/stabilize.nvim',config=get_setup'stabilize'}
use{'kevinhwang91/nvim-hlslens',config=function ()
    vim.api.nvim_set_keymap('n','n',[[n<Cmd>lua require('hlslens').start()<CR>]],{noremap=true,silent=true})
    vim.api.nvim_set_keymap('n','N',[[N<Cmd>lua require('hlslens').start()<CR>]],{noremap=true,silent=true})
    vim.api.nvim_set_keymap('n','*',[[*<Cmd>lua require('hlslens').start()<CR>]],{noremap=true,silent=true})
    vim.api.nvim_set_keymap('n','#',[[#<Cmd>lua require('hlslens').start()<CR>]],{noremap=true,silent=true})
    vim.api.nvim_set_keymap('n','g*',[[g*<Cmd>lua require('hlslens').start()<CR>]],{noremap=true,silent=true})
    vim.api.nvim_set_keymap('n','g#',[[g#<Cmd>lua require('hlslens').start()<CR>]],{noremap=true,silent=true})
    end}
use 'nagy135/visualmark-nvim'

----replace
use{'filipdutescu/renamer.nvim',config=function ()
    require'renamer'.setup{with_popup=false}
    vim.keymap.set('n','gr',':lua require"renamer".rename()\r')
    end}
use{'brooth/far.vim',cmd=vim.fn.extend(expander('Far',{'do','r','f','p','undo'},true),{'F','Refar'})} --MD

----syntax
use{'nvim-neorg/neorg',config=get_setup(
    'neorg',{load={
        ['core.defaults']={},
        ['core.export']={},
        ['core.export.markdown']={},
        ['core.norg.concealer']={},
        ['core.integrations.telescope']={},
    }})}
use{'neovim/nvim-lspconfig',config=get_config'lsp',requires={
    'williamboman/nvim-lsp-installer',
    'onsails/lspkind.nvim'}}
use{'nvim-orgmode/orgmode',config=get_setup'orgmode'}

----keys
use 'tpope/vim-characterize'
use 'tommcdo/vim-exchange'
use{'AndrewRadev/sideways.vim',config=function ()
    vim.keymap.set('n','>a',':SidewaysRight\r',{silent=true})
    vim.keymap.set('n','<a',':SidewaysLeft\r',{silent=true})
    vim.keymap.set('n','>A',':SidewaysJumpRight\r',{silent=true})
    vim.keymap.set('n','<A',':SidewaysJumpLeft\r',{silent=true})
    end}
use{'zef/vim-cycle',config=function ()
    vim.g.cycle_no_mappings=true
    vim.keymap.set('n','g<C-a>','<Plug>CycleNext')
    vim.keymap.set('n','g<C-x>','<Plug>CyclePrevious')
    end}
use{'gbprod/yanky.nvim',config=function ()
    require'yanky'.setup{}
    vim.keymap.set('n','p','<Plug>(YankyPutAfter)')
    vim.keymap.set('n','P','<Plug>(YankyPutBefore)')
    vim.keymap.set('x','p','<Plug>(YankyPutAfter)')
    vim.keymap.set('x','P','<Plug>(YankyPutBefore)')
    vim.keymap.set('n','<A-p>','<Plug>(YankyCycleForward)')
    vim.keymap.set('n','<A-P>','<Plug>(YankyCycleBackward)')
    vim.keymap.set('n','<C-p>',':wshada\r')
    vim.keymap.set('n','<C-n>',':rshada\r')
    require'telescope'.load_extension'yank_history'
    end}
use{'abecodes/tabout.nvim',config=get_setup('tabout',{tabkey='<A-tab>',backwards_tabkey='<A-S-tab>',act_as_tab=false})}
use{'mizlan/iswap.nvim',config=function ()
    vim.keymap.set('n','gh',':ISwapWith\r')
    vim.keymap.set('n','gH',':ISwap\r')
    end}
use{'allendang/nvim-expand-expr',config=function ()
    vim.keymap.set('n','gE',':lua require"expand_expr".expand()\r')
    end}
use{'acksld/nvim-trevj.lua',config=function ()
    vim.keymap.set('n','gS',':lua require("trevj").format_at_cursor()\r')
    end}
use{'andrewradev/switch.vim',keys='gs',cmd=expander('Switch',{'Extend','Reverse'},true)}
use{'andrewradev/splitjoin.vim',keys={'gR','gJ'}}
use{'tpope/vim-surround',keys={{'n','ds'},{'n','cs'},{'n','cS'},{'n','ys'},{'n','yS'},{'n','yss'},
    {'n','ySs'},{'n','ySS'},{'n','gS'},'<C-S>','<C-G>s','<C-G>S','<Plug>VSurround'},setup=function ()
    vim.keymap.set('x','&','<Plug>VSurround')
    vim.keymap.set('x','&?','<esc>`>a?<esc>`<i¿<esc>')
    vim.keymap.set('x','&!','<esc>`>a!<esc>`<i¡<esc>')
    end}
use{'tommcdo/vim-lion',keys={{'v','gl'},{'n','gl'},{'v','gL'},{'n','gL'}}}
use{'windwp/nvim-autopairs',config=function ()
    local npairs=require'nvim-autopairs'
    npairs.setup{map_cr=false,fast_wrap={chars={'{','[','(','"',"'",'`'}}}
    local rule=require('nvim-autopairs.rule')
    npairs.add_rule(rule("'''","'''","python"))
    local cond=require('nvim-autopairs.conds')
    npairs.add_rule(rule('=','=','lua'):with_pair(cond.before_regex('[[]=*$',-1)))
    npairs.add_rule(rule('/*','*/',{'c','cpp','java','javascript','rust','php','haskell','go'}))
    end}
use{'monaqa/dial.nvim',config=function ()
    vim.api.nvim_set_keymap("n","<C-a>",require("dial.map").inc_normal(),{noremap=true})
    vim.api.nvim_set_keymap("n","<C-x>",require("dial.map").dec_normal(),{noremap=true})
    vim.api.nvim_set_keymap("v","<C-a>",require("dial.map").inc_visual(),{noremap=true})
    vim.api.nvim_set_keymap("v","<C-x>",require("dial.map").dec_visual(),{noremap=true})
    vim.api.nvim_set_keymap("v","g<C-a>",require("dial.map").inc_gvisual(),{noremap=true})
    vim.api.nvim_set_keymap("v","g<C-x>",require("dial.map").dec_gvisual(),{noremap=true})
    end,keys={{'n','<C-a>'},{'n','<C-x>'},{'v','<C-a>'},{'v','<C-x>'},{'v','g<C-a>'},{'v','g<C-x>'}}}
use 'brettanomyces/nvim-editcommand' --MD
use{'ekickx/clipboard-image.nvim',config=function ()
    vim.keymap.set('n','\\p',':PasteImg\r',{nowait=true,silent=true})
    end} --MD
use{'linty-org/readline.nvim',config=function ()
    local readline=require'readline'
    vim.keymap.set('!','<M-f>',readline.forward_word)
    vim.keymap.set('!','<M-b>',readline.backward_word)
    vim.keymap.set('!','<C-a>',readline.beginning_of_line)
    vim.keymap.set('!','<C-e>',readline.end_of_line)
    vim.keymap.set('!','<M-d>',readline.kill_word)
    vim.keymap.set('!','<M-BS>',readline.backward_kill_word)
    vim.keymap.set('!','<C-w>',readline.unix_word_rubout)
    vim.keymap.set('!','<C-k>',readline.kill_line)
    vim.keymap.set('!','<C-u>',readline.backward_kill_line)
    end}
use{'saifulapm/chartoggle.nvim',config=get_setup('chartoggle',{leader='\\',keys={'}',"'",')','--','#'}})}
use{'ghillb/cybu.nvim',config=function ()
    require'cybu'.setup()
    vim.keymap.set('n','[b','<Plug>(CybuPrev)')
    vim.keymap.set('n',']b','<Plug>(CybuNext)')
    vim.keymap.set('n','[B','<plug>(CybuLastusedPrev)')
    vim.keymap.set('n',']B','<plug>(CybuLastusedNext)')
    end}
use 'romainl/vim-qf'
use{'tpope/vim-repeat',config=function ()
    vim.keymap.set('n','<C-.>','<Plug>(RepeatDot)',{silent=true})
    end}

----text object
use{'s1n7ax/nvim-lazy-inner-block',config=get_setup'nvim-lazy-inner-block'}
use{'wellle/targets.vim',keys={{'o','i'},{'x','i'}}}
use 'michaeljsmith/vim-indent-object'
use 'coderifous/textobj-word-column.vim'
use{'MisanthropicBit/vim-numbers',config=function ()
    vim.g['numbers#enable_text_objects']=0
    vim.keymap.set('v','an','<Plug>(VselectNumber)',{silent=true})
    vim.keymap.set('o','an','<Plug>(VselectNumber)',{silent=true})
    vim.keymap.set('v','in','<Plug>(VselectNumber)',{silent=true})
    vim.keymap.set('o','in','<Plug>(VselectNumber)',{silent=true})
    end} --TODO
use{'rhysd/vim-textobj-anyblock',requires='kana/vim-textobj-user',keys={{'o','ib'},{'v','ib'},{'o','ab'},{'v','ab'}}}
use{'deathlyfrantic/vim-textobj-blanklines',requires='kana/vim-textobj-user',keys={{'o','i '},{'v','i '},{'o','a '},{'v','a '}}}
use{'D4KU/vim-pushover',requires='tommcdo/vim-exchange',keys={'>w','<w','<W','>W','<p','>p'}}

----movement
use{'phaazon/hop.nvim',config=get_setup'hop'}
use{'rhysd/clever-f.vim',config=function ()
    vim.g.clever_f_smart_case=1
    vim.g.clever_f_mark_direct=1
    vim.keymap.set('n','<esc>','<Plug>(clever-f-reset)',{silent=true,noremap=true})
    end}
use{'arp242/jumpy.vim',keys={'[[','<char-93><char-93>','g]','g['}}

----utils
use 'nyngwang/NeoNoName.lua' --TODO
use{'sQVe/sort.nvim',config=get_setup'sort'}
use 'kazhala/close-buffers.nvim'
use 'famiu/bufdelete.nvim'
use{'tpope/vim-eunuch',cmd={'Cfind','Chmod','Clocate','Copy',
    'Delete','Duplicate','Lfind','Llocate','Mkdir','Move','Remove',
    'Rename','SudoEdit','SudoWrite','Unlink','W','Wall'}}
use 'tpope/vim-abolish'
use{'nvim-colortils/colortils.nvim',config=get_setup'colortils'}

----command
use{'toppair/reach.nvim',config=get_setup'reach'} --TODO
use 'pixelneo/vim-python-docstring'
use 'alec-gibson/nvim-tetris'
use{'ThePrimeagen/harpoon',requires='nvim-lua/plenary.nvim'}
use{'wellle/visual-split.vim',keys={{'n','<C-W>gr'},{'n','<C-W>gss'},{'n','<C-W>gsa'},
    {'n','<C-W>gsb'},{'x','<C-W>gr'},{'x','<C-W>gss'},{'x','<C-W>gsa'},{'x','<C-W>gsb'}},
    cmd=vim.fn.extend(expander('VSSplit',{'Above','Below'},true),{'VSResize'})}
use{'voldikss/vim-translator',config=get_config'translator'}
use{'dhruvasagar/vim-table-mode',cmd='TableModeToggle'}
use{'skywind3000/asyncrun.vim',cmd={'AsyncRun','AsyncStop'}}
use{'vim-scripts/CycleColor',cmd=expander('CycleColor',{'Next','Prev','Refresh'})}
use{'airblade/vim-rooter',config=function ()
    vim.g.rooter_manual_only=1
    end,cmd={'Rooter','RooterToggle'}}
use{'kassio/neoterm',cmd={'T','Tnew','Topen','Texec'}}
use{'elihunter173/dirbuf.nvim',cmd={'Dirbuf'},setup=function()
    vim.api.nvim_create_autocmd('BufEnter',{
        command="if isdirectory(expand('%')) && !&modified|execute 'Dirbuf'|endif"
    })end}
use{'ziontee113/color-picker.nvim',config='require("color-picker")'}

----sidepannel
use{'majutsushi/tagbar',cmd='TagbarToggle'}
use{'kyazdani42/nvim-tree.lua',config=get_config('nvimtree'),cmd='NvimTreeToggle'}
use{'simrat39/symbols-outline.nvim',cmd=expander('SymbolsOutline',{'Open','Close'},true)}
use 'codcodog/simplebuffer.vim'
use{'simnalamburt/vim-mundo',cmd='MundoToggle'}
use{'mattn/calendar-vim',cmd=expander('Calender',{'H','T','VT'},true)}
use{'folke/trouble.nvim',requires='kyazdani42/nvim-web-devicons',config=get_setup'trouble'}
use{'wfxr/minimap.vim',run=':!cargo install --locked code-minimap',cmd='MinimapToggle',config=function ()
    vim.g.minimap_highlight_range=1
    vim.g.minimap_highlight_search=1
    end}

----telescope
use{'nvim-telescope/telescope.nvim',requires={
    'benfowler/telescope-luasnip.nvim',
    'nvim-neorg/neorg-telescope',
    'nvim-telescope/telescope-symbols.nvim',
    'chip/telescope-software-licenses.nvim',
    {'ahmedkhalf/project.nvim',config=get_setup('project_nvim',{manual_mode=true})},
    'tom-anders/telescope-vim-bookmarks.nvim',
    'jvgrootveld/telescope-zoxide',
    'linarcx/telescope-changes.nvim',
    'linarcx/telescope-ports.nvim',
    'axkirillov/telescope-changed-files',
    },config=get_config'telescope'}

----window
use{'sindrets/winshift.nvim',config=function ()
    require'winshift'.setup{}
    for k,v in pairs({h='left',j='down',k='up',l='right'}) do
      vim.keymap.set('n','<C-S-'..k..'>',':WinShift '..v..'\r',{noremap=true,silent=true})
    end end}
use 'wesQ3/vim-windowswap'
use{'https://gitlab.com/yorickpeterse/nvim-window',config=function ()
    vim.keymap.set('n','<C-w>g ',':lua require("nvim-window").pick()\r',{silent=true,noremap=true})
    end}
use{'t9md/vim-choosewin',config=function ()
    vim.g.choosewin_overlay_enable=1
    vim.keymap.set('n','<C-w> ',':ChooseWin\r',{silent=true})
    end}

----auto complete (nvim-cmp & luasnip)
use{'hrsh7th/nvim-cmp',config=get_config('cmp-nvim'),requires={
    'f3fora/cmp-spell',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-calc',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'hrsh7th/cmp-nvim-lua',
    'hrsh7th/cmp-path',
    'lukas-reineke/cmp-rg',
    'quangnguyen30192/cmp-nvim-tags',
    'ray-x/cmp-treesitter',
    'saadparwaiz1/cmp_luasnip',
    {'mtoohey31/cmp-fish',ft='fish'},
    {'tzachar/cmp-tabnine',run='./install.sh'},
    }}
use{'L3MON4D3/LuaSnip',requires='rafamadriz/friendly-snippets',config=get_config'snip'}

----other
use 'jghauser/fold-cycle.nvim'
use{'suan/vim-instant-markdown',ft='markdown',run=':!npm -g install instant-markdown-d'}
use{'glepnir/dashboard-nvim',config=get_config('dashboard'),cmd={'Dashboard','DashboardNewFile'},setup=function ()
    vim.api.nvim_create_autocmd('Vimenter',{callback=function()
        if vim.fn.argc()==0 and vim.fn.line2byte('$')==-1 then
          vim.cmd('Dashboard')
    end end})end}
use{'metakirby5/codi.vim',cmd=expander('Codi',{'New','Expand','Select','Update'},true)}
use{'ThePrimeagen/refactoring.nvim',config=function ()
    vim.api.nvim_set_keymap('v','<leader>re',[[<Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]],{noremap=true,silent=true})
    vim.api.nvim_set_keymap('v','<leader>rf',[[<Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]],{noremap=true,silent=true})
    vim.api.nvim_set_keymap('v','<leader>rv',[[<Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]],{noremap=true,silent=true})
    vim.api.nvim_set_keymap('v','<leader>ri',[[<Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], {noremap=true,silent=true})
    end}
use 'jbyuki/venn.nvim'
use{'glacambre/firenvim',run=function() vim.fn['firenvim#install'](0) end}
use 'wbthomason/packer.nvim'
use{'ahmedkhalf/notif.nvim',opt=true}
use{'Pocco81/AutoSave.nvim',config=get_setup'autosave'}
use{'crusj/bookmarks.nvim',config=get_setup'bookmarks'}
use{'m-demare/attempt.nvim',config=function ()
    local attempt=require'attempt'
    attempt.setup()
    vim.keymap.set('n','<leader>an',attempt.new_select,{silent=true,noremap=true})--newattempt,selectingextension
    vim.keymap.set('n','<leader>ai',attempt.new_input_ext,{silent=true,noremap=true})--newattempt,inputingextension
    vim.keymap.set('n','<leader>ar',attempt.run,{silent=true,noremap=true})--runattempt
    vim.keymap.set('n','<leader>ad',attempt.delete_buf,{silent=true,noremap=true})--deleteattemptfromcurrentbuffer
    vim.keymap.set('n','<leader>ac',attempt.rename_buf,{silent=true,noremap=true})--renameattemptfromcurrentbuffer
    vim.keymap.set('n','<leader>al','Telescope attempt',{silent=true,noremap=true})--searchthroughattempts
    end}
use{'mg979/vim-visual-multi',keys='<C-S-n>'} --TODO
use{'romainl/vim-devdocs',config=function ()
    vim.keymap.set('n','gD',':DD\r',{silent=true,noremap=true})
    end}

----improve
use 'antoinemadec/FixCursorHold.nvim'
use 'brglng/vim-im-select'
use 'jghauser/mkdir.nvim'
use{'ethanholz/nvim-lastplace',config=get_setup'nvim-lastplace'}

----lua utils
use 'nvim-lua/plenary.nvim' --TODO
use 'rcarriga/nvim-notify' --TODO
use 'tjdevries/vlog.nvim'

----speed
use 'lewis6991/impatient.nvim'
use{'Konfekt/FastFold',config=function ()
    vim.keymap.set('n','Z','<Plug>(FastFoldUpdate)',{noremap=true,nowait=true})
    end,event='User isfolded',cmd='FastFoldUpdate',setup=function ()
    local fn=vim.fn
    FASTFOLDTIMER=fn.timer_start(2000,function()
        if #fn.filter(fn.range(1,fn.line'$'),'foldlevel(v:val)>0')>0 then
            vim.cmd('doautocmd User isfolded')
            fn.timer_stop(FASTFOLDTIMER)
        end
    end,{['repeat']=-1})
    end,keys='Z'}
use 'nathom/filetype.nvim'

----treesitter
use{'nvim-treesitter/nvim-treesitter',run='vim.cmd"TSUpdate"',requires={
    'nvim-lua/plenary.nvim',
    'p00f/nvim-ts-rainbow',
    {'nvim-treesitter/playground',requires={'nvim-lua/popup.nvim'},cmd='TSPlaygroundToggle'},
    'theHamsta/nvim-treesitter-pairs',
    {'windwp/nvim-ts-autotag',event='User autotag',config='vim.cmd"TSEnable autotag"',ft='html'},
    'mfussenegger/nvim-treehopper',
    {'lewis6991/spellsitter.nvim',config=get_setup'spellsitter'},
    'RRethy/nvim-treesitter-textsubjects',
    'JoosepAlviste/nvim-ts-context-commentstring',
    },config=get_config'treesitter'}
use{'booperlv/nvim-gomove',config=get_setup('gomove',{map_defaults=false})} --not treesitter
use{'ziontee113/syntax-tree-surfer',config=function ()
    local sts=require'syntax-tree-surfer'
    vim.keymap.set('n','vx','<cmd>STSSelectMasterNode\r',{noremap=true,silent=true})
    vim.keymap.set('n','vn','<cmd>STSSelectCurrentNode\r',{noremap=true,silent=true})
    vim.keymap.set('x','<C-j>','mode()=="<C-v>"?"<Plug>GoVSMDown":"<cmd>STSSelectNextSiblingNode\r"',{noremap=true,silent=true,expr=true})
    vim.keymap.set('x','<C-k>','mode()=="<C-v>"?"<Plug>GoVSMUp":"<cmd>STSSelectPrevSiblingNode\r"',{noremap=true,silent=true,expr=true})
    vim.keymap.set('x','<C-h>','mode()=="<C-v>"?"<Plug>GoVSMLeft":"<cmd>STSSelectParentNode\r"',{noremap=true,silent=true,expr=true})
    vim.keymap.set('x','<C-l>','mode()=="<C-v>"?"<Plug>GoVSMRight":"<cmd>STSSelectChildNode\r"',{noremap=true,silent=true,expr=true})
    vim.keymap.set('x','<C-S-j>','mode()=="<C-v>"?"<Plug>GoVSDDown":"<cmd>STSSwapNextVisual\r"',{noremap=true,silent=true,expr=true})
    vim.keymap.set('x','<C-S-k>','mode()=="<C-v>"?"<Plug>GoVSDUp":"<cmd>STSSwapPrevVisual\r"',{noremap=true,silent=true,expr=true})
    vim.keymap.set('x','<C-S-h>','mode()=="<C-v>"?"<Plug>GoVSDLeft":""',{noremap=true,silent=true,expr=true}) --TODO
    vim.keymap.set('x','<C-S-l>','mode()=="<C-v>"?"<Plug>GoVSDRight":""',{noremap=true,silent=true,expr=true}) --TODO
    vim.keymap.set('x','<A-k>','<Plug>GoVMLineUp',{noremap=true,silent=true})
    vim.keymap.set('x','<A-j>','<Plug>GoVMLineDown',{noremap=true,silent=true})
    vim.keymap.set('n','<A-k>','<Plug>GoNMLineUp',{noremap=true,silent=true})
    vim.keymap.set('n','<A-j>','<Plug>GoNMLineDown',{noremap=true,silent=true})
    vim.keymap.set('x','<A-S-k>','<Plug>GoVDLineUp',{noremap=true,silent=true})
    vim.keymap.set('x','<A-S-j>','<Plug>GoVDLineDown',{noremap=true,silent=true})
    vim.keymap.set('n','<A-S-k>','<Plug>GoNDLineUp',{noremap=true,silent=true})
    vim.keymap.set('n','<A-S-j>','<Plug>GoNDLineDown',{noremap=true,silent=true})
    vim.keymap.set('n','<C-o>',':lua require("syntax-tree-surfer").go_to_top_node_and_execute_commands(false,{"normal!O","normal!O","startinsert"})\r',{noremap=true,silent=true})
    vim.keymap.set('n','gfu',function() sts.targeted_jump({'function','arrrow_function','function_definition'}) end,{noremap=true,silent=true})
    vim.keymap.set('n','gfe',function() sts.targeted_jump({'if_statement','else_clause','else_statement','elseif_statement'}) end,{noremap=true,silent=true})
    vim.keymap.set('n','gfo',function() sts.targeted_jump({'for_statement','while_statement','switch_statement'}) end,{noremap=true,silent=true})
    vim.keymap.set('n','gfv',function() sts.targeted_jump({'variable_declaration'}) end,{noremap=true,silent=true})
    vim.keymap.set('n','gfs',function() sts.targeted_jump({'string'}) end,{noremap=true,silent=true})
    vim.keymap.set('n','gfi',function() sts.targeted_jump({'ineger'}) end,{noremap=true,silent=true})
    vim.keymap.set('n','gfa',function() sts.targeted_jump({"function","if_statement","else_clause","else_statement",
        "elseif_statement","for_statement","while_statement","switch_statement",}) end,{noremap=true,silent=true})
    vim.keymap.set('n','<A-N>',function() sts.filtered_jump('default',true) end,{noremap=true,silent=true})
    vim.keymap.set('n','<A-P>',function() sts.filtered_jump('default',false) end,{noremap=true,silent=true})
    end}

----git
use{'airblade/vim-gitgutter',cmd=expander('GitGutter',{'All','BufferDisable','BufferEnable','BufferToggle','Debug','DiffOrig','Disable','Enable','Fold','LineHighlightsDisable','LineHighlightsEnable','LineHighlightsToggle','LineNrHighlightsDisable','LineNrHighlightsEnable','LineNrHighlightsToggle','NextHunk','PrevHunk','PreviewHunk','QuickFix','QuickFixCurrentFile','SignsDisable','SignsEnable','SignsToggle','StageHunk','Toggle','UndoHunk'},true)}
use{'lewis6991/gitsigns.nvim',config=get_setup'gitsigns',cmd='Gitsigns'}
use{'timuntersberger/neogit',cmd='Neogit'}
use{'junegunn/gv.vim',opt=true,setup=function()
    vim.cmd [[command! -nargs=* -range -bang -complete=file GV lua require("packer.load")({'vim-fugitive'},{},_G.packer_plugins) require("packer.load")({'gv.vim'},{cmd="GV",l1=<line1>,l2=<line2>,bang=<q-bang>,args=<q-args>,mods="<mods>"},_G.packer_plugins)]]
    end} --smart lazy load
use{'tpope/vim-fugitive',opt=true}
end)

----self plugins
require'self_plugins.ranger'
require'self_plugins.unimpaired'
require'self_plugins.tabline'
require'self_plugins.dff'
require'self_plugins.textobj'
--TODO: better udotree
-- vim:fen:
