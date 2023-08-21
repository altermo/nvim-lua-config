vim.fn.timer_start(100,function() vim.fn.execute('silent! checktime') end,{['repeat']=-1})
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
vim.g.rplugins={'lista.nvim','vim-ghost','pyro'}
vim.fn.timer_start(1000,function() vim.cmd"doautocmd User s1" end)
local fastfoldtimer
fastfoldtimer=vim.fn.timer_start(2000,function()
  if vim.o.foldenable then
    vim.cmd('doautocmd User isfolded')
    vim.fn.timer_stop(fastfoldtimer)
  end
end,{['repeat']=-1})
local qftimer
qftimer=vim.fn.timer_start(2000,function ()
  ---@diagnostic disable-next-line: param-type-mismatch
  if next(vim.fn.filter(vim.fn.getwininfo(),'v:val.quickfix && !v:val.loclist')) then
    vim.cmd'doautocmd User qfopen'
    vim.fn.timer_stop(qftimer)
  end
end,{['repeat']=-1})
local so=vim.api.nvim_create_autocmd('FileType',{callback=function()
  if vim.fn.index({"fennel","sh","bash","python","lua","cpp","c","rust","fish","term","vim","java","html","javascript","norg","zig"},vim.o.filetype)~=-1 then
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
  ---@diagnostic disable-next-line: missing-fields
  vim.filetype.add({extension={bf='bf'}})
end,pattern='bf',once=true})
vim.api.nvim_create_autocmd({'BufRead','BufNewFile','StdinReadPost'},{
  callback=function()
    vim.cmd.setf('bf')
  end,once=true,pattern='*.bf'})
function vim.pprint(...)
  local args={...}
  vim.schedule(function ()
    vim.notify(vim.inspect(#args==1 and unpack(args) or args))
  end)
end
function vim.traceback()
  return vim.lg(debug.traceback())
end
function vim.lgclear()
  vim.fn.writefile({},'/tmp/nlog')
end
function vim.lg(...)
  local d=debug.getinfo(2)
  return vim.fn.writefile(vim.fn.split(
    ':'..d.short_src..':'..d.currentline..':\n'..
    vim.inspect(#{...}==1 and ... or {...}),'\n'
  ),'/tmp/nlog','a')
end
function vim.req(source)
  package.loaded[source]=nil
  return require(source)
end
function vim.curpos()
  local row,col=unpack(vim.api.nvim_win_get_cursor(0))
  return {row-1,col,row-1,col}
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
  'whint', --TODO: is currently a big hack
  --'iabbrev' --TODO
})
vim.api.nvim_create_autocmd({'InsertEnter','CmdlineEnter','TermEnter'},{callback=function(ev)
  vim.opt.runtimepath:append('/home/user/.config/nvim/.other/ua')
  local upair=require'ultimate-autopair'
  --_G.UA_DEV='ok'
  _G.UA_DEV=true
  local configs={}
  table.insert(configs,upair.extend_default{
    space2={
      enable=true
    },
    bs={
      space='balance',
      indent_ignore=true,
      single_delete=true,
    },
    cr={
      autoclose=true,
    },
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
      cond={cond=function(fn) return fn.get_tsnode_type()~='comment' and fn.get_tsnode_type()~='html_block' end},
    },
    config_internal_pairs={
      {'"','"',fly=true,bs_overjumps=true,multiline=true},
      {"'","'",fly=true,cond={function(fns)
        return not fns.in_lisp() or fns.in_string()
      end}},
    },
    {'<<','>>',suround=true,fastwarp=true,space=true,disable_end=true},
    {'<>','<>',bs_overjumps=true,fastwarp=true,space=true},
    {'$','$',ft={'r'}},
  })
  upair.setup(configs[1])
  require'ultimate-autopair.experimental.terminal'.setup()
  vim.api.nvim_del_autocmd(ev.id)
end})
