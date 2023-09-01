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
---@source /usr/local/share/nvim/runtime/lua/vim/ui.lua
---@diagnostic disable-next-line: duplicate-set-field
vim.ui.open=function(path)
  vim.pprint(path)
  return open(path)
end

local so=vim.api.nvim_create_autocmd('FileType',{callback=function()
  if pcall(vim.treesitter.get_parser) then
    vim.cmd"syntax off"
  else
    vim.cmd"syntax on"
  end
end})
vim.api.nvim_create_autocmd('User',{pattern='s1',callback=function ()
  vim.api.nvim_del_autocmd(so)
  vim.cmd'syntax on'
end})
vim.api.nvim_create_autocmd('FileType',{callback=function()
  vim.filetype.add({extension={bf='bf'}})
end,pattern='bf',once=true})
vim.api.nvim_create_autocmd({'BufRead','BufNewFile','StdinReadPost'},{
  callback=function()
    vim.cmd.setf('bf')
  end,once=true,pattern='*.bf'})

function vim.pprint(...)
  local args={...}
  vim.schedule(function ()
    vim.notify(vim.inspect(#args>1 and args or unpack(args)))
  end)
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
  'auto_cd',
  'auto_save',
  'builder',
  dff={},
  'highlight_selected',
  'labull',
  'large_file',
  'matchall',
  'onelinecomment',
  'ranger',
  'reminder',
  'tabline',
  'textobj',
  'unimpaired',
  'macroend',
  'whint',
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
    },
    {'<<','>>',suround=true,fastwarp=true,space=true,disable_end=true},
    {'<>','<>',bs_overjumps=true,fastwarp=true,space=true},
  },{
    profile='raw',
    require'ultimate-autopair.experimental.matchpair_'.init()
  }}
  if not upair._check_depreciated(configs[1]) then
    upair.init(configs)
  end
  require'ultimate-autopair.experimental.terminal'.setup()
end,once=true})
