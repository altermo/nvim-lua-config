local lazypath=vim.fn.stdpath'data'..'/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
  vim.system{'git','clone','--filter=blob:none','https://github.com/folke/lazy.nvim.git','--branch=stable',lazypath}
end
vim.opt.rtp:prepend(lazypath)
local function get_config(name) return function () require('config.'..name) end end
local ll='User s1'
local nx={'n','x'}
require'lazy'.setup({
  {'altermo/ultimate-autopair.nvim',config=get_config'ultimate',branch='development',event={'InsertEnter','CmdlineEnter','TermEnter','CursorMoved'}},
  {'altermo/nxwm',opts={verbose=true,maps={{{mods={},key='F2'},function () vim.system{'scrot'} end}}}},
  {'altermo/small.nvim',config=get_config'small',event={ll},cmd='Shell',init=function (plug)
    rawset(vim,'notify',function (...)
      require'lazy'.load{plugins=plug.name}
      vim.notify(...)
    end) end},

  ----colorschm
  {'hoprr/calvera-dark.nvim',event={ll}},
  {'catppuccin/nvim',name='catppuccin',event={ll}},

  ----visual
  {'nvchad/nvim-colorizer.lua',config=function()
    require'colorizer'.setup{}
    vim.cmd'ColorizerAttachToBuffer'
  end,event={ll}},
  {'smjonas/live-command.nvim',main='live-command',opts={commands={Norm={cmd='norm!'}}},event={'CmdlineEnter'}},
  {'nvim-lualine/lualine.nvim',opts={
    sections={lualine_c={'filename',"vim.iter(vim.split(vim.lsp.status(),', ')):last():gsub('%%','%%%%')"},lualine_x={'encoding',{'fileformat',symbols={unix='',dos='dos',mac='mac'}},'filetype'}},
  },event={ll}},
  {'folke/which-key.nvim',config=get_config'which-key',keys='<space>',dependencies={'altermo/small.nvim'}},

  ----keys
  {'gbprod/yanky.nvim',opts={},event={'TextYankPost'},keys={
    {'<A-p>','<Plug>(YankyCycleForward)'},
    {'<A-P>','<Plug>(YankyCycleBackward)'},
    {'p','<Plug>(YankyPutAfter)'},{'P','<Plug>(YankyPutAfter)',mode='x'},
    {'P','<Plug>(YankyPutBefore)'},{'p','<Plug>(YankyPutBefore)',mode='x'},
  }},
  {'monaqa/dial.nvim',keys={
    {'<C-a>',function () return require'dial.map'.inc_normal() end,expr=true},
    {'<C-x>',function () return require'dial.map'.dec_normal() end,expr=true},
  }},
  {'folke/flash.nvim',opts={
    label={uppercase=false},
    modes={
      search={enabled=false},
      char={
        labels='-1234567890',
        jump_labels=true,
        autohide=true,
        highlight={backdrop=false},
        config=function(opts)
          if vim.api.nvim_get_mode().mode:find('n[oi]') or
            vim.v.count~=0 then opts.jump_labels=false end
        end,
      }}},keys={{'f',mode=nx},{'F',mode=nx},{'t',mode=nx},{'T',mode=nx},
      {'s',function () require'flash'.jump() end,mode=nx}}},

  ----command
  {'sindrets/winshift.nvim',opts={},cmd='WinShift',keys={
    {'<C-S-h>',':WinShift left\r'},
    {'<C-S-j>',':WinShift dowm\r'},
    {'<C-S-k>',':WinShift up\r'},
    {'<C-S-l>',':WinShift right\r'},
  }},
  {'jiaoshijie/undotree',opts={},dependencies={'nvim-lua/plenary.nvim'}},
  {'ckolkey/ts-node-action',opts=function () return {lua=require'small.tree_lua_block_split_join'.nodes} end,
    keys={{'K',function () require'ts-node-action'.node_action() end}},dependencies={'nvim-treesitter/nvim-treesitter','altermo/small.nvim'}},
  {'chrisgrieser/nvim-genghis',cmd={'NewFromSelection','Duplicate','Rename','Trash','Move','CopyFilename','CopyFilepath','Chmodx','New'}},
  {'stevearc/oil.nvim',cmd='Oil',config=function ()
    require'oil'.setup{default_file_explorer=true,view_options={show_hidden=true}}
    vim.api.nvim_create_autocmd('BufWinEnter',{pattern='oil://*',callback=function (ev)
      vim.cmd.lcd(ev.file:sub(#('oil://')+1))
    end})
  end,event={ll},init=function (plug) if vim.fn.isdirectory(vim.fn.expand('%'))==1 then require'lazy'.load{plugins=plug.name} end end},
  {'smjonas/inc-rename.nvim',opts={},event={'CmdlineEnter'}},

  ----search
  {'nvim-telescope/telescope.nvim',dependencies={
    'nvim-lua/plenary.nvim',
    {'nvim-telescope/telescope-fzf-native.nvim',build='make'},
  },config=function ()
      local telescope=require'telescope'
      telescope.load_extension'fzf'
      telescope.setup{}
    end,cmd='Telescope'},
  {'nvim-telescope/telescope-ui-select.nvim',init=function ()
    rawset(vim.ui,'select',function (...)
      require'telescope'.load_extension'ui-select'
      vim.ui.select(...)
    end) end,dependencies={'nvim-telescope/telescope.nvim'}},

  ----treesitter
  {'nvim-treesitter/nvim-treesitter',config=get_config'treesitter',build=':TSUpdate'},
  {'https://gitlab.com/HiPhish/rainbow-delimiters.nvim',event={ll},config=function () vim.cmd'doau FileType' end,dependencies={'nvim-treesitter/nvim-treesitter'}},
  {'windwp/nvim-ts-autotag',event={'InsertEnter'},config=function() vim.cmd'TSEnable autotag' end,dependencies={'nvim-treesitter/nvim-treesitter'}},
  {'rrethy/nvim-treesitter-endwise',event={'InsertEnter'},config=function() vim.cmd"TSEnable endwise" end,dependencies={'nvim-treesitter/nvim-treesitter'}},
  {'ziontee113/syntax-tree-surfer',config=get_config'surfer',dependencies={'echasnovski/mini.nvim'},
    keys={{'vn'},{'<C-j>',mode='x'},{'<C-k>',mode='x'},{'<C-h>',mode='x'},{'<C-l>',mode='x'}}},

  ----other
  {'sindrets/diffview.nvim',cmd={'DiffviewOpen'},opts={use_icons=false}},
  {'neovim/nvim-lspconfig',config=get_config'lsp',event={ll}},
  {'rafcamlet/nvim-luapad',cmd='Luapad',opts={preview=false,on_init=function ()
    vim.api.nvim_buf_set_lines(vim.api.nvim_get_current_buf(),0,-1,false,{'---@diagnostic disable: undefined-global,unused-local,lowercase-global',''})
    vim.cmd.norm{'G',bang=true}
  end}},
  {'echasnovski/mini.nvim',config=get_config'mini',
    keys={{'S',mode=nx},'ds','cs',{'a',mode={'o','x'}},{'i',mode={'o','x'}}}},
  {'nmac427/guess-indent.nvim',config=function ()
    require'guess-indent'.setup{}
    vim.schedule_wrap(require'guess-indent'.set_from_buffer)'auto_cmd'
  end,event={ll}},
  {'raghur/vim-ghost',build=':GhostInstall',cmd='GhostStart',config=function()
    vim.cmd.source('/usr/share/nvim/runtime/plugin/rplugin.vim') end},

  ----auto complete
  {'hrsh7th/nvim-cmp',config=get_config'cmp-nvim',event={'InsertEnter','CmdlineEnter'},dependencies={
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    {'altermo/cmp-codeium',dependencies={'exafunction/codeium.vim',config=function ()
      vim.g.codeium_disable_bindings=true
      vim.g.codeium_manual=true
    end}}}},

  ----writing
  {'altermo/vim-ditto-fork',cmd='ToggleDitto'},
  {'altermo/vim-wordy-fork',cmd='WordyToggle'},
  {'iamcco/markdown-preview.nvim',build=function() vim.fn["mkdp#util#install"]() end,ft='markdown'},
},{
    lockfile='/dev/null',
    defaults={lazy=true},
    performance={rtp={disabled_plugins={
      'matchparen',
      'matchit',
      'spellfile',
      'gzip',
      'zipPlugin',
      'man',
      'editorconfig',
      'tohtml',
      'tarPlugin',
      'netrwPlugin',
      'rplugin',
      'shada',
    }}}})
-- vim:fen:
