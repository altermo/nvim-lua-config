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
require'small_plugins.auto-cd'.setup()
require'small_plugins.auto-save'.setup()
require'small_plugins.builder'.setup()
require'small_plugins.dff'.setup()
require'small_plugins.highlight-selected'.setup()
require'small_plugins.labull'.setup()
require'small_plugins.large-file'.setup()
require'small_plugins.match_all'.setup()
require'small_plugins.onelinecomment'.setup()
require'small_plugins.ranger'.setup()
require'small_plugins.tabline'.setup()
require'small_plugins.textobj'.setup()
require'small_plugins.unimpaired'.setup()
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
local input=vim.ui.input
---@diagnostic disable-next-line: duplicate-set-field
vim.ui.input=function (opts,f)
  --Note: replacing with <C-v>digits also works
  --Example for esace: replace(default,'','027')
  if opts.default then
    local default=vim.fn.keytrans(opts.default)
    if default~=opts.default then
      local fun=f
      f=function (inp) fun(inp and vim.keycode(inp) or inp) end
      opts.default=default
    end
  end
  input(opts,f)
end
vim.api.nvim_create_autocmd({'InsertEnter','CmdlineEnter','TermEnter'},{callback=function(ev)
  vim.opt.runtimepath:append('/home/user/.config/nvim/.other/ua')
  local upair=require'ultimate-autopair'
  upair.setup({
    space2={
      enable=true
    },
    extensions={
      --fly={nofilter=true},
      --tsnode={outside={'comment'},p=50,filter=true},
      --[require'ultimate-autopair.experimental.cond']={p=55},
    },
    config_internal_pairs={
      {'"','"',fly=true},
      {"'","'",fly=true,cond={function(o,_,fns)
        return not fns.in_lisp(o) or fns.in_string(o)
      end}},
    },
  })
  --require'ultimate-autopair.experimental.terminal'.setup()
  --require'ultimate-autopair.experimental.tabout'.setup()
  vim.api.nvim_del_autocmd(ev.id)
  --vim.opt.runtimepath:remove('/home/user/.config/nvim/.other/ua_')
  --vim.opt.runtimepath:append('/home/user/.config/nvim/.other/ua')
end})
