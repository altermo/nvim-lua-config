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

vim.fn.timer_start(100,function() vim.fn.execute('silent! checktime') end,{['repeat']=-1})
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
  'trans',
})

vim.api.nvim_create_autocmd({'InsertEnter','CmdlineEnter','TermEnter','CursorMoved'},{callback=function()
  vim.opt.runtimepath:append('/home/user/.config/nvim/.other/ua')
  require'config.ultimate'
end,once=true})
