local lazypath=vim.fn.stdpath'data'..'/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
  vim.system{'git','clone','--filter=blob:none','https://github.com/folke/lazy.nvim.git','--branch=stable',lazypath}:wait()
end
vim.opt.rtp:prepend(lazypath)
local function get_config(name) return function () require('config.'..name) end end
require'lazy'.setup({
  {'altermo/ultimate-autopair.nvim',config=get_config'ultimate',branch='development',event={'InsertEnter','CmdlineEnter','TermEnter','VeryLazy'},keys='%'},
  {'altermo/nwm',opts={verbose=true}},
  {'altermo/small.nvim',config=get_config'small',event='VeryLazy'},
  {'altermo/iedit.nvim',keys={
    {'gi','<cmd>lua require"iedit".select()\r',mode={'n','x'}},
    {'gC','<cmd>lua require"iedit".stop()\r'},
  }},

  ----visual
  {'catppuccin/nvim',name='catppuccin',lazy=false,config=function () vim.cmd.colorscheme'catppuccin-frappe' end},
  {'nvim-lualine/lualine.nvim',opts={sections={lualine_c={'filename',"vim.iter(vim.split(vim.lsp.status(),', ')):last():gsub('%%','%%%%')"},
    lualine_x={'encoding',{'fileformat',symbols={unix='',dos='dos',mac='mac'}},'filetype'}}},event='VeryLazy'},
  {'folke/which-key.nvim',config=get_config'which-key',keys={'<space>','<C-w>'},dependencies={'altermo/small.nvim'}},
  {'smjonas/inc-rename.nvim',opts={save_in_cmdline_history=false},event={'CmdlineEnter'}},
  {'iamcco/markdown-preview.nvim',build=function() vim.fn["mkdp#util#install"]() end,ft='markdown'},

  ----keys
  {'monaqa/dial.nvim',keys={
    {'<C-a>',function () return require'dial.map'.inc_normal() end,expr=true},
    {'<C-x>',function () return require'dial.map'.dec_normal() end,expr=true},
  }},
  {'sindrets/winshift.nvim',opts={},cmd='WinShift',keys={
    {'<C-S-h>',':WinShift left\r'},
    {'<C-S-j>',':WinShift down\r'},
    {'<C-S-k>',':WinShift up\r'},
    {'<C-S-l>',':WinShift right\r'},
  }},
  {'echasnovski/mini.surround',opts={
    mappings={
      add='S',
      delete='ds',
      find='',
      find_left='',
      highlight='',
      replace='cs',
      update_n_lines='',
    }},keys={{'S',mode={'n','x'}},'ds','cs'}},
  {'echasnovski/mini.ai',opts={},keys={{'a',mode={'o','x'}},{'i',mode={'o','x'}}}},

  ----search (telescope)
  {'nvim-telescope/telescope.nvim',config=function ()
    require'telescope'.setup{defaults={preview={ls_short=true}}}
    require'telescope'.load_extension('nucleo')
  end,cmd='Telescope',dependencies={'nvim-lua/plenary.nvim',{'altermo/telescope-nucleo-sorter.nvim',build='cargo build --release'}}},

  ----treesitter
  {'nvim-treesitter/nvim-treesitter',config=function ()
    require'nvim-treesitter.configs'.setup{highlight={enable=true},indent={enable=true}}
  end,build={':TSInstall all',':TSUpdate'},event='VeryLazy'},
  {'https://gitlab.com/HiPhish/rainbow-delimiters.nvim',event='VeryLazy',config=function () vim.cmd.doau'FileType' end,dependencies={'nvim-treesitter/nvim-treesitter'}},
  {'windwp/nvim-ts-autotag',ft='html',opts={},dependencies={'nvim-treesitter/nvim-treesitter'}},
  {'rrethy/nvim-treesitter-endwise',event={'InsertEnter'},config=function() vim.cmd.TSEnable'endwise' end,dependencies={'nvim-treesitter/nvim-treesitter'}},
  {'ckolkey/ts-node-action',keys={{'s',function () require'ts-node-action'.node_action() end}},dependencies={'nvim-treesitter/nvim-treesitter'}},

  ----other
  {'stevearc/oil.nvim',cmd='Oil',config=function ()
    require'oil'.setup{view_options={show_hidden=true},skip_confirm_for_simple_edits=true,keymaps={['<C-h>']=false,['<C-l>']=false}}
    vim.api.nvim_create_autocmd('BufWinEnter',{pattern='oil://*',callback=function ()
      vim.cmd.lcd(require'oil'.get_current_dir())
    end}) end,event='VeryLazy'},
  {'neovim/nvim-lspconfig',config=get_config'lsp',event='VeryLazy',dependencies={
    --[[{'ray-x/lsp_signature.nvim',opts={hint_prefix='',floating_window=false}}]]}},
  {'nmac427/guess-indent.nvim',config=function ()
    require'guess-indent'.setup{}
    vim.schedule_wrap(require'guess-indent'.set_from_buffer)'auto_cmd'
  end,event='VeryLazy'},
  {'raghur/vim-ghost',build=':GhostInstall',cmd='GhostStart',config=function()
    vim.cmd.source('/usr/share/nvim/runtime/plugin/rplugin.vim') end},
  {'mfussenegger/nvim-dap',config=function ()
    local dap=require'dap'
    dap.configurations.lua={{type='nlua',request='attach'}}
    dap.adapters.nlua=function(callback)
      callback({type='server',port=8086})
    end
  end,dependencies={'jbyuki/one-small-step-for-vimkind'}},
  {'cbochs/grapple.nvim',opts={icons=false},cmd='Grapple'},

  ----auto complete
  {'hrsh7th/nvim-cmp',config=get_config'cmp',event={'InsertEnter','CmdlineEnter'},dependencies={
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-nvim-lsp',
  }},
  {'supermaven-inc/supermaven-nvim',opts={
    keymaps={
      accept_suggestion='<A-cr>',
      clear_suggestion='<nul>',
      accept_word='<C-cr>',
    },
  },event={'InsertEnter'}}
},{
    lockfile='/dev/null',
    defaults={lazy=true},
    install={colorscheme={'catppuccin-frappe'}},
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
      'netrw',
      'rplugin',
      'shada',
      'tutor',
    }}}})
-- vim:fen:
