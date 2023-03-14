vim.fn.timer_start(1000,function() vim.fn.execute('silent! checktime') end,{['repeat']=-1})
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
--vim.g.loaded_tutor_mode_plugin=1
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
require'self_plugins.auto-save'
require'self_plugins.dff'
require'self_plugins.session'
require'self_plugins.neofnl'
require'self_plugins.labull'
require'self_plugins.ranger'
require'self_plugins.tabline'
require'self_plugins.textobj'
require'self_plugins.unimpaired'
require'self_plugins.builder'
require'self_plugins.swapapos'
require'self_plugins.bookend'
require'self_plugins.tabbm'
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
  return vim.notify(vim.inspect(...))
end
function vim.oprint(...)
  return vim.fn.writefile(vim.fn.split(vim.inspect(...),'\n'),'out')
end



vim.opt.runtimepath:append('/home/user/.config/nvim/.other/ultimate-autopair.nvim')
vim.opt.runtimepath:append('/home/user/.config/nvim/.other/nvim-autopairs-fork')
vim.opt.runtimepath:append('/home/user/.config/nvim/.other/npairs-integrate-upair')
vim.api.nvim_create_autocmd({'InsertEnter','CmdlineEnter'},{callback=function(ev)
  require'npairs-int-upair'.setup({npairs_conf={ignored_next_char=''},bs='u'})
  vim.api.nvim_del_autocmd(ev.id)
end})
vim.cmd.colorscheme'mini'
