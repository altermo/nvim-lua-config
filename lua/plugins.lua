local lazypath=vim.fn.stdpath'data'..'/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
  vim.system{'git','clone','--filter=blob:none','https://github.com/folke/lazy.nvim.git','--branch=stable',lazypath}:wait()
end
vim.opt.rtp:prepend(lazypath)
require'lazy'.setup({
  -- Temporary, until ultimate-autopair.nvim v0.7 is released
  {'echasnovski/mini.pairs',event={'InsertEnter','CmdlineEnter'},opts={modes={command=true}}},

  {'altermo/small.nvim',config=function()
    require'small.color_cmdline'.setup{}
    require'small.highlight_selected'.setup{}
    require'small.verttab'.setup{}
    require'small.notify'.override_notify{}
    require'small.typo'.setup{}

    require'small.reminder2'.conf={path='/home/user/.gtd/gtd/plans.md'}
    require'small.reminder2'.setup{}

    local ex=require'small.exchange'
    vim.keymap.set('n','cx',ex.ex_oper)
    vim.keymap.set('n','cX',ex.ex_eol)
    vim.keymap.set('n','cxx',ex.ex_line)
    vim.keymap.set('n','cxc',ex.ex_cancel)
    vim.keymap.set('x','X',ex.ex_visual)

    local fs=require'small.fastmultif'
    vim.keymap.set('n','t',fs.ffind)
    vim.keymap.set('n','T',fs.rffind)

    local hc=require'small.help_cword'
    vim.keymap.set('n','K',hc.run)

    local ne=require'small.node_eval'
    local ne_ns=vim.api.nvim_create_namespace'_node_eval_ns'
    ne.conf={handle_pre=function () vim.api.nvim_buf_clear_namespace(0,ne_ns,0,-1) end,
      handle=vim.schedule_wrap(function(res)
        vim.api.nvim_buf_set_extmark(0,ne_ns,0,0,{virt_text={{res,'Comment'}},virt_text_pos='right_align'})
      end),bin='fend',node='inline_formula'}
    ne.setup()

    local to=require'small.textobj'
    vim.keymap.set('x','im',to.wordcolumn,{expr=true})
    vim.keymap.set('o','im',to.charcolumn,{expr=true})
    vim.keymap.set('x','ik',to.wordrow,{expr=true})
    vim.keymap.set('o','ik',to.charrow,{expr=true})

    local ts=require'small.treeselect'
    vim.keymap.set('n','vn',ts.current)
    vim.keymap.set('n','vr',ts.line)
    vim.keymap.set('x','<C-h>',ts.prev)
    vim.keymap.set('x','<C-l>',ts.next)
    vim.keymap.set('x','<C-k>',ts.up)
    vim.keymap.set('x','<C-j>',ts.down)

    local w=require'small.whint'
    vim.keymap.set('i',':',w.run,{expr=true})
  end,lazy=false},

  {'EdenEast/nightfox.nvim',lazy=false,config=function ()
    vim.cmd.colorscheme'dayfox'
    vim.cmd.hi'clear StatusLine'
    vim.cmd.hi'clear StatusLineNC'
  end},

  {'brianhuster/live-preview.nvim',opts={},cmd='LivePreview'},

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

  {'gbprod/yanky.nvim',opts={},keys={
    {'p','<Plug>(YankyPutAfter)'},
    {'P','<Plug>(YankyPutBefore)'},
    {'<A-p>','<Plug>(YankyPreviousEntry)'},
  },event='TextYankPost'},

  {'nvim-treesitter/nvim-treesitter',config=function ()
    require'nvim-treesitter.configs'.setup{highlight={enable=true},indent={enable=true}}
  end,build={':TSInstall all',':TSUpdate'},event={'FileType'}},

  {'https://gitlab.com/HiPhish/rainbow-delimiters.nvim',event='SafeState',config=function()
    vim.g.rainbow_delimiters={strategy={html=function (bufnr) return vim._with({buf=bufnr},function ()
      return vim.fn.wordcount().bytes<50000 and require'rainbow-delimiters'.strategy.global or nil
    end)end}} vim.cmd.doau'FileType' end,dependencies={'nvim-treesitter/nvim-treesitter'}},

  {'PriceHiller/nvim-treesitter-endwise',event={'InsertEnter'},config=function() vim.cmd.TSEnable'endwise' end,dependencies={'nvim-treesitter/nvim-treesitter'},branch='fix/iter-matches'},

  {'stevearc/oil.nvim',cmd='Oil',config=function ()
    require'oil'.setup{view_options={show_hidden=true},skip_confirm_for_simple_edits=true,keymaps={['<C-h>']=false,['<C-l>']=false}}
    vim.api.nvim_create_autocmd('BufWinEnter',{pattern='oil://*',callback=function ()
      pcall(vim.cmd.lcd,require'oil'.get_current_dir())
    end}) end,lazy=false},

  {'neovim/nvim-lspconfig',config=function () require'lsp' end,event='SafeState'},

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
      --'editorconfig',
      'tohtml',
      'tarPlugin',
      'netrwPlugin',
      'netrw',
      'rplugin',
      'shada',
      'tutor',
    }}}})
-- vim:ts=2
