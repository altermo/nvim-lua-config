local map=require'utils.keymap'
local pckr_path=vim.fn.stdpath'data'..'/pckr/pckr.nvim'
if not vim.loop.fs_stat(pckr_path) then
  vim.system{'git','clone','--filter=blob:none','https://github.com/lewis6991/pckr.nvim',pckr_path}:wait()
end
vim.opt.rtp:prepend(pckr_path)
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
            vim.api.nvim_input((vim.v.count~=0 and vim.v.count or '')..key)
          end
        end}) end end end end
local function levent(events)
  return function (load)
    vim.api.nvim_create_autocmd(events,{callback=load,once=true})
  end end
local function lft(fts)
  return function (load)
    vim.api.nvim_create_autocmd('FileType',{pattern=fts,callback=load,once=true})
  end end
local function lsource(source)
  return function (load)
    package.loaded[source]=setmetatable({},{__index=function (_,key)
      load()
      package.loaded[source]=nil
      return require(source)[key]
    end}) end end
local function ll(load) vim.api.nvim_create_autocmd('User',{pattern='s1',callback=load,once=true}) end
local function get_setup(name,conf) return function () require(name).setup(conf or {}) end end
local function get_config(name) return function () require('config.'..name) end end
require'pckr'.add{
  {'altermo/ultimate-autopair.nvim',config=get_config'ultimate',cond=levent{'InsertEnter','CmdlineEnter','TermEnter','CursorMoved'},branch='development'},
  {'altermo/small.nvim',config=get_config'small',cond={ll,lcmd{'Shell'},lsource'small.dff',function(load)
    rawset(vim,'notify',function (...)
      load()
      vim.notify(...)
    end) end}},

  ----colorschm
  {'altermo/base46-fork',requires={'nvim-lua/plenary.nvim'},run='make'},
  'folke/tokyonight.nvim',
  'edeneast/nightfox.nvim',
  'hoprr/calvera-dark.nvim',

  ----visual
  {'nvchad/nvim-colorizer.lua',config=function()
    require'colorizer'.setup{}
    vim.cmd'ColorizerAttachToBuffer'
  end,cond=ll},
  {'smjonas/live-command.nvim',config=get_setup('live-command',{commands={Norm={cmd='norm!'},G={cmd='g'},V={cmd='v'}}}),cond=levent{'CmdlineEnter'}},
  {'nvim-lualine/lualine.nvim',config=get_setup('lualine',{
    sections={lualine_c={'filename',"vim.iter(vim.split(vim.lsp.status(),', ')):last():gsub('%%','%%%%')"}},
  }),cond=ll},
  {'folke/which-key.nvim',config=get_config'which-key',cond=lkey{n={' '}},requires={'echasnovski/mini.nvim','altermo/small.nvim'}},

  ----keys
  {'gbprod/yanky.nvim',config=function()
    require'yanky'.setup{}
    map.nno('p','<Plug>(YankyPutAfter)')
    map.nno('P','<Plug>(YankyPutBefore)')
    map.nno('<A-p>','<Plug>(YankyCycleForward)')
    map.nno('<A-P>','<Plug>(YankyCycleBackward)')
    map.xno('p','<Plug>(YankyPutAfter)')
    map.xno('P','<Plug>(YankyPutBefore)')
  end,cond={lkey({n={'p','P','<A-p>','<A-P>'},x={'p','P'}}),levent{'TextYankPost'}}},
  {'monaqa/dial.nvim',config=function()
    local dialmap=require'dial.map'
    map.nno('<C-a>',dialmap.inc_normal())
    map.nno('<C-x>',dialmap.dec_normal())
  end,cond=lkey{n={'<C-a>','<C-x>'}}},
  {'folke/flash.nvim',config=get_config'flash',cond=lkey{n={'f','F','t','T','s','<C-s>'},x={'f','F','t','T','s'}}},

  ----command
  {'sindrets/winshift.nvim',config=function ()
    require'winshift'.setup{}
    for k,v in pairs({h='left',j='down',k='up',l='right'}) do
      map.nno('<C-S-'..k..'>',':WinShift '..v..'\r')
    end end,cond={lkey{n={'<C-S-h>','<C-S-j>','<C-S-k>','<C-S-l>'}},lcmd{'WinShift'}}},
  {'simnalamburt/vim-mundo',cond=lcmd{'MundoToggle'}},
  {'ckolkey/ts-node-action',config=function()
    local tsaction=require('ts-node-action')
    tsaction.setup{lua=require'small.tree_lua_block_split_join'.nodes}
    vim.keymap.set('n','K',tsaction.node_action)
  end,cond=lkey{n={'K'}},requires={'nvim-treesitter/nvim-treesitter','altermo/small.nvim'}},
  {'chrisgrieser/nvim-genghis',cond=lcmd{'NewFromSelection','Duplicate','Rename','Trash','Move','CopyFilename','CopyFilepath','Chmodx','New'}},
  {'stevearc/oil.nvim',config=function()
    require'oil'.setup{default_file_explorer=true,view_options={show_hidden=true}}
    vim.api.nvim_create_autocmd('BufWinEnter',{pattern='oil://*',callback=function (ev)
      vim.cmd.lcd(ev.file:sub(#('oil://')+1))
    end})
  end,cond={levent{'BufAdd'},function (load) if vim.fn.isdirectory(vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()))==1 then load() end end}},
  {'smjonas/inc-rename.nvim',config=get_setup'inc_rename',cond=levent{'CmdlineEnter'}},

  ----search
  {'nvim-telescope/telescope.nvim',requires={
    'nvim-lua/plenary.nvim',
    {'nvim-telescope/telescope-fzf-native.nvim',run='make'},
    {'nvim-telescope/telescope-ui-select.nvim',cond=function (load)
      ---@source /usr/local/share/nvim/runtime/lua/vim/ui.lua:39
      ---@diagnostic disable-next-line: duplicate-set-field
      function vim.ui.select(...)
        load()
        require'telescope'.load_extension'ui-select'
        vim.ui.select(...)
      end
    end,requires={'nvim-telescope/telescope.nvim'}},
  },config=function ()
      local telescope=require'telescope'
      telescope.load_extension'fzf'
      telescope.setup{}
    end,cond=lcmd{'Telescope'}},

  ----treesitter
  {'nvim-treesitter/nvim-treesitter',config=get_config'treesitter',run=':TSUpdate'},
  {'https://gitlab.com/HiPhish/rainbow-delimiters.nvim',cond=ll,config=function() vim.cmd'TSEnable rainbow' end,requires={'nvim-treesitter/nvim-treesitter'}},
  {'windwp/nvim-ts-autotag',cond=levent{'InsertEnter'},config=function() vim.cmd'TSEnable autotag' end,requires={'nvim-treesitter/nvim-treesitter'}},
  {'rrethy/nvim-treesitter-endwise',cond=levent{'InsertEnter'},config=function() vim.cmd"TSEnable endwise" end,requires={'nvim-treesitter/nvim-treesitter'}},
  {'ziontee113/syntax-tree-surfer',config=get_config'surfer',
    cond=lkey{n={'vx','vn','<A-j>','<A-k>'},x={'<C-j>','<C-k>','<C-h>','<C-l>','<A-k>','<A-j>'}},requires={'nvim-treesitter/nvim-treesitter','echasnovski/mini.nvim'}},

  ----other
  {'s1n7ax/nvim-window-picker'},
  {'sindrets/diffview.nvim',cond=lcmd({'Open','FileHistory','Close','FocusFiles','ToggleFiles','Refresh','Log'},'Diffview'),
    config=get_setup('diffview',{use_icons=false})},
  {'neovim/nvim-lspconfig',config=get_config'lsp',cond=ll},
  {'rafcamlet/nvim-luapad',cond=lcmd{'Luapad'},config=get_setup('luapad',{
    preview=false,
    on_init=function ()
      vim.api.nvim_buf_set_lines(vim.api.nvim_get_current_buf(),0,-1,false,{'---@diagnostic disable: undefined-global,unused-local,lowercase-global',''})
      vim.cmd.norm{'G',bang=true}
    end,
  })},
  {'echasnovski/mini.nvim',config=get_config'mini',
    cond=lkey{n={'gl','gL','S','ds','cs'},x={'S','gl','gL','a','i'},o={'a','i'}}},
  {'nmac427/guess-indent.nvim',config=function ()
    require'guess-indent'.setup{}
    vim.schedule_wrap(require'guess-indent'.set_from_buffer)'auto_cmd'
  end,cond=ll},
  {'raghur/vim-ghost',run=':GhostInstall',cond=lcmd{'GhostStart'},config=function()
    if vim.g.loaded_remote_plugins~=1 then return end
    vim.g.loaded_remote_plugins=nil
    vim.cmd.source('/usr/share/nvim/runtime/plugin/rplugin.vim')
  end},

  ----auto complete
  {'hrsh7th/nvim-cmp',config=get_config'cmp-nvim',cond=levent{'InsertEnter','CmdlineEnter'}},
  {'hrsh7th/cmp-cmdline',requires={'hrsh7th/nvim-cmp'},cond=levent{'CmdlineEnter'}},
  {'hrsh7th/cmp-buffer',requires={'hrsh7th/nvim-cmp'},cond=levent{'InsertEnter','CmdlineEnter'}},
  {'hrsh7th/cmp-nvim-lsp',requires={'hrsh7th/nvim-cmp'},cond=levent{'InsertEnter'}},
  {'hrsh7th/cmp-nvim-lsp-signature-help',requires={'hrsh7th/nvim-cmp'},cond=levent{'InsertEnter'}},
  {'altermo/cmp-fend',requires={'hrsh7th/nvim-cmp'},cond=levent{'InsertEnter','CmdlineEnter'}},
  {'sourcegraph/sg.nvim',run='nvim -l build/init.lua',requires={'nvim-lua/plenary.nvim','hrsh7th/nvim-cmp'},config=get_setup'sg',cond=levent{'InsertEnter','CmdlineEnter'}},
  {'exafunction/codeium.nvim',config=get_setup'codeium',requires={'hrsh7th/nvim-cmp','nvim-lua/plenary.nvim'},cond=levent{'InsertEnter'},commit='822e762567a0bf50b1a4e733c8c93691934d7606'},

  ----writing
  {'altermo/vim-ditto-fork',cond={lcmd{'NoDitto','ToggleDitto'},lcmd({'On','Off','Update'},'Ditto')}},
  {'altermo/vim-wordy-fork',cond=lcmd{'Wordy','NoWordy','WordyToggle'}},
  {'nvim-orgmode/orgmode',cond=lft{'org'},config=function ()
    require('orgmode').setup_ts_grammar()
    require('nvim-treesitter.configs').setup({additional_vim_regex_highlighting={'org'}})
    require('orgmode').setup()
  end},
  {'nvim-neorg/neorg',config=get_setup(
    'neorg',{load={
      ['core.defaults']={},
      ['core.export']={},
      ['core.export.markdown']={},
      ['core.completion']={config={engine='nvim-cmp'}},
    }}),cond=lft{'norg'},run=':Neorg sync-parsers',requires={'hrsh7th/nvim-cmp'}},
  {'iamcco/markdown-preview.nvim',run='cd app && npm install',cond=lft{'markdown'}},
}
-- vim:fen:
