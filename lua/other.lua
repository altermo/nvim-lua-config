vim.g.loaded_matchparen=1
vim.g.loaded_matchit=1
vim.g.loaded_tarPlugin=1
vim.g.loaded_man=1
vim.g.loaded_gzip=1
vim.g.loaded_zipPlugin=1
vim.g.loaded_2html_plugin=1
vim.g.loaded_spellfile_plugin=1
vim.g.loaded_netrw=1
vim.g.loaded_netrwPlugin=1
vim.g.loaded_tutor_mode_plugin=1
vim.g.loaded_remote_plugins=1
vim.g.loaded_fzf=1
vim.g.rplugins={'vim-ghost','pyro'}

vim.fn.timer_start(100,function() vim.fn.execute('silent! checktime') end,{['repeat']=-1}) --TODO: move to automaton plugin
vim.fn.timer_start(250,function() vim.cmd"doautocmd User s1" end)

local open=vim.ui.open
---@source /usr/local/share/nvim/runtime/lua/vim/ui.lua:125
---@diagnostic disable-next-line: duplicate-set-field
vim.ui.open=function(path)
  vim.notify(('Opening %s with browser'):format(path))
  return open(path)
end

vim.api.nvim_create_autocmd('FileType',{callback=function()
  if pcall(vim.treesitter.get_parser) then
    vim.cmd'syntax off'
    vim.api.nvim_create_autocmd('User',{pattern='s1',callback=function () vim.cmd'syntax on' end})
  else
    vim.cmd"syntax on"
  end
end,once=true})
vim.api.nvim_create_autocmd({'BufRead','BufNewFile','StdinReadPost'},{
  callback=function()
    vim.filetype.add({extension={bf='bf'}})
    vim.cmd.setf('bf')
  end,once=true,pattern='*.bf'})

function vim.pprint(...)
  local args={...}
  vim.schedule(function () vim.notify(vim.inspect(#args>1 and args or unpack(args))) end)
end
function vim.traceback()
  local d=debug.getinfo(2)
  return vim.fn.writefile(vim.fn.split(
    ':'..d.short_src..':'..d.currentline..':\n'..debug.traceback(),'\n'),
    '/tmp/nlog','a')
end
function vim.lgclear()
  vim.fn.writefile({},'/tmp/nlog')
end
function vim.lg(...)
  local d=debug.getinfo(2)
  return vim.fn.writefile(vim.fn.split(
    ':'..d.short_src..':'..d.currentline..':\n'..
    vim.inspect(#{...}>1 and {...} or ...),'\n'
  ),'/tmp/nlog','a')
end

require'small_plugins'.setup({
  'own',
  'builder',
  dff={},
  'highlight_selected',
  'labull',
  'matchall',
  'onelinecomment',
  'ranger',
  'reminder',
  'tabline',
  'textobj',
  'unimpaired',
  'whint',
  'macro',
  'nodeswap',
})

vim.api.nvim_create_autocmd({'InsertEnter','CmdlineEnter','TermEnter','CursorMoved'},{callback=function()
  vim.opt.runtimepath:append('/home/user/.config/nvim/.other/ua')
  local upair=require'ultimate-autopair'
  _G.UA_DEV=true
  local configs={upair.extend_default{
    space2={enable=true},
    bs={
      space='balance',
      indent_ignore=true,
      single_delete=true,
    },
    cr={autoclose=true},
    fastwarp={
      multi=true,
      {},
      {
        faster=true,
        map='<C-A-e>',
        cmap='<C-A-e>',
        rmap='<C-A-S-e>',
        rcmap='<C-A-S-e>',
      },
    },
    tabout={
      enable=true,
      hopout=true,
    },
    extensions={
      fly={nofilter=true},
      cond={cond=function(fn) return not fn.in_node({'comment'}) end},
    },
    config_internal_pairs={
      {'"','"',fly=true,bs_overjumps=true,multiline=true},
      {"'","'",fly=true},
      {'{','}',suround=true},
    },
    {'<<','>>',suround=true,fastwarp=true,space=true,disable_end=true},
    {'<>','<>',bs_overjumps=true,fastwarp=true,space=true},
    {'\\(','\\)'},
    { "`", "'", fly = true, ft = { "tex", "latex" }},
    {'{','},',
      p=11,
      multiline=false,
      cond=function(fn)
        return fn.in_node({'table_constructor'})
      end},
    {'&','?',disable_start=true,disable_end=true,newline=true},
  },{
      profile='raw',
      require'ultimate-autopair.experimental.matchpair'.init(),
      require'ultimate-autopair.experimental.matchpair'.init_map(),
      unpack(require'ultimate-autopair.experimental.terminal'.init()),
    }}
  require'ultimate-autopair.core'.modes={'i','c','n','t'}
  if not upair._check_depreciated(configs[1]) then
    upair.init(configs)
  end
end,once=true})
