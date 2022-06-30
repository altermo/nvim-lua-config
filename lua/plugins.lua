----init--
--TODO lazyload everything
local function get_config(name)
  return string.format('require("config.%s")', name)
end
local function get_setup(name,conf)
  return string.format('require"%s".setup%s',name,vim.inspect(conf or {}))
end
require('packer').startup(function(use)

----test
--use 'kassio/neoterm'
--use 'glepnir/lspsaga.nvim'
--use 'nvim-lua/lsp_extensions.nvim'
--use 'simrat39/symbols-outline.nvim'
use 'chrisbra/changesplugin' --TEST
use{'chrisbra/dynamicsigns',cmd={'Signs','UpdateSigns','DisableSigns','SignQF','SignExpression','SignDiff'}}--TODO
vim.cmd([[
let g:Signs_IndentationLevel = 1
let g:Signs_MixedIndentation = 1
let g:Signs_Bookmarks = 1
]])
use 'codcodog/simplebuffer.vim' --TEST
--use 'mattesgroeger/vim-bookmarks'
--use 'svermeulen/nvim-marksman'

----colorschem
use 'chriskempson/base16-vim' --11.0
use 'mhartington/oceanic-next' --9.6
use 'ghifarit53/tokyonight-vim' --8.5
use 'challenger-deep-theme/vim' --7.9
use 'rmehri01/onenord.nvim' --7.8
use 'wittyjudge/gruvbox-material.nvim' --5.2
use 'NTBBloodbath/doom-one.nvim' --5.1
use 'catppuccin/nvim' --4.8
use 'shaunsingh/nord.nvim' --3.9
use 'rafamadriz/neon' --3.4
use 'luisiacc/gruvbox-baby' --3.1
use 'edeneast/nightfox.nvim' --2.4
use 'fenetikm/falcon' --2.2
use 'yong1le/darkplus.nvim' --1.7
use 'ellisonleao/gruvbox.nvim' --1.7
use 'vim-conf-live/vimconflive2021-colorscheme' --1.0
use 'mjlbach/onedark.nvim' --0.97
use 'AlessandroYorba/Despacio' --0.96
use{'nightsense/cosmic_latte',config='vim.cmd"colorschem cosmic_latte"'} --0.86
use 'yuttie/hydrangea-vim' --0.79
--test
--use{'chriskempson/base16-vim',config='vim.cmd"colorschem base16-icy"'}
--use{'mhartington/oceanic-next',config='vim.cmd"colorschem OceanicNext"'}
--use{'ghifarit53/tokyonight-vim',config='vim.cmd"colorschem tokyonight"'}
--use{'challenger-deep-theme/vim',config='vim.cmd"colorschem challenger_deep"'}
--use{'rmehri01/onenord.nvim',config='vim.cmd"colorschem onedark"'}
--use{'wittyjudge/gruvbox-material.nvim',config='vim.cmd"colorschem gruvbox-material"'}
--use{'NTBBloodbath/doom-one.nvim',config='vim.cmd"colorschem doom-one"'}
--use{'catppuccin/nvim',config='vim.cmd"colorschem catppuccin"'}
--use{'shaunsingh/nord.nvim',config='vim.cmd"colorschem nord"'}
--use{'rafamadriz/neon',config='vim.cmd"colorschem neon"'}
--use{'luisiacc/gruvbox-baby',config='vim.cmd"colorschem gruvbox-baby"'}
--use{'edeneast/nightfox.nvim',config='vim.cmd"colorschem nightfox"'}
--use{'fenetikm/falcon',config='vim.cmd"colorschem falcon"'}
--use{'yong1le/darkplus.nvim',config='vim.cmd"colorschem darkplus"'}
--use{'ellisonleao/gruvbox.nvim',config='vim.cmd"colorschem gruvbox"'}
--use{'vim-conf-live/vimconflive2021-colorscheme',config='vim.cmd"colorschem vimconflive-2021"'}
--use{'mjlbach/onedark.nvim',config='vim.cmd"colorschem onedark"'}
--use{'AlessandroYorba/Despacio',config='vim.cmd"colorschem despacio"'}
--use{'nightsense/cosmic_latte',config='vim.cmd"colorschem cosmic_latte"'}
--use{'yuttie/hydrangea-vim',config='vim.cmd"colorschem hydrangea"'}

----visual
use{'folke/zen-mode.nvim',config=get_setup'zen-mode',requires='folke/twilight.nvim'}
use{'nvim-lualine/lualine.nvim',config=get_setup('lualine',{options={theme='powerline'}})}
use{'norcalli/nvim-colorizer.lua',config=get_setup('colorizer',{'*'})}
use 'itchyny/vim-cursorword'
--use{'ntpeters/vim-better-whitespace',config=function ()
--    vim.g.better_whitespace_filetypes_blacklist={'dashboard','qf'}
--end} --TODO
use{'karb94/neoscroll.nvim',config=get_setup'neoscroll'}
use{'beauwilliams/focus.nvim',config=get_setup('focus',{autoresize=false})}
use{'wfxr/minimap.vim',run=':!cargo install --locked code-minimap',cmd='MinimapToggle',config=function ()
    vim.g.minimap_highlight_range=1
    vim.g.minimap_highlight_search=1
    end}
use 'onsails/lspkind.nvim' --note
use{'0styx0/abbreinder.nvim',requires='0styx0/abbremand.nvim',config=get_setup'abbreinder'}
use{'monkoose/matchparen.nvim',config=get_setup'matchparen'}
use 'tversteeg/registers.nvim'
use{'folke/which-key.nvim',config=get_config'which-key'} --TODO checkhealth
--use{'glepnir/indent-guides.nvim',config='require("indent_guides").setup()'} --TEST
use 'Pocco81/HighStr.nvim'
use{'winston0410/range-highlight.nvim',config=get_setup'range-highlight',requires='winston0410/cmd-parser.nvim'} --TODO
use 'azabiong/vim-highlighter' --TODO

----syntax
use{'nvim-neorg/neorg',config=get_setup(
    'neorg',{load={
        ['core.defaults']={},
        ['core.export']={},
        ['core.export.markdown']={},
        ['core.norg.concealer']={},
        ['core.integrations.telescope']={},
    }})} --TODO
use 'neovim/nvim-lspconfig' --TODO --note
use{'nvim-treesitter/nvim-treesitter',run='vim.cmd"TSUpdate"',requires={
    'nvim-lua/plenary.nvim',
    --'nvim-treesitter/nvim-treesitter-context', --TODO
    'nvim-treesitter/nvim-treesitter-refactor',
    'p00f/nvim-ts-rainbow',
    'nvim-treesitter/nvim-treesitter-textobjects', --TEST
    {'nvim-treesitter/playground',requires={'nvim-lua/popup.nvim'},cmd='TSPlaygroundToggle'},
    'theHamsta/nvim-treesitter-pairs',
    'windwp/nvim-ts-autotag',
    'JoosepAlviste/nvim-ts-context-commentstring',
    'mfussenegger/nvim-treehopper',
    {'lewis6991/spellsitter.nvim',config=get_setup'spellsitter'},
    },config=get_config'treesitter'}
use{'nvim-orgmode/orgmode',config=get_setup'orgmode'}

----keys
use 'tpope/vim-surround' --id=surround
use{'s1n7ax/nvim-lazy-inner-block',config=get_setup'nvim-lazy-inner-block'}--id=normal
use 'tommcdo/vim-lion' --id=align
use{'bfredl/nvim-miniyank',config=function ()
    vim.g.miniyank_filename='/home/user/.miniyank.mpack'
    vim.keymap.set('n','p','<Plug>(miniyank-autoput)')
    vim.keymap.set('n','P','<Plug>(miniyank-autoPut)')
    vim.keymap.set('n','<A-p>','<Plug>(miniyank-cycle)')
    vim.keymap.set('n','<A-P>','<Plug>(miniyank-cycleback)')
    end}
use{'windwp/nvim-autopairs',config=get_setup('nvim-autopairs',{map_cr=false,fast_wrap={}})}--id=autoper
use{'s1n7ax/nvim-terminal',config=get_setup'nvim-terminal'} --id=term --TODO: replace with harpoons temrinal
use{'tpope/vim-speeddating',keys={{'n','<C-a>'},{'n','<C-x>'},{'n','d<C-a>'},{'n','d<C-x>'},{'x','<C-a>'},{'x','<C-x>'},}}
use 'wellle/targets.vim'
use 'wesQ3/vim-windowswap'
use 'michaeljsmith/vim-indent-object'
use 'brettanomyces/nvim-editcommand'

----movement
use{'phaazon/hop.nvim',config=get_setup'hop'}--id=anyhop
use 'rhysd/clever-f.vim'
use{'arp242/jumpy.vim',keys={'[[',']]','g]','g['}}
use 'coderifous/textobj-word-column.vim'

----command
use{'ThePrimeagen/harpoon',requires='nvim-lua/plenary.nvim'}
use 'mattn/calendar-vim'
use{'kyazdani42/nvim-tree.lua',config=get_config('nvimtree'),cmd='NvimTreeToggle'} --id=tree
use{'rbgrouleff/bclose.vim',cmd='Bclose',keys='<leader>bd'} --id=buffers
use{'Asheq/close-buffers.vim',cmd={'Bdelete','Bwipeout'}} --id=buffers
use{'nvim-telescope/telescope.nvim',cmd='Telescope',requires={
    'benfowler/telescope-luasnip.nvim',
    'nvim-neorg/neorg-telescope',
    'nvim-telescope/telescope-symbols.nvim', --TEST
    'chip/telescope-software-licenses.nvim',
    {'ahmedkhalf/project.nvim',config=get_setup('project_nvim',{manual_mode=true})}, --TEST
    },config=function ()
    require'telescope'.load_extension'luasnip'
    require'telescope'.load_extension'harpoon'
    require'telescope'.load_extension'projects'
    require'telescope'.load_extension'software-licenses'
    end}   --command       --id=FZF
use 'tpope/vim-eunuch'                --command       --id=normal
use{'simnalamburt/vim-mundo',cmd='MundoToggle'}                 --command       --id=undotree
use{'majutsushi/tagbar',cmd='TagbarToggle'}                  --command       --id=tagbar
use 'wellle/visual-split.vim'          --command
--use{'liuchengxu/vim-which-key',config=get_config('whichkey_space-maps')}        --command
use{'voldikss/vim-translator',config=function ()
    function SwapLang()
      vim.g.translator_target_lang,vim.g.translator_source_lang=vim.g.translator_source_lang,vim.g.translator_target_lang
      vim.notify(vim.g.translator_source_lang..'>'..vim.g.translator_target_lang)
    end
    vim.g.translator_source_lang='sv'
    vim.g.translator_target_lang='es'
    vim.keymap.set('v','þ',':Translate<CR>',{noremap=true,silent=true})  --alt_gr-t
    vim.keymap.set('v','Þ',':TranslateR<CR>',{noremap=true,silent=true}) --alt_gr-T
    end}         --command
use{'dhruvasagar/vim-table-mode',cmd='TableModeToggle'}      --command
use{'skywind3000/asyncrun.vim',cmd={'AsyncRun','AsyncStop'}} --command
use{'vim-scripts/CycleColor',cmd={'CycleColorNext','CycleColorPrev','CycleColorRefresh'}}          --command
use{'sindrets/winshift.nvim',config=function ()
    require'winshift'.setup{}
    for k,v in pairs({h='left',j='down',k='up',l='right'}) do
      vim.keymap.set('n','<C-S-'..k..'>',':WinShift '..v..'\r',{noremap=true,silent=true})
    end
end}          --command
use{'elihunter173/dirbuf.nvim',cmd={'Dirbuf'},setup=function()
    vim.api.nvim_create_autocmd('BufEnter',{
        command="if isdirectory(expand('%')) && !&modified|execute 'Dirbuf'|endif"
    })end}
use 'williamboman/nvim-lsp-installer'  --command
use{'airblade/vim-rooter',config=function ()
    vim.g.rooter_manual_only=1
    end,cmd={'Rooter','RooterToggle'}}

----other
use{'suan/vim-instant-markdown',ft='markdown'} --TODO: set up run
use{'glepnir/dashboard-nvim',config=get_config('dashboard')}          --other         --id=startpage
use{'metakirby5/codi.vim',cmd={'Codi','CodiNew','CodiExpand','CodiSelect','CodiUpdate'}}             --other         --id=intscratch
use{'hrsh7th/nvim-cmp',config=get_config('nvim-lsp-cmp'),requires={
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
    'quangnguyen30192/cmp-nvim-tags', --TEST'
    'ray-x/cmp-treesitter',
    'saadparwaiz1/cmp_luasnip',
    {'mtoohey31/cmp-fish',ft='fish'},
    {'tzachar/cmp-tabnine',run='./install.sh'},
    }}
use{'ThePrimeagen/refactoring.nvim',config=function ()
    require'refactoring'.setup{}
    vim.api.nvim_set_keymap("v", "<leader>re", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]], {noremap = true, silent = true, expr = false})
    vim.api.nvim_set_keymap("v", "<leader>rf", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]], {noremap = true, silent = true, expr = false})
    vim.api.nvim_set_keymap("v", "<leader>rv", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]], {noremap = true, silent = true, expr = false})
    vim.api.nvim_set_keymap("v", "<leader>ri", [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], {noremap = true, silent = true, expr = false})
    --TODO
    end}
use{'L3MON4D3/LuaSnip',requires='rafamadriz/friendly-snippets'}
use{'Konfekt/FastFold',config=function ()
    vim.keymap.set('n','Z','<Plug>(FastFoldUpdate)',{noremap=true,nowait=true})
    end}
use 'jbyuki/venn.nvim' --TODO
use 'folke/lsp-colors.nvim'
use 'lewis6991/impatient.nvim' --note
--use{'glacambre/firenvim',run=function() vim.fn['firenvim#install'](0) end} --TEST
use 'wbthomason/packer.nvim'
use 'antoinemadec/FixCursorHold.nvim'
----git
--use 'airblade/vim-gitgutter'
end)

----self plugins
require('self_plugins.ranger')
require('self_plugins.unimpaired')
require('self_plugins.tabline')
require('self_plugins.df')
-- vim:fen:
