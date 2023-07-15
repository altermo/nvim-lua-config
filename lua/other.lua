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
local fn=vim.fn
fn.timer_start(1000,function() vim.cmd"doautocmd User s1" end)
local fastfoldtimer
fastfoldtimer=fn.timer_start(2000,function()
  if #fn.filter(fn.range(1,fn.line'$'),'foldlevel(v:val)>0')>0 then
    vim.cmd('doautocmd User isfolded')
    fn.timer_stop(fastfoldtimer)
  end
end,{['repeat']=-1})
local qftimer
qftimer=fn.timer_start(2000,function ()
  if next(fn.filter(fn.getwininfo(),'v:val.quickfix && !v:val.loclist')) then
    vim.cmd'doautocmd User qfopen'
    fn.timer_stop(qftimer)
  end
end,{['repeat']=-1})
require'small_plugins.auto-save'.setup()
require'small_plugins.builder'.setup()
require'small_plugins.dff'.setup()
require'small_plugins.labull'.setup()
require'small_plugins.neofnl'.setup()
require'small_plugins.ranger'.setup()
require'small_plugins.session'.setup()
require'small_plugins.swapapos'.setup()
require'small_plugins.tabbm'.setup()
require'small_plugins.textobj'.setup()
require'small_plugins.unimpaired'.setup()
require'small_plugins.tabline'.setup()
local so=vim.api.nvim_create_autocmd('FileType',{callback=function()
  if fn.index({"fennel","sh","bash","python","lua","cpp","c","rust","fish","term","vim","java","html","javascript","norg"},vim.o.filetype)~=-1 then
    vim.cmd"syntax off"
  else
    vim.cmd"syntax on"
  end
end})
vim.api.nvim_create_autocmd('User',{pattern='s1',callback=function ()
  vim.api.nvim_del_autocmd(so)
  vim.cmd'syntax on'
end})
vim.filetype.add({extension={bf='bf',slisp='lisp'}})
function vim.pprint(...)
  local args={...}
  vim.schedule(function ()
    vim.notify(vim.inspect(#args<2 and unpack(args) or args))
  end)
end
function vim.oprint(...)
  return vim.fn.writefile(vim.fn.split(vim.inspect(...),'\n'),'out')
end
function vim.aprint(...)
  return vim.fn.writefile(vim.fn.split(vim.inspect(...),'\n'),'out','a')
end
function vim.traceback(mode)
  return vim.fn.writefile(vim.fn.split(debug.traceback(),'\n'),'out',mode or 'a')
end




vim.api.nvim_create_autocmd({'InsertEnter','CmdlineEnter','TermEnter'},{callback=function(ev)
  vim.opt.runtimepath:append('/home/user/.config/nvim/.other/ua')
  vim.opt.runtimepath:append('/home/user/.config/nvim/.other/nvim-autopairs-fork')
  vim.opt.runtimepath:append('/home/user/.config/nvim/.other/npairs-integrate-upair')
  --require'npairs-int-upair'.setup({npairs_conf={enable_delete_pair_before=true,enable_abbr=true},bs='u',map='n'})
  local upair=require'ultimate-autopair'
  upair.setup({
    space2={
      enable=true
    },
    extensions={
      fly={nofilter=true},
      tsnode={outside={'comment'},p=50},
    },
    config_internal_pairs={
      {'"','"',fly=true},
      {"'","'",fly=true},
    },
  })
  require'ultimate-autopair.experimental.terminal'.setup()
  vim.api.nvim_del_autocmd(ev.id)
end})
vim.cmd.colorscheme'mini'
