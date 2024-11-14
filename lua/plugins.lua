local lazypath=vim.fn.stdpath'data'..'/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
  vim.system{'git','clone','--filter=blob:none','https://github.com/folke/lazy.nvim.git','--branch=stable',lazypath}:wait()
end
vim.opt.rtp:prepend(lazypath)
require'lazy'.setup({
  {'altermo/ultimate-autopair.nvim',branch='v0.7-old',event={'InsertEnter','CmdlineEnter'},opts={
    newline={enable=false},multiline=false,
    filter={function () return vim.fn.reg_recording()=='' and vim.fn.reg_executing()=='' end}}},
  {'altermo/small.nvim',config=function()
    require'small.small_loader'.run{
      'nterm','treeselect','notify',
      'dff','typo','exchange','whint',
      {'reminder2',conf={path='/home/user/.gtd/gtd/plans.md'}},
      {'fastmultif',conf={labels='1234567890äḧẅëẗÿüïöẍÄḦẄËŸÜÏÖẌâŝĝĥĵŵêŷûîôẑĉÂŜĜĤĴŴÊŶÛÎÔẐĈ'}},
      {'node_eval',conf={handle=function (res) _G.lualine_val=res vim.schedule(function() require'lualine'.refresh({})
      end) end,handle_pre=function () _G.lualine_val=nil end,bin='fend',node='inline_formula'}},
    } end,event='VeryLazy'},
  {'catppuccin/nvim',name='catppuccin',lazy=false,config=function () vim.cmd.colorscheme'catppuccin-frappe' end},
  {'nvim-lualine/lualine.nvim',opts={sections={lualine_c={'filename',"vim.iter(vim.split(vim.lsp.status(),', ')):last():gsub('%%','%%%%')",'_G.lualine_val'},
    lualine_x={'encoding',{'fileformat',symbols={unix='',dos='dos',mac='mac'}},'filetype'}}},event='VeryLazy'},
  {'iamcco/markdown-preview.nvim',build=function() vim.fn["mkdp#util#install"]() end,ft='markdown'},
  {'monaqa/dial.nvim',keys={
    {'<C-a>',function () return require'dial.map'.inc_normal() end,expr=true},
    {'<C-x>',function () return require'dial.map'.dec_normal() end,expr=true},
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
  {'nvim-treesitter/nvim-treesitter',config=function ()
    require'nvim-treesitter.configs'.setup{highlight={enable=true},indent={enable=true}}
  end,build={':TSInstall all',':TSUpdate'},event={'FileType'}},
  {'https://gitlab.com/HiPhish/rainbow-delimiters.nvim',event='VeryLazy',config=function()
    vim.g.rainbow_delimiters={strategy={html=function (bufnr) return vim._with({buf=bufnr},function ()
      return vim.fn.wordcount().bytes<50000 and require'rainbow-delimiters'.strategy.global or nil
    end)end}} vim.cmd.doau'FileType' end,dependencies={'nvim-treesitter/nvim-treesitter'}},
  {'windwp/nvim-ts-autotag',ft='html',opts={},dependencies={'nvim-treesitter/nvim-treesitter'}},
  {'PriceHiller/nvim-treesitter-endwise',event={'InsertEnter'},config=function() vim.cmd.TSEnable'endwise' end,dependencies={'nvim-treesitter/nvim-treesitter'},branch='fix/iter-matches'},
  {'ckolkey/ts-node-action',keys={{'s',function () require'ts-node-action'.node_action() end}},dependencies={'nvim-treesitter/nvim-treesitter'}},
  {'stevearc/oil.nvim',cmd='Oil',config=function ()
    require'oil'.setup{view_options={show_hidden=true},skip_confirm_for_simple_edits=true,keymaps={['<C-h>']=false,['<C-l>']=false}}
    vim.api.nvim_create_autocmd('BufWinEnter',{pattern='oil://*',callback=function ()
      vim.cmd.lcd(require'oil'.get_current_dir())
    end}) end,event='VeryLazy'},
  {'neovim/nvim-lspconfig',config=function () require'lsp' end,event='VeryLazy'},
  {'supermaven-inc/supermaven-nvim',opts={
    keymaps={
      accept_suggestion='<A-cr>',
      clear_suggestion='<nul>',
      accept_word='<C-cr>',
    },
  },event={'InsertEnter'}},
  {'ibhagwan/fzf-lua',cmd='FzfLua',opts={winopts={backdrop=100},oldfiles={formatter='path.filename_first'} }},
},{
    lockfile='/dev/null',defaults={lazy=true},
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
-- vim:ts=2
