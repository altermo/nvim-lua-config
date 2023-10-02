vim.g.loaded_spellfile_plugin=1
vim.g.loaded_fzf=1
vim.g.loaded_matchparen=1
vim.g.loaded_matchit=1
vim.g.loaded_tarPlugin=1
vim.g.loaded_gzip=1
vim.g.loaded_zipPlugin=1
vim.g.loaded_2html_plugin=1
vim.g.loaded_netrw=1
vim.g.loaded_netrwPlugin=1
vim.g.loaded_remote_plugins=1

vim.fn.timer_start(100,function() vim.fn.execute('silent! checktime') end,{['repeat']=-1})
vim.fn.timer_start(120,function() vim.cmd"doautocmd User s1" end)

local open=vim.ui.open
---@source /usr/local/share/nvim/runtime/lua/vim/ui.lua:127
---@diagnostic disable-next-line: duplicate-set-field
function vim.ui.open(path)
  if path:match'^[a-zA-Z0-9._-]+/[a-zA-Z0-9._-]+$' then
    if pcall(open,'https://github.com/'..path) then return end
  end
  open(path)
end

function vim.pprint(...)
  local s,args=pcall(vim.deepcopy,{...})
  if not s then args={...} end
  vim.schedule_wrap(vim.notify)(vim.inspect(#args>1 and args or unpack(args)))
end
vim.lg=require'utils.log'.log
vim.lgclear=require'utils.log'.log_clear
vim.lgstart=require'utils.log'.log_start
vim.lgend=require'utils.log'.log_end
vim.traceback=require'utils.log'.log_traceback
vim.req=require'utils.lib'.req
require'config.small'
