local function bootstrap_pckr()
  local pckr_path = vim.fn.stdpath("data") .. "/pckr/pckr.nvim"
  if not vim.loop.fs_stat(pckr_path) then
    vim.fn.system({
      'git',
      'clone',
      "--filter=blob:none",
      'https://github.com/lewis6991/pckr.nvim',
      pckr_path
    })
  end
  vim.opt.rtp:prepend(pckr_path)
end
bootstrap_pckr()
local function lcmd(cmds,header)
  return function (load)
    for _,v in ipairs(cmds) do
      vim.api.nvim_create_user_command((header or '')..v,function (args)
        for _,n in ipairs(cmds) do pcall(vim.api.nvim_del_user_command,n) end
        load()
        vim.cmd(((header or '')..v)..' '..args.args)
      end,{nargs='*',bang=true}) end end end
local function lkey(mkeys)
  return function (load)
    for mode,keys in pairs(mkeys) do
      for _,key in ipairs(keys) do
        vim.api.nvim_set_keymap(mode,key,'',{callback=function()
          vim.api.nvim_del_keymap(mode,key)
          load()
          if mode=='i' then
            vim.api.nvim_input(key)
          elseif mode=='o' then
            vim.api.nvim_feedkeys(vim.v.operator..key,'x!',true)
          else
            vim.api.nvim_input(vim.v.count..key)
          end
        end}) end end end end
local function levent(events)
  return function (load)
    vim.api.nvim_create_autocmd(events,{callback=load,once=true})
  end end
local function lft(fts)
  return function (load)
    vim.api.nvim_create_autocmd('FileType',{pattern=fts,callback=load,once=true})
  end
end
local function ll(load) vim.api.nvim_create_autocmd('User s1',{callback=load,once=true}) end
local function get_setup(name,conf) return function () require(name).setup(conf or {}) end end
local function get_config(name) return function () require('config.'..name) end end
require('pckr').add{
  {'altermo/ultimate-autopair.nvim',config=get_config'ultimate',cond=levent{'InsertEnter','CmdlineEnter','TermEnter','CursorMoved'},branch='development'},
  {'altermo/small.nvim',cond=function() end},
  {'nvchad/ui',cond=function () end,branch='v3.0'},
  {'NvChad/base46',cond=function() end,branch='v3.0',config=function ()
    vim.g.base46_cache=vim.fn.stdpath'cache'..'/base46/'
  end},
  --{'nvim-tree/nvim-tree.lua'},

  ----colorschm
  'folke/tokyonight.nvim',
  'edeneast/nightfox.nvim',
  'NTBBloodbath/doom-one.nvim',
  'ray-x/starry.nvim',
  'hoprr/calvera-dark.nvim',

  ----visual
  {'nvchad/nvim-colorizer.lua',config=get_setup'colorizer',cond=ll},
  {'smjonas/live-command.nvim',config=get_setup('live-command',{commands={Norm={cmd='norm!'},G={cmd='g'},V={cmd='v'}}}),cond=levent{'CmdlineEnter'}},
  {'nvim-lualine/lualine.nvim',config=get_setup'lualine',cond=ll},
  {'folke/which-key.nvim',config=get_config'which-key',cond=lkey{n={' '}}},

  ----keys
  {'Exafunction/codeium.vim',cond=function(load) -- https://github.com/Exafunction/codeium.vim/issues/118
    vim.g.codeium_disable_bindings=false
    vim.g.codeium_manual=true
    lkey({i={'<A-\'>'}})(load)
  end,config=function ()
      local function wrapper(f,...)
        local args={...}
        return function() return f(unpack(args)) end
      end
      vim.keymap.set('i','<A-cr>',wrapper(vim.fn['codeium#Accept']),{expr=true})
      vim.keymap.set('i','<A-)>',wrapper(vim.fn['codeium#CycleCompletions'],1),{expr=true})
      vim.keymap.set('i','<A-(>',wrapper(vim.fn['codeium#CycleCompletions'],-1),{expr=true})
      vim.keymap.set('i','<A-\'>',wrapper(vim.fn['codeium#Complete']),{expr=true})
    end},
  {'gbprod/yanky.nvim',config=function()
    require'yanky'.setup{}
    vim.keymap.set('n','p','<Plug>(YankyPutAfter)')
    vim.keymap.set('n','P','<Plug>(YankyPutBefore)')
    vim.keymap.set('n','<A-p>','<Plug>(YankyCycleForward)')
    vim.keymap.set('n','<A-P>','<Plug>(YankyCycleBackward)')
    vim.keymap.set('x','p','<Plug>(YankyPutAfter)')
    vim.keymap.set('x','P','<Plug>(YankyPutBefore)')
  end,cond=function (load)
      lkey({n={'p','P','<A-p>','<A-P>'},x={'p','P'}})(load)
      levent({'TextYankPost'})(load)
    end},
  {'monaqa/dial.nvim',config=function()
    local dialmap=require'dial.map'
    vim.keymap.set('n','<C-a>',dialmap.inc_normal())
    vim.keymap.set('n','<C-x>',dialmap.dec_normal())
  end,cond=lkey{n={'<C-a>','<C-x>'}}},
  {'mg979/vim-visual-multi',cond=lkey{n={'<C-n>','\\\\'},x={'<C-n>'}}},
  {'folke/flash.nvim',config=get_config'flash',cond=lkey{n={'f','F','t','T','s'},x={'f','F','t','T','s'},o={'r'}}},

  ----command
  {'sindrets/winshift.nvim',config=function ()
    require'winshift'.setup{}
    for k,v in pairs({h='left',j='down',k='up',l='right'}) do
      vim.keymap.set('n','<C-S-'..k..'>',':WinShift '..v..'\r')
    end end,cond=function (load)
      lkey{n={'<C-S-h>','<C-S-j>','<C-S-k>','<C-S-l>'}}(load)
      lcmd{'WinShift'}(load)
    end},
  {'simnalamburt/vim-mundo',cond=lcmd{'MundoToggle'}},
  {'ckolkey/ts-node-action',config=function ()
    local tsaction=require('ts-node-action')
    tsaction.setup{}
    vim.keymap.set('n','K',tsaction.node_action)
  end,cond=lkey{n={'K'}},requires={'nvim-treesitter/nvim-treesitter'}},
  {'chrisgrieser/nvim-genghis',cond=lcmd{'NewFromSelection','Duplicate','Rename','Trash','Move','CopyFilename','CopyFilepath','Chmodx','New'}},
  {'stevearc/oil.nvim',config=function()
    local oil=require'oil'
    oil.setup{default_file_explorer=true,view_options={show_hidden=true}}
    vim.api.nvim_create_autocmd('BufWinEnter',{pattern='oil://*',callback=function (ev)
      vim.cmd.lcd(ev.file:sub(7))
    end})
  end},
  {'smjonas/inc-rename.nvim',config=function()
    require'inc_rename'.setup{}
    vim.keymap.set('n','gr',':IncRename <C-r>=expand("<cword>")\r',{noremap=true})
  end,cond=function(load)
      lcmd{'IncRename'}(load)
      lkey{n={'gr'}}(load)
    end},

  ----search
  {'nvim-pack/nvim-spectre',config=function ()
    vim.api.nvim_create_user_command('Spectre',require'spectre'.open,{})
  end,requires={'nvim-lua/plenary.nvim'},cond=lcmd{'Spectre'}},
  ------telescope
  {'nvim-telescope/telescope.nvim',requires={
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-symbols.nvim',
    'nvim-telescope/telescope-project.nvim',
    {'nvim-telescope/telescope-fzf-native.nvim',run='make'},
    {'nvim-telescope/telescope-ui-select.nvim',cond=function (load)
      ---@source /usr/local/share/nvim/runtime/lua/vim/ui.lua:39
      ---@diagnostic disable-next-line: duplicate-set-field
      function vim.ui.select(...)
        load()
        local telescope=require'telescope'
        telescope.load_extension'ui-select'
        vim.ui.select(...)
      end
    end,requires={'nvim-telescope/telescope.nvim'}},
  },config=function ()
      local telescope=require'telescope'
      telescope.load_extension'fzf'
      telescope.setup{}
    end,cond=lcmd{'Telescope'}},

  ----treesitter
  {'nvim-treesitter/nvim-treesitter',config=get_config'treesitter'},
  {'https://gitlab.com/HiPhish/rainbow-delimiters.nvim',cond=ll,config=function()
    vim.g.rainbow_delimiters={blacklist={'zig'}}
    vim.cmd'TSEnable rainbow'
  end,requires={'nvim-treesitter/nvim-treesitter'}},
  {'windwp/nvim-ts-autotag',cond=levent{'InsertEnter'},config=function() vim.cmd'TSEnable autotag' end,requires={'nvim-treesitter/nvim-treesitter'}},
  {'rrethy/nvim-treesitter-endwise',cond=levent{'InsertEnter'},config=function() vim.cmd"TSEnable endwise" end,requires={'nvim-treesitter/nvim-treesitter'}},
  {'ziontee113/syntax-tree-surfer',config=get_config'surfer',
    cond=lkey{n={'vx','vn','<A-j>','<A-k>','<A-S-k>','<A-S-j>','gF','gX'},x={'<C-j>','<C-k>','<C-h>','<C-l>','<C-S-h>','<C-S-j>','<C-S-k>','<C-S-l>','<A-k>','<A-j>','gX'}},requires={'nvim-treesitter/nvim-treesitter'}},

  ----other
  {'s1n7ax/nvim-window-picker'},
  {'sindrets/diffview.nvim',cond=lcmd({'Open','FileHistory','Close','FocusFiles','ToggleFiles','Refresh','Log'},'Diffview'),
    config=get_setup('diffview',{use_icons=false})},
  {'neovim/nvim-lspconfig',config=get_config'lsp',requires={
    {'williamboman/mason.nvim',module='mason'}},cond=ll},
  {'rafcamlet/nvim-luapad',cond=lcmd{'Luapad'},config=get_setup('luapad',{
    preview=false,
    on_init=function ()
      vim.api.nvim_buf_set_lines(vim.api.nvim_get_current_buf(),0,-1,false,{'---@diagnostic disable: undefined-global,unused-local,lowercase-global',''})
      vim.cmd.norm{'G',bang=true}
    end,
  })},
  {'rcarriga/nvim-notify',cond=function(load)
    ---@source /usr/local/share/nvim/runtime/lua/vim/_editor.lua:580
    ---@diagnostic disable-next-line: duplicate-set-field
    vim.notify=function (...)
      load()
      vim.notify=require"notify"
      vim.notify(...)
    end end},
  {'echasnovski/mini.nvim',config=get_config'mini'},
  {'nmac427/guess-indent.nvim',config=get_setup'guess-indent'},
  {'raghur/vim-ghost',run=':GhostInstall',cond=lcmd{'GhostStart'},config=function()
    if vim.g.loaded_remote_plugins~=1 then return end
    vim.g.loaded_remote_plugins=nil
    vim.cmd.source('/usr/share/nvim/runtime/plugin/rplugin.vim')
  end},

  ----auto complete (nvim-cmp)
  {'hrsh7th/nvim-cmp',config=get_config'cmp-nvim',cond=levent{'InsertEnter','CmdlineEnter'}},
  {'hrsh7th/cmp-cmdline',requires={'hrsh7th/nvim-cmp'},cond=levent{'CmdlineEnter'}},
  {'hrsh7th/cmp-calc',requires={'hrsh7th/nvim-cmp'},cond=levent{'InsertEnter'}},
  {'hrsh7th/cmp-buffer',requires={'hrsh7th/nvim-cmp'},cond=levent{'InsertEnter','CmdlineEnter'}},
  {'hrsh7th/cmp-nvim-lsp',requires={'hrsh7th/nvim-cmp'},cond=levent{'InsertEnter'}},
  {'hrsh7th/cmp-nvim-lsp-signature-help',requires={'hrsh7th/nvim-cmp'},cond=levent{'InsertEnter'}},
  {'FelipeLema/cmp-async-path',requires={'hrsh7th/nvim-cmp'},cond=levent{'InsertEnter','CmdlineEnter'}},
  {'exafunction/codeium.nvim',config=get_setup'codeium',requires={'hrsh7th/nvim-cmp','nvim-lua/plenary.nvim'},cond=levent{'InsertEnter'}},

  ----writing
  {'dhruvasagar/vim-table-mode',cond=lcmd{'TableModeToggle'}},
  {'dbmrq/vim-ditto',cond=function(load)
    lcmd{'NoDitto','ToggleDitto'}(load)
    lcmd({'Sent','Par','File','On','Off','Update','SentOn','ParOn','FileOn'},'Ditto')(load)
  end},
  {'reedes/vim-wordy',cond=lcmd{'Wordy','NoWordy'}},

  ----filetype
  {'nvim-neorg/neorg',config=get_setup(
    'neorg',{load={
      ['core.defaults']={},
      ['core.export']={},
      ['core.export.markdown']={},
      ['core.completion']={config={engine='nvim-cmp'}},
    }}),cond=lft{'norg'},run=':Neorg sync-parsers',requires={'hrsh7th/nvim-cmp'}},
  {'iamcco/markdown-preview.nvim',run='cd app && npm install',cond=lft{'markdown'}},

  ---end
}
-- vim:fen:
