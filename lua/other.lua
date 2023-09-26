--vim.g.loaded_tutor_mode_plugin=1
--vim.g.loaded_man=1
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
vim.g.rplugins={'vim-ghost'}

vim.fn.timer_start(100,function() vim.fn.execute('silent! checktime') end,{['repeat']=-1})
vim.fn.timer_start(250,function() vim.cmd"doautocmd User s1" end)

local deprecate=vim.deprecate
---@source /usr/local/share/nvim/runtime/lua/vim/_editor.lua:1000
---@diagnostic disable-next-line: duplicate-set-field
function vim.deprecate(name,...)
  if os.time()<os.time({month=10,year=2023,day=1}) and
    name=='LanguageTree:for_each_child()' then return end
  deprecate(name,...)
end
local open=vim.ui.open
---@source /usr/local/share/nvim/runtime/lua/vim/ui.lua:127
---@diagnostic disable-next-line: duplicate-set-field
function vim.ui.open(path)
  if path:match'^[a-zA-Z0-9._-]+/[a-zA-Z0-9._-]+$' then
    if pcall(open,'https://github.com/'..path) then return end
  end
  open(path)
end

vim.api.nvim_create_autocmd('FileType',{callback=function()
  if pcall(vim.treesitter.get_parser) then
    vim.cmd'syntax off'
    vim.defer_fn(function () vim.cmd'syntax on' end,1000)
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
  local s,args=pcall(vim.deepcopy,{...})
  if not s then args={...} end
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
---@diagnostic disable-next-line: duplicate-set-field
function vim.lg(...)
  if vim.lg_started==false then return end
  local d=debug.getinfo(2)
  return vim.fn.writefile(vim.fn.split(
    ':'..d.short_src..':'..d.currentline..':\n'..
    vim.inspect(#{...}>1 and {...} or ...),'\n'
  ),'/tmp/nlog','a')
end
function vim.lgstart()
  vim.lgclear()
  vim.lg_started=true
end
function vim.lgend()
  vim.lg_started=false
end

function vim.req(pckg)
  package.loaded[pckg]=nil
  return require(pckg)
end
require'config.small'
