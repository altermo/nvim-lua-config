----init--
--TODO lazyload everything
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

----colorschem
use 'base16-project/base16-vim'
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

----visual
use{'blueyed/vim-diminactive',cmd=expander('DimInactive',{'Off','Toggle'},true)}
use{'https://gitlab.com/yorickpeterse/nvim-pqf',config=get_setup'pqf'}
use 'chrisbra/changesplugin'
use{'folke/zen-mode.nvim',config=get_setup'zen-mode',requires='folke/twilight.nvim'}
use{'nvim-lualine/lualine.nvim',config=get_setup('lualine',{options={theme='powerline'}})}
use{'norcalli/nvim-colorizer.lua',config=get_setup('colorizer',{'*'})}
use 'itchyny/vim-cursorword'
use{'ntpeters/vim-better-whitespace',config=function ()
    vim.g.better_whitespace_filetypes_blacklist={'dashboard','qf'}
    end}
use{'karb94/neoscroll.nvim',config=get_setup'neoscroll'}
use{'beauwilliams/focus.nvim',config=get_setup('focus',{autoresize=false})}
use{'wfxr/minimap.vim',run=':!cargo install --locked code-minimap',cmd='MinimapToggle',config=function ()
    vim.g.minimap_highlight_range=1
    vim.g.minimap_highlight_search=1
    end}
use{'0styx0/abbreinder.nvim',requires='0styx0/abbremand.nvim',config=get_setup'abbreinder'}
use{'monkoose/matchparen.nvim',config=get_setup'matchparen'}
use 'tversteeg/registers.nvim'
use{'folke/which-key.nvim',config=get_config'which-key'}
use 'Pocco81/HighStr.nvim'
use{'winston0410/range-highlight.nvim',config=get_setup'range-highlight',requires='winston0410/cmd-parser.nvim'}
use{'azabiong/vim-highlighter',setup=function ()
    vim.g.HiSet='M<CR>'
    vim.g.HiErase='M<BS>'
    vim.g.HiClear='M<C-L>'
    vim.g.HiFind='M<tab>'
    end,keys={'M<CR>','M<BS>','M<C-l>','M<Tab>'}}
use{'mattesgroeger/vim-bookmarks',keys={'mg','mjj','mkk','mx','mc','mp','mn','mi','mm','ma'}}
use{'nacro90/numb.nvim',config=get_setup'numb'}

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
use{'nvim-treesitter/nvim-treesitter',run='vim.cmd"TSUpdate"',requires={
    'nvim-lua/plenary.nvim',
    'p00f/nvim-ts-rainbow',
    {'nvim-treesitter/playground',requires={'nvim-lua/popup.nvim'},cmd='TSPlaygroundToggle'},
    'theHamsta/nvim-treesitter-pairs',
    {'windwp/nvim-ts-autotag',event='User autotag',config='vim.cmd"TSEnable autotag"',ft='html'},
    'mfussenegger/nvim-treehopper',
    {'lewis6991/spellsitter.nvim',config=get_setup'spellsitter'},
    'RRethy/nvim-treesitter-textsubjects',
    },config=get_config'treesitter'}
use{'nvim-orgmode/orgmode',config=get_setup'orgmode'}

----keys
use{'mizlan/iswap.nvim',config=function ()
    vim.keymap.set('n','gh',':ISwapWith\r')
    vim.keymap.set('n','gH',':ISwap\r')
    end}
use{'allendang/nvim-expand-expr',config=function ()
    vim.keymap.set('n','gE',':lua require"expand_expr".expand()\r')
    end}
use{'acksld/nvim-trevj.lua',config=function ()
    vim.keymap.set('n','gR',':lua require("trevj").format_at_cursor()\r')
    end}
use{'andrewradev/switch.vim',keys='gs',cmd=expander('Switch',{'Extend','Reverse'},true)}
use{'andrewradev/splitjoin.vim',keys={'gS','gJ'}}
use{'tpope/vim-surround',keys={{'n','ds'},{'n','cs'},{'n','cS'},{'n','ys'},{'n','yS'},{'n','yss'},
    {'n','ySs'},{'n','ySS'},{'n','gS'},'<C-S>','<C-G>s','<C-G>S','<Plug>VSurround'},setup=function ()
    vim.keymap.set('x','&','<Plug>VSurround')
    vim.keymap.set('x','&?','<esc>`>a?<esc>`<i¿<esc>')
    vim.keymap.set('x','&!','<esc>`>a!<esc>`<i¡<esc>')
    end}
use{'s1n7ax/nvim-lazy-inner-block',config=get_setup'nvim-lazy-inner-block'}--id=normal
use{'tommcdo/vim-lion',keys={{'v','gl'},{'n','gl'},{'v','gL'},{'n','gL'}}}
use{'windwp/nvim-autopairs',config=get_setup('nvim-autopairs',{map_cr=false,fast_wrap={}})}--id=autoper
use{'tpope/vim-speeddating',keys={{'n','<C-a>'},{'n','<C-x>'},{'n','d<C-a>'},{'n','d<C-x>'},{'x','<C-a>'},{'x','<C-x>'},}}
use{'wellle/targets.vim',keys={{'o','i'},{'x','i'}}}
use 'wesQ3/vim-windowswap'
use 'michaeljsmith/vim-indent-object'
use 'brettanomyces/nvim-editcommand'
use{'ekickx/clipboard-image.nvim',config=function ()
    vim.keymap.set('n','\\p',':PasteImg\r',{nowait=true,silent=true})
    end}

----movement
use{'phaazon/hop.nvim',config=get_setup'hop'}--id=anyhop
use 'rhysd/clever-f.vim'
use{'arp242/jumpy.vim',keys={'[[','<char-93><char-93>','g]','g['}}
use 'coderifous/textobj-word-column.vim'
use{'https://gitlab.com/yorickpeterse/nvim-window',config=function ()
    vim.keymap.set('n','<C-w> ',':lua require("nvim-window").pick()\r',{silent=true,noremap=true})
    end}

----command
use 'pixelneo/vim-python-docstring'
use{'brooth/far.vim',cmd=vim.fn.extend(expander('Far',{'do','r','f','p','undo'},true),{'F','Refar'})} --TODO
use 'alec-gibson/nvim-tetris'
use{'simrat39/symbols-outline.nvim',cmd=expander('SymbolsOutline',{'Open','Close'},true)}
use 'codcodog/simplebuffer.vim'
use{'ThePrimeagen/harpoon',requires='nvim-lua/plenary.nvim'}
use{'mattn/calendar-vim',cmd=expander('Calender',{'H','T','VT'},true)}
use{'kyazdani42/nvim-tree.lua',config=get_config('nvimtree'),cmd='NvimTreeToggle'}
use{'rbgrouleff/bclose.vim',cmd='Bclose',keys='<leader>bd'}
use{'Asheq/close-buffers.vim',cmd={'Bdelete','Bwipeout'}}
use{'nvim-telescope/telescope.nvim',requires={
    'benfowler/telescope-luasnip.nvim',
    'nvim-neorg/neorg-telescope',
    'nvim-telescope/telescope-symbols.nvim',
    'chip/telescope-software-licenses.nvim',
    {'ahmedkhalf/project.nvim',config=get_setup('project_nvim',{manual_mode=true})},
    'LinArcX/telescope-command-palette.nvim',
    'FeiyouG/command_center.nvim'
    },config=get_config'telescope'}
use{'tpope/vim-eunuch',cmd={'Cfind','Chmod','Clocate','Copy',
    'Delete','Duplicate','Lfind','Llocate','Mkdir','Move','Remove',
    'Rename','SudoEdit','SudoWrite','Unlink','W','Wall'}}
use{'simnalamburt/vim-mundo',cmd='MundoToggle'}
use{'majutsushi/tagbar',cmd='TagbarToggle'}
use{'wellle/visual-split.vim',keys={{'n','<C-W>gr'},{'n','<C-W>gss'},{'n','<C-W>gsa'},
    {'n','<C-W>gsb'},{'x','<C-W>gr'},{'x','<C-W>gss'},{'x','<C-W>gsa'},{'x','<C-W>gsb'}},
    cmd=vim.fn.extend(expander('VSSplit',{'Above','Below'},true),{'VSResize'})}
use{'voldikss/vim-translator',config=get_config'translator',cmd={'Translate','TranslateR'}}
use{'dhruvasagar/vim-table-mode',cmd='TableModeToggle'}
use{'skywind3000/asyncrun.vim',cmd={'AsyncRun','AsyncStop'}}
use{'vim-scripts/CycleColor',cmd=expander('CycleColor',{'Next','Prev','Refresh'})}
use{'sindrets/winshift.nvim',config=function ()
    require'winshift'.setup{}
    for k,v in pairs({h='left',j='down',k='up',l='right'}) do
      vim.keymap.set('n','<C-S-'..k..'>',':WinShift '..v..'\r',{noremap=true,silent=true})
    end end}
use{'elihunter173/dirbuf.nvim',cmd={'Dirbuf'},setup=function()
    vim.api.nvim_create_autocmd('BufEnter',{
        command="if isdirectory(expand('%')) && !&modified|execute 'Dirbuf'|endif"
    })end}
use{'airblade/vim-rooter',config=function ()
    vim.g.rooter_manual_only=1
    end,cmd={'Rooter','RooterToggle'}}
use{'kassio/neoterm',cmd={'T','Tnew','Topen','Texec'}}
use{'filipdutescu/renamer.nvim',config=function ()
    require'renamer'.setup{with_popup=false}
    vim.keymap.set('n','gr',':lua require"renamer".rename()\r')
    end}

----other
use{'Iron-E/nvim-cartographer',opt=true} --TEST
use{'b0o/mapx.nvim',opt=true} --TEST
use{'luukvbaal/stabilize.nvim',config=get_setup'stabilize'}
use 'rcarriga/nvim-notify'
use{'gbprod/yanky.nvim',config=function ()
    require'yanky'.setup{}
    vim.keymap.set('n','p','<Plug>(YankyPutAfter)')
    vim.keymap.set('n','P','<Plug>(YankyPutBefore)')
    vim.keymap.set('x','p','<Plug>(YankyPutAfter)')
    vim.keymap.set('x','P','<Plug>(YankyPutBefore)')
    vim.keymap.set('n','<A-p>','<Plug>(YankyCycleForward)')
    vim.keymap.set('n','<A-P>','<Plug>(YankyCycleBackward)',{})
    require'telescope'.load_extension'yank_history'
end}
use{'ahmedkhalf/notif.nvim',opt=true}
use 'nathom/filetype.nvim'
use{'suan/vim-instant-markdown',ft='markdown'} --TODO: set up run
use{'glepnir/dashboard-nvim',config=get_config('dashboard'),cmd={'Dashboard','DashboardNewFile'},setup=function ()
    vim.api.nvim_create_autocmd('Vimenter',{callback=function()
        if vim.fn.argc()==0 and vim.fn.line2byte('$')==-1 then
          vim.cmd('Dashboard')
    end end})end}
use{'metakirby5/codi.vim',cmd=expander('Codi',{'New','Expand','Select','Update'},true)}
use{'hrsh7th/nvim-cmp',config=get_config('cmp-nvim'),requires={
    'f3fora/cmp-spell',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-calc',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lsp-document-symbol',
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
use{'ThePrimeagen/refactoring.nvim',config=function ()
    vim.api.nvim_set_keymap('v','<leader>re',[[<Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]],{noremap=true,silent=true})
    vim.api.nvim_set_keymap('v','<leader>rf',[[<Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]],{noremap=true,silent=true})
    vim.api.nvim_set_keymap('v','<leader>rv',[[<Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]],{noremap=true,silent=true})
    vim.api.nvim_set_keymap('v','<leader>ri',[[<Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], {noremap=true,silent=true})
    end}
use{'L3MON4D3/LuaSnip',requires='rafamadriz/friendly-snippets',config=get_config'snip'}
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
use 'jbyuki/venn.nvim' --TODO
use 'folke/lsp-colors.nvim'
use 'lewis6991/impatient.nvim'
use{'glacambre/firenvim',run=function() vim.fn['firenvim#install'](0) end}
use 'wbthomason/packer.nvim'
use 'antoinemadec/FixCursorHold.nvim'
use{'ethanholz/nvim-lastplace',config=get_setup'nvim-lastplace'}
----git
use{'airblade/vim-gitgutter',cmd=expander('GitGutter',{'All','BufferDisable','BufferEnable','BufferToggle','Debug','DiffOrig','Disable','Enable','Fold','LineHighlightsDisable','LineHighlightsEnable','LineHighlightsToggle','LineNrHighlightsDisable','LineNrHighlightsEnable','LineNrHighlightsToggle','NextHunk','PrevHunk','PreviewHunk','QuickFix','QuickFixCurrentFile','SignsDisable','SignsEnable','SignsToggle','StageHunk','Toggle','UndoHunk'},true)} --TODO
end)

----self plugins
require'self_plugins.ranger'
require'self_plugins.unimpaired'
require'self_plugins.tabline'
require'self_plugins.dff'
----TODO: sort, orginize
-- vim:fen:
