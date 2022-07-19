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
use 'goldfeld/vim-seek'

----list
use{'dkarter/bullets.vim',config=function ()
    vim.g.bullets_enabled_file_types={'*'}
    vim.g.bullets_set_mappings=0
    vim.keymap.set('n','o',':InsertNewBullet\r',{silent=true,noremap=true})
    end,keys={{'n','o'}}}
use{'lervag/vim-rainbow-lists',config=function ()
    vim.api.nvim_create_autocmd('FileType',{command='RBListEnable'})
    end}
use 'kabbamine/lazylist.vim'

----colorschem
--use 'base16-project/base16-vim'
use '1995parham/naz.vim'
use 'lmburns/kimbox'
use 'mhartington/oceanic-next'
use 'folke/tokyonight.nvim'
use 'challenger-deep-theme/vim'
use 'rmehri01/onenord.nvim'
use 'NTBBloodbath/doom-one.nvim'
use 'catppuccin/nvim'
use 'shaunsingh/nord.nvim'
use 'rafamadriz/neon'
use 'luisiacc/gruvbox-baby'
use 'edeneast/nightfox.nvim'
use 'fenetikm/falcon'
use 'yong1le/darkplus.nvim'
use 'ellisonleao/gruvbox.nvim'
use 'iron-e/nvim-highlite'
use 'jim-at-jibba/ariake-vim-colors'
use 'kuznetsss/meadow-nvim'
use 'matsuuu/pinkmare'
use 'vigoux/oak'
use 'yagua/nebulous.nvim'
use{'mjlbach/onedark.nvim',config='vim.cmd"colorschem onedark"'}

----look
use{'anuvyklack/pretty-fold.nvim',requires='anuvyklack/nvim-keymap-amend',
   config=get_setup'pretty-fold'..get_setup'pretty-fold.preview',event='User isfolded'}
use{'norcalli/nvim-colorizer.lua',config=get_setup('colorizer',{'*'})}
use{'azabiong/vim-highlighter',setup=function ()
    vim.g.HiSet='M<CR>'
    vim.g.HiErase='M<BS>'
    vim.g.HiClear='M<C-L>'
    vim.g.HiFind='M<tab>'
    end,keys={'M<CR>','M<BS>','M<C-l>','M<Tab>'}}
use 'Pocco81/HighStr.nvim'
use 'folke/lsp-colors.nvim'

----visual
use{'monkoose/matchparen.nvim',config=get_setup'matchparen'}
use{'haringsrob/nvim_context_vt',config=get_setup'nvim_context_vt'}
use{'https://gitlab.com/yorickpeterse/nvim-pqf',config=get_setup'pqf'}
use{'folke/zen-mode.nvim',config=get_setup'zen-mode',requires='folke/twilight.nvim'}
use 'pocco81/truezen.nvim'
use{'nvim-lualine/lualine.nvim',config=get_setup('lualine',{options={theme='powerline'}})}
use{'karb94/neoscroll.nvim',config=get_setup'neoscroll'}
use{'beauwilliams/focus.nvim',config=get_setup('focus',{autoresize=false})}
use{'0styx0/abbreinder.nvim',requires='0styx0/abbremand.nvim',config=get_setup'abbreinder'}
use 'tversteeg/registers.nvim'
use{'folke/which-key.nvim',config=get_config'which-key'}
use{'winston0410/range-highlight.nvim',config=get_setup'range-highlight',requires='winston0410/cmd-parser.nvim'}
    use{'nacro90/numb.nvim',config=get_setup'numb'}
use{'mattesgroeger/vim-bookmarks',keys={'mg','mjj','mkk','mx','mc','mp','mn','mi','mm','ma'}}
use{'bennypowers/nvim-regexplainer',
    config=get_setup('regexplainer',{auto=true,filetypes={'*'}}),
    requires={'nvim-treesitter/nvim-treesitter','MunifTanjim/nui.nvim'},setup=function ()
        REGEXPLAINER=vim.api.nvim_create_autocmd('CursorMoved',{command='lua local a,_=require"regexplainer.utils.treesitter".get_regexp_pattern_at_cursor() if a then vim.api.nvim_del_autocmd(REGEXPLAINER) vim.api.nvim_exec_autocmds("User",{pattern="regexplainer"}) end'})
    end,event='User regexplainer'}
use{'luukvbaal/stabilize.nvim',config=get_setup'stabilize'}
use{'kevinhwang91/nvim-hlslens',config=get_config'hlslens'}

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
use{'tyru/open-browser.vim',config=function ()
    vim.keymap.set('n','gx','<Plug>(openbrowser-smart-search)',{noremap=true,silent=true})
    vim.keymap.set('v','gx','<Plug>(openbrowser-smart-search)',{noremap=true,silent=true})
    end}
use{'drzel/vim-split-line',config=function ()
    vim.keymap.set('n','<A-s>',':SplitLine\r',{noremap=true,silent=true})
    end}
use 'tpope/vim-characterize'
use 'tommcdo/vim-exchange'
use{'AndrewRadev/sideways.vim',config=function ()
    vim.keymap.set('n','>a',':SidewaysRight\r',{silent=true})
    vim.keymap.set('n','<a',':SidewaysLeft\r',{silent=true})
    vim.keymap.set('n','>A',':SidewaysJumpRight\r',{silent=true})
    vim.keymap.set('n','<A',':SidewaysJumpLeft\r',{silent=true})
    end}
use{'gbprod/yanky.nvim',config=get_config'yanky'}
use{'abecodes/tabout.nvim',config=get_setup('tabout',{tabkey='<A-tab>',backwards_tabkey='<A-S-tab>',act_as_tab=false})}
use{'allendang/nvim-expand-expr',config=function ()
    vim.keymap.set('n','gE',':lua require"expand_expr".expand()\r')
    end}
use{'acksld/nvim-trevj.lua',config=function ()
    vim.keymap.set('n','gS',':lua require("trevj").format_at_cursor()\r')
    end}
use{'andrewradev/switch.vim',keys='gs',cmd=expander('Switch',{'Extend','Reverse'},true)}
use{'andrewradev/splitjoin.vim',keys={'gR','gJ'},setup=function ()
    vim.g.splitjoin_split_mapping='gR'
    end}
use{'tommcdo/vim-lion',keys={{'v','gl'},{'n','gl'},{'v','gL'},{'n','gL'}}}
use{'windwp/nvim-autopairs',config=get_config'autopairs'}
use{'monaqa/dial.nvim',config=get_config'dial',keys={{'n','<C-a>'},{'n','<C-x>'},{'v','<C-a>'},{'v','<C-x>'},{'v','g<C-a>'},{'v','g<C-x>'}}}
use{'ghillb/cybu.nvim',config=function ()
    require'cybu'.setup()
    vim.keymap.set('n','[b','<Plug>(CybuPrev)')
    vim.keymap.set('n',']b','<Plug>(CybuNext)')
    vim.keymap.set('n','[B','<plug>(CybuLastusedPrev)')
    vim.keymap.set('n',']B','<plug>(CybuLastusedNext)')
    end,requires='kyazdani42/nvim-web-devicons'}
use{'romainl/vim-qf',config=get_config'qf'}
use{'glts/vim-radical',requires='glts/vim-magnum'}
use{'preservim/nerdcommenter',config=function ()
    vim.g.NERDCreateDefaultMappings=0
    vim.keymap.set('x','gc','<Plug>NERDCommenterToggle gv')
    vim.keymap.set('n','gc','<Plug>NERDCommenterToggle')
    end}
use 'gennaro-tedesco/nvim-peekup'

----text object
use{'s1n7ax/nvim-lazy-inner-block',config=get_setup'nvim-lazy-inner-block'}
use 'michaeljsmith/vim-indent-object'
use 'coderifous/textobj-word-column.vim'
use{'deathlyfrantic/vim-textobj-blanklines',requires='kana/vim-textobj-user',keys={{'o','i<space>'},{'v','i<space>'},{'o','a<space>'},{'v','a<space>'}}}
use{'D4KU/vim-pushover',requires='tommcdo/vim-exchange',keys={{'n','>w'},{'n','<w'},{'n','<W'},{'n','>W'},{'n','<p'},{'n','>p'}}}
use{'Julian/vim-textobj-variable-segment',keys={{'o','iv'},{'o','av'},{'v','iv'},{'v','av'}}}
use 'wellle/targets.vim'
use{'kylechui/nvim-surround',config=get_setup'nvim-surround'}

----movement
use{'phaazon/hop.nvim',config=get_setup'hop'}
use{'rhysd/clever-f.vim',config=function ()
    vim.g.clever_f_smart_case=1
    vim.g.clever_f_mark_direct=1
    vim.keymap.set('n','<esc>','<Plug>(clever-f-reset)',{silent=true,noremap=true})
    end}
use{'arp242/jumpy.vim',keys={'[[','<char-93><char-93>'}}
use 'rlane/pounce.nvim'
use 'lambdalisue/lista.nvim'
use 'ripxorip/aerojump.nvim'
use 't9md/vim-smalls'

----utils
use 'kazhala/close-buffers.nvim'
use 'famiu/bufdelete.nvim'
use{'tpope/vim-eunuch',cmd={'Cfind','Chmod','Clocate','Copy',
    'Delete','Duplicate','Lfind','Llocate','Mkdir','Move','Remove',
    'Rename','SudoEdit','SudoWrite','Unlink','W','Wall'}}
use{'tpope/vim-abolish',cmd={'Abolish','Subvert'},keys={{'n','cr'}}}
use{'marklcrns/vim-smartq',config=function ()
    vim.g.smartq_default_mappings=0
    end}

----command
use{'rhysd/vim-grammarous',command={'GrammarousCheck','GrammarousReset'}}
use{'ThePrimeagen/harpoon',requires='nvim-lua/plenary.nvim'}
use{'wellle/visual-split.vim',keys={{'n','<C-W>gr'},{'n','<C-W>gss'},{'n','<C-W>gsa'},
    {'n','<C-W>gsb'},{'x','<C-W>gr'},{'x','<C-W>gss'},{'x','<C-W>gsa'},{'x','<C-W>gsb'}},
    cmd=vim.fn.extend(expander('VSSplit',{'Above','Below'},true),{'VSResize'})}
use{'voldikss/vim-translator',config=get_config'translator'}
use{'dhruvasagar/vim-table-mode',cmd='TableModeToggle'}
use{'skywind3000/asyncrun.vim',cmd={'AsyncRun','AsyncStop'}}
use{'notjedi/nvim-rooter.lua',config=get_setup('nvim-rooter',{manual=true})}
use{'kassio/neoterm',cmd={'T','Tnew','Topen','Texec'}}
use{'elihunter173/dirbuf.nvim',cmd={'Dirbuf'},setup=function()
    vim.api.nvim_create_autocmd('BufEnter',{
        command="if isdirectory(expand('%')) && !&modified|execute 'Dirbuf'|endif"
    })end}
use{'skywind3000/asynctasks.vim',cmd=expander('AsyncTask',{'Edit','Last','List','Macro','Profile'},true)}
use{'brooth/far.vim',cmd=vim.fn.extend(expander('Far',{'do','r','f','p','undo'},true),{'F','Refar'})} --MBD
use 'smithbm2316/centerpad.nvim'
use{'michaelb/sniprun',run='bash ./install.sh',cmd=expander('Snip',{'Run','Info','Close','Reset','Terminate','ReplMemoryClean'})}
use{'nyngwang/NeoWell.lua',config=get_setup'neo-well'}
use{'rbtnn/vim-mario',requires='rbtnn/vim-game_engine'}
use{'rbtnn/vim-puyo',requires='rbtnn/vim-game_engine'}
use 'alec-gibson/nvim-tetris'
use 'dbmrq/vim-ditto'
use 'iamcco/markdown-preview.nvim'
use 'toppair/reach.nvim'
use 'cometsong/CommentFrame.vim'
use 'godlygeek/tabular'
use 'smjonas/inc-rename.nvim'
use 'kkoomen/vim-doge'

----sidepannel
use{'majutsushi/tagbar',cmd='TagbarToggle'}
use{'kyazdani42/nvim-tree.lua',config=get_config('nvimtree'),cmd='NvimTreeToggle'}
use{'simrat39/symbols-outline.nvim',cmd=expander('SymbolsOutline',{'Open','Close'},true)}
use 'codcodog/simplebuffer.vim'
use 'itchyny/calendar.vim'
--use{'jiaoshijie/undotree',requires='nvim-lua/plenary.nvim',config=get_setup'undotree'}
use 'simnalamburt/vim-mundo'
use{'wfxr/minimap.vim',run=':!cargo install --locked code-minimap',cmd='MinimapToggle',config=function ()
    vim.g.minimap_highlight_range=1
    vim.g.minimap_highlight_search=1
    end}

----telescope
use{'nvim-telescope/telescope.nvim',requires={
    'benfowler/telescope-luasnip.nvim',
    'nvim-neorg/neorg-telescope',
    'nvim-telescope/telescope-symbols.nvim',
    'tom-anders/telescope-vim-bookmarks.nvim',
    'axkirillov/telescope-changed-files',
    'nvim-telescope/telescope-project.nvim',
    {'nvim-telescope/telescope-fzf-native.nvim',run='make'},
    'olacin/telescope-cc.nvim',
    'nvim-telescope/telescope-github.nvim',
    'nvim-telescope/telescope-live-grep-args.nvim',
    'nvim-telescope/telescope-packer.nvim',
    {'nvim-telescope/telescope-rs.nvim',opt=true},
    'nvim-telescope/telescope-ui-select.nvim',
    'olacin/telescope-gitmoji.nvim',
    'tc72/telescope-tele-tabby.nvim',
    'nvim-telescope/telescope-file-browser.nvim',
    'GustavoKatel/telescope-asynctasks.nvim',
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
    {'mtoohey31/cmp-fish',ft='fish'},
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
    {'tzachar/cmp-tabnine',run='./install.sh'},
    'uga-rosa/cmp-dictionary',
    {'tzachar/cmp-fuzzy-buffer',requires='tzachar/fuzzy.nvim'},
    'dmitmel/cmp-cmdline-history',
}}
use{'L3MON4D3/LuaSnip',requires='rafamadriz/friendly-snippets',config=get_config'snip'}

----other
use 'rbong/vim-buffest'
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
use 'wbthomason/packer.nvim'
use{'ahmedkhalf/notif.nvim',opt=true}
use{'Pocco81/AutoSave.nvim',config=get_setup'autosave'}
use{'m-demare/attempt.nvim',config=get_config'attempt'}
use{'rcarriga/nvim-notify',config=get_config'notify'}
use{'kkharji/lspsaga.nvim',config=function ()
    vim.keymap.set('n','K',':Lspsaga hover_doc\r',{noremap=true,silent=true})
    end}
use{'echasnovski/mini.nvim',config=get_config'mini'}

----improve
use 'antoinemadec/FixCursorHold.nvim'
use 'brglng/vim-im-select'
use 'jghauser/mkdir.nvim'
use{'ethanholz/nvim-lastplace',config=get_setup'nvim-lastplace'}

----lua utils
use 'nvim-lua/plenary.nvim'
use 'tjdevries/vlog.nvim'
use 'bkoropoff/bex.nvim'
use 's1n7ax/nvim-window-picker'

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
    'nvim-treesitter/nvim-treesitter-refactor',
    'yioneko/nvim-yati',
    },config=get_config'treesitter'}
use{'booperlv/nvim-gomove',config=get_setup('gomove',{map_defaults=false})} --not treesitter
use{'ziontee113/syntax-tree-surfer',config=get_config'gomove-treesurfer'}

----git
use{'timuntersberger/neogit',cmd='Neogit'}
use{'rbong/vim-flog',setup=function ()
    local function create_cmd(cmd)
        vim.api.nvim_create_user_command(cmd,'lua require"packer.load"({"vim-fugitive"},{},_G.packer_plugins) require"packer.load"({"vim-flog"},{cmd="'..cmd..'",l1=<line1>,l2=<line2>,bang=<q-bang>,args=<q-args>,mods="<mods>"},_G.packer_plugins)',{nargs='*',range=true,bang=true,complete='file'})
    end
    create_cmd'Flog'
    create_cmd'Flogsplit'
    create_cmd'Floggit'
    end,opt=true}
use{'tpope/vim-fugitive',opt=true}

----self plugins
end)
require'self_plugins.unimpaired'
require'self_plugins.tabline'
require'self_plugins.dff'
require'self_plugins.textobj'
require'self_plugins.visualrun'
require'self_plugins.ranger'
-- vim:fen:
