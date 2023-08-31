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
local extend=vim.fn.extend
require'packer'.startup(function (use)
  ----TEST
  use{'altermo/ultimate-autopair.nvim',opt=true}

  ----colorschm
  use 'folke/tokyonight.nvim'
  use 'ray-x/starry.nvim'
  use 'edeneast/nightfox.nvim'
  use 'projekt0n/github-nvim-theme'
  use 'bluz71/vim-nightfly-colors'
  use 'matsuuu/pinkmare'
  use 'lifepillar/vim-gruvbox8'
  use 'NTBBloodbath/doom-one.nvim'
  use 'hoprr/calvera-dark.nvim'

  ----visual
  use{'folke/twilight.nvim',cmd='Twilight',module='twilight',config=get_setup'twilight'}
  use{'rrethy/vim-hexokinase',run='make hexokinase',setup=function ()
    vim.g.Hexokinase_highlighters={'backgroundfull'}
  end,event='User s1'}
  use{'anuvyklack/pretty-fold.nvim',config=get_setup'pretty-fold',event='User s1'}
  use{'shellraining/hlchunk.nvim',config=get_setup('hlchunk',{
    indent={chars={'│'}},
    chunk={enable=false},
    blank={enable=false},
    line_num={enable=false},
  })}
  use{'chentoast/marks.nvim',config=get_setup'marks',keys={{'n','m'},{'n','dm'}}}
  use{'smjonas/live-command.nvim',config=get_setup('live-command',{commands={Norm={cmd='norm!'},G={cmd='g'},V={cmd='v'}}}),cmd={'G','V','Norm'}}
  use{'nvim-lualine/lualine.nvim',config=get_setup'lualine',event='User s1'}
  use{'folke/which-key.nvim',config=get_config'which-key',keys={{'n','<space>'},{'n','g'},{'n','<char-92>'}},cmd='WhichKey'}

  ----keys
  use{'ecthelionvi/neoswap.nvim',config=function()
    require('NeoSwap').setup{}
    local nno=require'utils.keymap'.nno
    nno('>w','<cmd>NeoSwapNext<cr>')
    nno('<w','<cmd>NeoSwapPrev<cr>')
  end,keys={{'n','>w'},{'n','<w'}}}
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
  use{'tommcdo/vim-exchange',keys={{'n','cx'},{'x','X'}}}
  use{'gbprod/yanky.nvim',config=function()
    require'yanky'.setup{}
    local k=require'utils.keymap'
    k.nno('p','<Plug>(YankyPutAfter)')
    k.nno('P','<Plug>(YankyPutBefore)')
    k.xno('p','<Plug>(YankyPutAfter)')
    k.xno('P','<Plug>(YankyPutBefore)')
    k.nno('<A-p>','<Plug>(YankyCycleForward)')
    k.nno('<A-P>','<Plug>(YankyCycleBackward)')
  end,event='TextYankPost',
    keys=extend(mexp('n',{'p','P','<A-p>','<A-P>'}),{{'x','p'},{'x','P'}})}
  use{'andrewradev/switch.vim',keys='gs',cmd=cexp('Switch',{'Extend','Reverse'},true)}
  use{'monaqa/dial.nvim',config=function()
    local k=require'utils.keymap'
    local dialmap=require'dial.map'
    k.nno('<C-a>',dialmap.inc_normal())
    k.nno('<C-x>',dialmap.dec_normal())
    k.xno('<C-a>',dialmap.inc_visual())
    k.xno('<C-x>',dialmap.dec_visual())
  end,keys={{'n','<C-a>'},{'n','<C-x>'},{'x','<C-a>'},{'x','<C-x>'}}
  }

  ----movement
  use{'mg979/vim-visual-multi',setup='vim.cmd"let g:VM_maps={}"',keys=extend(mexp('n',{'\\\\','<C-n>'}),{'x','<C-n>'})}
  use{'xiyaowong/accelerated-jk.nvim',config=function ()
    require('accelerated-jk').setup{}
    local xno=require'utils.keymap'.xno
    xno('j','<cmd>lua require"accelerated-jk".command("gj")\r')
    xno('k','<cmd>lua require"accelerated-jk".command("gk")\r')
  end,keys={{'n','j'},{'n','k'},{'x','j'},{'x','j'}}}
  use{'folke/flash.nvim',config=get_config'flash'}

  ----command
  use{'tobinpalmer/rayso.nvim',config=get_setup'rayso',cmd='Rayso'}
  use{'kazhala/close-buffers.nvim',cmd={'BDelete','BWipeout'}}
  use{'ckolkey/ts-node-action',config=function ()
    local tsaction=require('ts-node-action')
    tsaction.setup{}
    vim.keymap.set('n','K',tsaction.node_action)
  end,keys={ { 'n', 'K' } }}
  use{'chrisgrieser/nvim-genghis',module='genghis',cmd={'NewFromSelection','Duplicate','Rename','Trash','Move','CopyFilename','CopyFilepath','Chmodx','New'}}
  use{'krady21/compiler-explorer.nvim',cmd='CECompile'}
  use{'stevearc/oil.nvim',config=get_setup('oil',{default_file_explorer=true})}
  use{'acksld/muren.nvim',config=get_setup'muren',cmd=cexp('Muren',{'Toggle','Open','Close','Fresh','Unique'})}
  use{'cshuaimin/ssr.nvim',config=get_setup('ssr'),module='ssr'}
  use{'smjonas/inc-rename.nvim',config=function()
    require'inc_rename'.setup{}
    require'utils.keymap'.nno('gr',':IncRename <C-r>=expand("<cword>")\r',{noremap=true})
  end,cmd='IncRename',keys={{'n','gr'}}}
  use{'nvim-colortils/colortils.nvim',cmd="Colortils",config=get_setup'colortils'}
  use{'skywind3000/asyncrun.vim',cmd={'AsyncRun','AsyncStop'}}
  use{'godlygeek/tabular',cmd='Tabularize'}
  use{'jbyuki/instant.nvim',config=function () vim.g.instant_username='User' end,opt=true}
  use{'rraks/pyro',cmd='Pyro',config=get_rplugin(),setup=function () vim.g.pyro_macro_path='/home/user/.macro' end}

  ----sidepannel
  use{'simnalamburt/vim-mundo',cmd='MundoToggle'}
  use{'gorbit99/codewindow.nvim',config=function()
    local codewindow=require'codewindow'
    codewindow.setup()
    vim.api.nvim_create_user_command('CodeWindow',codewindow.toggle_minimap,{})
  end,cmd='CodeWindow'}

  ----search
  use{'nvim-pack/nvim-spectre',module='spectre'}
  ------telescope
  use{'nvim-telescope/telescope.nvim',requires={
    'nvim-telescope/telescope-symbols.nvim',
    'nvim-telescope/telescope-project.nvim',
    {'nvim-telescope/telescope-fzf-native.nvim',run='make'},
    'nvim-telescope/telescope-live-grep-args.nvim',
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
  },config=function ()
      local telescope=require'telescope'
      telescope.load_extension'fzf'
      telescope.setup{}
    end,cmd='Telescope',module='telescope'}

  ----window
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

  ----treesitter
  use{'nvim-treesitter/nvim-treesitter',requires={
    {'nvim-lua/plenary.nvim',module='plenary'},
    {'https://gitlab.com/HiPhish/rainbow-delimiters.nvim',event='User s1',config=function()
      vim.g.rainbow_delimiters={blacklist={'zig'}}
      vim.cmd'TSEnable rainbow'
    end},
    {'windwp/nvim-ts-autotag',event='User autotag',config='vim.cmd"TSEnable autotag"',ft='html'},
    {'rrethy/nvim-treesitter-endwise',event='InsertEnter',config='vim.cmd"TSEnable endwise"'},
  },config=get_config'treesitter'}
  use{'ziontee113/syntax-tree-surfer',config=get_config'surfer',
    keys=extend(mexp('n',{'vx','vn','<A-j>','<A-k>','<A-S-k>','<A-S-j>','gF','gX'}),mexp('x',{'<C-j>','<C-k>','<C-h>','<C-l>','<C-S-h>','<C-S-j>','<C-S-k>','<C-S-l>','<A-k>','<A-j>','gX'})),module='syntax-tree-surfer'}

  ----other
  use{'sindrets/diffview.nvim',cmd=cexp('Diffview',{'Open','FileHistory','Close','FocusFiles','ToggleFiles','Refresh','Log'}),
    config=get_setup('diffview',{use_icons=false})}
  use{'neovim/nvim-lspconfig',config=get_config'lsp',requires={
    {'williamboman/mason.nvim',module='mason'},
    {'kosayoda/nvim-lightbulb',module='nvim-lightbulb'},
    {'folke/neodev.nvim',opt=true}},event='User s1'}
  use{'glepnir/dashboard-nvim',config=get_config('dashboard'),cmd={'Dashboard','DashboardNewFile'},setup=function ()
    vim.api.nvim_create_autocmd({'Vimenter'},{callback=function()
      if vim.fn.argc()==0 and vim.api.nvim_buf_line_count(0)==1 and vim.api.nvim_get_current_line()=='' and vim.api.nvim_buf_get_name(0)=='' then
        vim.cmd('Dashboard')
      end end})end}
  use{'rafcamlet/nvim-luapad',module='luapad',cmd='Luapad',config=get_config'luapad'}
  use{'m-demare/attempt.nvim',config=get_config'attempt',keys={{'n','\\a'}}}
  use{'rcarriga/nvim-notify',setup='vim.notify=function (...) require"notify"(...) end',module='notify'}
  use{'echasnovski/mini.nvim',config=get_config'mini'}
  use{'nmac427/guess-indent.nvim',config=get_setup'guess-indent'}
  use{'raghur/vim-ghost',run=':GhostInstall',cmd='GhostStart',config=get_rplugin()}
  --use{'andweeb/presence.nvim',module='presence'}

  ----auto complete (nvim-cmp & snippy)
  use{'hrsh7th/nvim-cmp',commit='6c84bc7',config=get_config('cmp-nvim'),requires={ --TODO: temp commit; https://github.com/jcdickinson/codeium.nvim/issues/80
    {'hrsh7th/cmp-cmdline',after='nvim-cmp'},
    {'dmitmel/cmp-cmdline-history',after='nvim-cmp'},
    --{'dcampos/cmp-snippy',after='nvim-cmp'},
    --{'dcampos/nvim-snippy',requires='honza/vim-snippets',config=get_config'snippy',after='nvim-cmp'},
    {'f3fora/cmp-spell',after='nvim-cmp'},
    {'hrsh7th/cmp-calc',after='nvim-cmp'},
    {'hrsh7th/cmp-buffer',after='nvim-cmp'},
    {'hrsh7th/cmp-nvim-lsp',after='nvim-cmp'},
    {'hrsh7th/cmp-nvim-lsp-signature-help',after='nvim-cmp'},
    {'FelipeLema/cmp-async-path',after='nvim-cmp'},
    {'lukas-reineke/cmp-rg',after='nvim-cmp'},
    {'jcdickinson/codeium.nvim',config=get_setup('codeium'),after='nvim-cmp'},
  },event={'InsertEnter','CmdlineEnter'}}

  ----writing
  use{'JellyApple102/easyread.nvim',config=get_setup('easyread',{fileTypes={'markdown','text'}}),ft={'markdown','text'}}
  use{'potamides/pantran.nvim',cmd='Pantran'} --TODO
  use{'jbyuki/venn.nvim',cmd=extend(cexp('VBox',{'D','H','O','DO','HO'},true),{'VFill'})}
  use{'dhruvasagar/vim-table-mode',cmd='TableModeToggle'}
  use{'dbmrq/vim-ditto',cmd=extend(cexp('Ditto',{'Sent','Par','File','On','Off','Update','SentOn','ParOn','FileOn'},true),{'NoDitto','ToggleDitto'})}
  use{'reedes/vim-wordy',cmd={'Wordy','NoWordy'}}
  use{'ron89/thesaurus_query.vim',cmd=cexp('Thesaurus',{'QueryReplaceCurrentWord','QueryLookupCurrentWord','QueryReplace'},true)} --TODO
  use{'epwalsh/obsidian.nvim',config=get_setup('obsidian'),ft='markdown'}

  ----filetype
  use{'nvim-neorg/neorg',config=get_setup(
    'neorg',{load={
      ['core.defaults']={},
      ['core.export']={},
      ['core.export.markdown']={},
      ['core.concealer']={},
      --['core.presenter']={},
      --['core.completion']={},
    }}),ft='norg'}
  use{'iamcco/markdown-preview.nvim',run='cd app && npm install',ft='markdown'}
  use{'turbio/bracey.vim',run='npm install --prefix server',ft={'html','css','javascript'}}

  ----end--
  use 'wbthomason/packer.nvim'
end)
-- vim:fen:
