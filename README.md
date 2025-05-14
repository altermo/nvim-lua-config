> [!NOTE]
> The README is the config, and the `init.lua` is only for tangling.

> [!TIP]
> In the README, some (really-useful) information are inside the code-block posing as lua-comments.

# Utility functions
* `autocmd`: Creates an autocommand.
* `map`: Creates a keymap.
* `plugin`: Defines a plugin.
* `space_map`: Creates a space keymap.
<details>
<summary>The code (click to expand)</summary>

```lua
local function map(mode,lhs,rhs,opt)
  opt=(opt=='expr' and {expr=true,replace_keycodes=true,noremap=true}) or opt or {noremap=true,silent=true}
  if type(rhs)=='function' then opt.callback=rhs rhs='' end
  for _,i in ipairs(type(lhs)=='table' and lhs or {lhs}) do
    vim.api.nvim_set_keymap(mode,i,rhs,opt)
  end
end
local function autocmd(au,callback,opt)
    return vim.api.nvim_create_autocmd(au,vim.tbl_extend('error',{callback=callback},opt or {}))
end
local _plugins={}
local function plugin(opt)
  table.insert(_plugins,opt)
end
```
```lua space
local function space_map(lhs,rhs,opt)
  vim.keymap.set('n',' '..lhs,rhs,opt)
end
```
</details>

# LSP & autocomplete (& diagnostics)
## Autocomplete
```lua

-- Applies to all insert mode completion.
vim.o.completeopt='menu,menuone,popup,noselect,fuzzy'

-- Applies to only default completion. (e.g. when lsp not acttive)
-- I only want to complete the words which are in the current buffer.
vim.o.complete='.'

-- Applies to cmdline completion.
-- What it does:
--  First <tab>: Completes the longest common substring and oppens the completion menu. (This is actually really useful)
--  Second <tab>: Cycles through the completions in the completion menu.
vim.o.wildmode='longest:full,full'
```
```lua imap
autocmd('InsertCharPre',function ()
    if vim.fn.match(vim.v.char,[[\V\k\|.]])==-1 or vim.fn.state'm'=='m' or vim.fn.pumvisible()~=0 then return end
    if vim.o.omnifunc~='v:lua.vim.lsp.omnifunc' then
        vim.api.nvim_input('<C-x><C-n>')
    else
        vim.api.nvim_input('<C-x><C-o>')
    end
end)

map('i','<tab>','pumvisible()?"<c-n>":"<tab>"','expr')
map('i','<S-tab>','pumvisible()?"<c-p>":"<S-tab>"','expr')
```

### AI
Mostly useful as a smart copy/paste.
```lua
plugin{'supermaven-inc/supermaven-nvim',opts={
  keymaps={
    accept_suggestion='<A-cr>',
    clear_suggestion='<nul>',
    accept_word='<C-cr>',
  },
},event={'InsertEnter'}}
```

## LSP
```lua
plugin{'neovim/nvim-lspconfig',config=function ()

  -- A key-value table of lsp-servers and their settings.
  -- NOTE: The first entry is the lsp-executable and is ignored by the config.
  for lsp,opt in pairs({
    basedpyright={'basedpyright-langserver',settings={basedpyright={analysis={typeCheckingMode='standard'}}}},
    lua_ls={'lua-language-server',settings={Lua={
      runtime={version='LuaJIT',unicodeName=true},
      workspace={library={'/usr/local/share/nvim/runtime/lua/'}}}}},
    clangd={'clangd'},
    rust_analyzer={'rust-analyzer'},
    zls={'zls'},
    taplo={'taplo'},
    ts_ls={'typescript-language-server'},
    vimls={'vim-language-server'},
  }) do

    -- If lsp executable not found, notify.
    if vim.fn.executable(opt[1])==0 then vim.notify(opt[1]..' LSP executable not found') end

    vim.lsp.config[lsp]=vim.tbl_extend('force',vim.lsp.config[lsp],opt)
    vim.lsp.enable(lsp)
  end
end,event='User Later'}
```

### Signature help
```lua imap
map('i','<A-tab>',function ()
  vim.lsp.buf.signature_help{focusable=false,silent=true,max_height=4,anchor_bias='above'}
end)
```

### Renaming
Shows how many things got renamed in how many files.
```lua later
local rename=vim.lsp.handlers['textDocument/rename']
vim.lsp.handlers['textDocument/rename']=function(_,result,ctx)
    rename(_,result,ctx)
    local changes=result.changes or result.documentChanges
    vim.notify(('Renamed %s instance in %s file'):format(
        vim.iter(changes):fold(0,function(a,_,n) return a+(#(n.edits or n)) end),
        #vim.tbl_keys(changes)))
end
```

### Space-mappings
```lua space
space_map('ls',':LspStop\r')
space_map('lS',':LspStart\r')
space_map('lr',':FzfLua lsp_references\r')

-- There's a hidden option `_highest` which jumps to the highest severity
space_map('ln',':lua vim.diagnostic.jump({count=1,_highest=true,float=true})\r')
space_map('lp',':lua vim.diagnostic.jump({count=-1,_highest=true,float=true})\r')

space_map('lt',':lua vim.lsp.buf.type_definition()\r')
space_map('lh',':lua vim.lsp.buf.hover()\r')
```
## Diagnostics
```lua later
vim.diagnostic.config({virtual_text=true,severity_sort=true})
```

# Windows
```lua
--Switching windows with `<C-hjkl>`; and if terminal, enter it.
for i in ('hjkl'):gmatch('.') do
  map('t','<C-'..i..'>','<C-\\><C-n><C-w>'..i..'<cmd>if &buftype=="terminal"|startinsert|endif\r')
  map('n','<C-'..i..'>','<C-w>'..i..'<cmd>if &buftype=="terminal"|startinsert|endif\r')
end

vim.o.splitbelow=true
vim.o.splitright=true
vim.o.winminheight=0
vim.o.winminwidth=0

-- Don't use any chars for window delimiters.
vim.o.fillchars='vert: ,eob: ,horiz: ,horizup: ,horizdown: ,vertleft: ,vertright: ,verthoriz: '
```
```lua space
space_map('q','<cmd>q\r')
space_map('Q','<cmd>q!\r')
space_map('v',function () vim.cmd.vsplit() end)
space_map('e',function () vim.cmd.split() end)
space_map('w','<C-w>',{noremap=false})
```

# Tabs
```lua
for i=1,9 do
  map('n','<A-'..i..'>',':tabnext '..i..'\r')
end
```
```lua space
-- Creates a new tab
space_map('<tab>',':tab split\r')

-- Moves tab to the left/right
space_map('<',':-tabmove\r')
space_map('>',':+tabmove\r')
```
## Tabbar
I use a vertical tab bar.
```lua small
require'small.verttab'.setup{}
vim.keymap.set('n','<A-Tab>',require'small.verttab'.show)
```

# Files & Directories
## Files
Check every 100ms if the file has changed, and update the buffer if it has.
```lua later
vim.fn.timer_start(100,function() vim.fn.execute('silent! checktime') end,{['repeat']=-1})
```

Auto save on text change.
```lua
autocmd({'InsertLeave','TextChanged'},function (ev)
    if ev.file=='' or not vim.o.modified or vim.o.readonly or vim.o.buftype~='' then return end
    pcall(vim.fn.mkdir,vim.fs.dirname(ev.file),'p')
    vim.cmd.update{bang=true,mods={emsg_silent=true,lockmarks=true}}
end,{group=vim.api.nvim_create_augroup('AutoSave',{})})
```

Sudo save file.
```lua space
space_map('W',function ()
  local tmp=vim.fn.tempname()
  vim.fn.writefile(vim.fn.getline(1,vim.fn.line('$')),tmp)
  vim.cmd.vnew()
  local buf=vim.fn.bufnr()
  vim.fn.jobstart('cat '..tmp..'|sudo tee >/dev/null '..vim.fn.expand('#:p'),{
    term=true,on_exit=function (_,code,_)
      vim.cmd.bdelete({buf,bang=true})
      if code==0 then vim.o.modified=false end
    end
  })
  vim.cmd.startinsert()
end)
```

Did you know you can use
<!-- html repr: --> <code>&#96;=...&#96;</code>
<!-- non-html repr: `=...` -->
in the place of file name to run an expression and use the value as the file name.
```lua space
space_map('u',':e `=tempname()`\r')
```

Copy file name.
```lua space
space_map('C',':call setreg("+","<C-r>=expand("%:p")\r")\r',{noremap=true})
```

## Directories
Auto change directory to the git root (or directory) of the file.
```lua
autocmd('BufReadPre',function (ev)
  if vim.o.buftype~='' then return end
  vim.schedule_wrap(pcall)(vim.cmd.lcd,{vim.fs.root(ev.file,'.git') or vim.fs.dirname(ev.file),mods={silent=true}})
end,{group=vim.api.nvim_create_augroup('AutoCd',{})})
```

Quick directory change.
```lua
map('n','dc',':lcd ..|pwd\r')
map('n','cd',':lcd %:p:h|pwd\r')
```

## Filesystem explorer/navigation
There are 3 of them:
### Oil
A plugin which is useful to edit directories and other similar operations.
```lua space
space_map('i',function () require'oil'.open() end)
```
```lua
plugin{'stevearc/oil.nvim',cmd='Oil',config=function ()
  require'oil'.setup{view_options={show_hidden=true},skip_confirm_for_simple_edits=true,keymaps={['<C-h>']=false,['<C-l>']=false}}

  -- When entering a oil:// buffer, change current directory to the one of the buffer.
  vim.api.nvim_create_autocmd('BufWinEnter',{pattern='oil://*',callback=function ()
    pcall(vim.cmd.lcd,require'oil'.get_current_dir())

  end}) end,lazy=false}
```
### Yazi
A tui file manager, mostly used when doing bigger file operations and generally file-exploring.
```lua space
space_map('y',':lua require"small.nterm".run("yazi -- "..vim.fn.expand"%:p")\r')
```
### Dff
My own plugin, can get you to your file really fast (typically 1-3 key presses), but isn't good at file-exploring.
```lua space
space_map('r',function () pcall(vim.cmd.lcd,vim.fn.expand'%:p:h') require'small.dff'.file_expl() end)
```

# Search
```lua
plugin{'ibhagwan/fzf-lua',cmd='FzfLua',opts={winopts={backdrop=100},oldfiles={formatter='path.filename_first'}}}
```
```lua space
--Search between plugins.
space_map('sp',':FzfLua files cmd=fd\\ --max-depth=1 previewer=false cwd=/home/user/.local/share/nvim/lazy/\r')

--Search neovim runtime files.
space_map('sr',':FzfLua files cwd=/usr/local/share/nvim/runtime/\r')

space_map('so',':FzfLua oldfiles formatter=path.filename_first\r')
for k,v in pairs{a='',f='files',s='live_grep',h='helptags',b='buffers',[' ']='resume',g='git_status'} do
  space_map('s'..k,':FzfLua '..v..'\r')
end
```

## Text search (& replace)
```lua
-- Easier for me to press <M-e> than /
map('n','<M-e>','/',{noremap=true})

--Search and replace selected word.
map('x','<A-f>','y:<C-u>%s/<C-r>"//g<Left><Left>a<bs>',{silent=false})

vim.o.ignorecase=true
vim.o.smartcase=true
```
```lua space
space_map('t',':nohls\r')
```

# Spell
Uses [typos](https://github.com/crate-ci/typos) to check spelling.
```lua small
require'small.typo'.setup{}
```
```lua space
space_map('sle',':set spelllang=en\r',{noremap=true})
space_map('sls',':set spelllang=sv\r',{noremap=true})
```
```lua
--spell, set the amount of suggestions because otherwise more-prompt.
map('n','=',':set sps=best,<C-r>=&lines-3\r\rz=')

-- Correct detect spell of CamelCased words.
vim.o.spelloptions='camel'
```

# Pairs
```lua
--Auto-pair
--Temporary, until ultimate-autopair.nvim v0.7 is released, so that I'm motivated to finish it.
plugin{'echasnovski/mini.pairs',event={'InsertEnter','CmdlineEnter'},opts={modes={command=true}}}

--Operations on pairs
plugin{'echasnovski/mini.surround',opts={
  mappings={
    add='S',
    delete='ds',
    find='',
    find_left='',
    highlight='',
    replace='cs',
    update_n_lines='',
  }},keys={{'S',mode={'n','x'}},'ds','cs'}}

--Rainbow pairs
plugin{'https://gitlab.com/HiPhish/rainbow-delimiters.nvim',event='User Later',config=function()
  vim.g.rainbow_delimiters={strategy={html=function (bufnr) return vim._with({buf=bufnr},function ()
    return vim.fn.wordcount().bytes<50000 and require'rainbow-delimiters'.strategy.global or nil
  end)end}} vim.cmd.doau'FileType' end,dependencies={'nvim-treesitter/nvim-treesitter'}}

--Keyword pairs
plugin{'PriceHiller/nvim-treesitter-endwise',event={'InsertEnter'},config=function() vim.cmd.TSEnable'endwise' end,dependencies={'nvim-treesitter/nvim-treesitter'},branch='fix/iter-matches'}

--Pair surrounding operators
plugin{'echasnovski/mini.ai',opts={},keys={{'a',mode={'o','x'}},{'i',mode={'o','x'}}}}

-- Shorthands for surrounding operators.
for i in ([['"`()[]{}<>]]):gmatch('.') do
  map('o',i,'i'..i,{silent=true})
  map('x',i,'i'..i,{silent=true})
end
```

# Insert/Cmdline/Terminal keymaps
```lua ictmap
-- Some terminals don't work with one of theme, so that's why there's two.
map('c',{'<C-S-v>','<C-A-v>'},'<C-r>+',{noremap=true})

-- I write swedish, not norwegian.
map('i','ø','ö')
map('i','æ','ä')
map('i','Ø','Ö')
map('i','Æ','Ä')

for k,v in pairs{
  [{'<C-BS>','<M-BS>','<S-BS>'}]='<del>',

  -- Command line treats all non-space characters as word-characters.
  -- So instead just do 5 character jumps.
  [{'<S-Left>','<M-S-h>'}]=('<Left>'):rep(5),
  [{'<S-Right>','<M-S-l>'}]=('<Right>'):rep(5),

  -- (Mostly) emacs keybindings
  ['<M-b>']='<S-Left>',
  ['<M-f>']='<S-Right>',
  [{'<C-b>','<M-h>'}]='<Left>',
  [{'<C-f>','<M-l>'}]='<Right>',
  ['<A-j>']='<Down>',
  ['<A-k>']='<Up>',
  ['<C-e>']='<End>',
  ['<C-a>']='<Home>',
  ['<C-g>']='<C-\\><C-n>',
} do
  map('i',k,v)
  map('c',k,v,{noremap=true})
end

map('t','<C-\\>','<C-\\><C-n>')
-- When running a neovim-terminal inside a neovim-terminal.
map('t','<C-A-\\>','<C-\\><C-\\>')
```

## Snippets
```lua
autocmd('FileType',function()
    local function bino(lhs,rhs) vim.keymap.set('i',lhs,rhs,{buffer=true}) end

    -- Mostly unicode
    --- AltGr + l
    bino('ł','local ')
    --- AltGr + f
    bino('đ','function ')
    --- AltGr + r
    bino('®','return ')
    --- AltGr + v
    bino('„','vim.')
    --- AltGr + a
    bino('ª','vim.api.nvim_')

    -- But also, this
    bino('M','M.')

end,{pattern='lua'})
```

The NO keyboard layout is not optimized to press '`' three times in a row, so this is the workaround.
```lua
autocmd('FileType',function()
  vim.keymap.set('i','`','getline(".")==""?"```":"`"',{buffer=true,expr=true})
end,{pattern='markdown'})
```

# Dashboard
I don't care about dashboards, so the "dashboard" is just a scratch-buffer where I can quickly write down stuff.
```lua
autocmd('VimEnter',function ()
    if vim.api.nvim_buf_line_count(0)>1 or
        vim.api.nvim_buf_get_lines(0,0,-1,false)[1]~='' or
        vim.api.nvim_buf_get_name(0)~='' then return end
    vim.bo.buftype='nofile'
end,{once=true})
```

# Colors
Auto change terminal background(e.g. padding) color to nvim's background color, and restore on exit.
Previously there was one autocmd for when `background`(e.g. light/dark mode setting) changed, but that caused an infinite CSI loop where: set terminal background color -> terminal send's that it's dark/light mode -> neovim updates `background` -> autocmd fires -> set terminal background color... (or something like that, I'd not look into it too deep)
```lua
autocmd('VimLeave',function() io.stdout:write("\027]111;;\027\\") end)
local function sync_background() io.stdout:write(("\027]11;#%06x\027\\"):format(vim.api.nvim_get_hl(0,{name='Normal',link=false}).bg or 0)) end
autocmd('ColorScheme',vim.schedule_wrap(sync_background))
```

## Colorscheme
Yes, I'm using a light theme. It's not that bad, once you apply a 4000k temperature filter ontop of it.
```lua
plugin{'EdenEast/nightfox.nvim',lazy=false,config=function ()
  vim.cmd.colorscheme'dayfox'

  -- I don't like to have a visible horizontal window separator.
  -- So just hide it.
  vim.cmd.hi'clear StatusLine'
  vim.cmd.hi'clear StatusLineNC'
end}
```

# UI
Neovim's experimental command-line/message UI.
Is a replacement for notify plugins.
```lua
require('vim._extui').enable{}
```

# Treesitter
```lua
plugin{'nvim-treesitter/nvim-treesitter',config=function ()
  require'nvim-treesitter.configs'.setup{highlight={enable=true},indent={enable=true}}
end,

  -- On update, install and update all parsers.
  build={':TSInstall all',':TSUpdate'},

  event={'FileType'}}
```

## Selection
Similar to Helix's treesitter selection
```lua small
local ts=require'small.treeselect'
vim.keymap.set('n','vn',ts.current)
vim.keymap.set('n','vr',ts.line)
vim.keymap.set('x','<C-h>',ts.prev)
vim.keymap.set('x','<C-l>',ts.next)
vim.keymap.set('x','<C-k>',ts.up)
vim.keymap.set('x','<C-j>',ts.down)
```

# Macro
Minimal macro plugin.
+ `q`: toggle macro recording.
+ `Q`: run macro.
+ `cq`: edit macro.
```lua
autocmd('RecordingLeave',function ()
    if vim.v.event.regcontents=='' then
        vim.notify'empty macro, previous recoding is kept'
        return vim.schedule_wrap(function (prev) vim.fn.setreg('q',prev) end)(vim.fn.getreg'q') end
    vim.notify('Recorded macro: '..vim.fn.keytrans(assert(vim.v.event.regcontents)))
end)
map('n','q','(reg_recording()==""?"qq":"q")','expr')
map('n','Q','(reg_recording()==""?reg_executing()==""?"@q":"":v:lua.vim.notify("Cant play macro while recoding")??"")','expr')
map('n','cq','<cmd>let b:_macro=input(">",keytrans(@q))|let @q=(trim(b:_macro)!=""?v:lua.vim.keycode(b:_macro):@q)\r')
```

# Options
```lua
---indent
vim.o.tabstop=4
vim.o.shiftwidth=0
vim.o.smartindent=true
vim.o.cindent=true
vim.o.expandtab=true
vim.o.indentexpr='v.lua:require"nvim-treesitter".indentexpr()'

---warp
vim.o.linebreak=true
vim.o.showbreak='↳ '
vim.o.breakindent=true

---visual
vim.o.list=true
vim.o.statusline=' '
vim.o.signcolumn='no'
vim.o.laststatus=0
vim.o.cmdheight=0
vim.o.conceallevel=2
vim.o.pumblend=20

---data
vim.o.undofile=true
vim.o.swapfile=false

---other
vim.o.scrolloff=5
vim.o.timeoutlen=500
vim.o.shortmess='ascoOAFWI'
vim.o.virtualedit='block,onemore'
vim.o.smoothscroll=true
vim.o.mouse='a'
vim.o.concealcursor='nc'
vim.o.shada="'500,/9,:50,<50,@9,s10"
```
## Option-keymap
```lua
for k,v in pairs({
  b={'background','"light"','"dark"'},c={'cmdheight',1,0},l='list',
  m={'conceallevel',2,0},L={'laststatus',2,0},w='wrap',d='diff',
  s='spell',f='foldenable',e='scrollbind',S={'statusline','" "'}
}) do
  v=type(v)=='table' and v or {v,1,0}
    map('n','yo'..k,function ()
      vim.cmd(('let &%s%s=&%s==%s?%s:%s|redraw|echo "%s=".&%s')
      :format(k=='d' and 'l:' or '',v[1],v[1],v[2],v[3] or '""',v[2],v[1],v[1])) end)
end
```

# Other Keymaps
```lua
-- I like using `gc` to comment current line, so I replace `gcc` with `gc`
vim.api.nvim_del_keymap('n','gcc')
map('n','gc',function () return require('vim._comment').operator()..'_' end,'expr')

map('x','gc',function () return require('vim._comment').operator()..'gv' end,'expr')

-- Select pasted text.
map('n','gp','`[v`]')

-- `<C-]>` is just a better `gd`, but fallback to `gd` if `<C-]>` doesn't work.
map('n','gd',function () return (vim.o.tagfunc~='' or #vim.fn.tagfiles()>0) and '<C-]>' or 'gd' end,'expr')

-- Select all, but don't glober the jumplist.
map('n','<A-a>','G:keepjumps norm! Vgg\r')

-- Copy current yank to clipboard.
map('n','<A-y>',':let @+=@"\r')

-- Move current line up/down.
map('n','<A-j>',':move +1\r')
map('n','<A-k>',':move -2\r')

--
map('n',{'<M-x>','<M-S-.>'},':lua=',{noremap=true})

-- If on first char, goto first non-whitespace char.
map('n','0','(reg_recording()==""&&reg_executing()==""&&col(".")==1)?"^":"0"','expr')

-- Redo everything.
map('n','U',':later 1f\r')

map('n','ø','<C-r>')

-- Source current file.
map('n','<F6>',':source\r')

--
map('n',',','<C-o>')
map('n',';','<C-i>')

map('n','.',':',{noremap=true})
map('x','.',':',{noremap=true})

map('n','å','"+p')
map('x','æ','"+y')
map('x','å','"+p')

map('n','π','yyp')

map('n','\r','&buftype=="quickfix"?"\r":"dd"','expr')
map('x','\r','d',{})

map('n','g:','q:')
map('n','g/','q/')

map('n','vv','V')

map('n',{'<A-.>','<C-.>'},'.')

--`>>` and `<<` don't tab empty lines, so this is the workaround.
map('n',{'<tab>','<A-l>'},'a<C-T><esc>')
map('n',{'<S-tab>','<A-h>'},'a<C-D><esc>')

map('n','j','v:count==0?"gj":"j"','expr')
map('x','j','v:count==0?"gj":"j"','expr')
map('x','k','v:count==0?"gk":"k"','expr')
map('n','k','v:count==0?"gk":"k"','expr')

map('x',{'<S-tab>','<A-h>','<'},'<gv')
map('x',{'<tab>','<A-l>','>'},'>gv')

--In char/line-visual mode, insert at the end/beginning of every selected line.
map('x','A',[[mode()=="\x16"?"A":"<esc>:au InsertLeave * ++once :'<+1,'>norm! $\".p\r'<A"]],'expr')
map('x','I',[[mode()=="\x16"?"I":"<esc>:au InsertLeave * ++once :'<+1,'>norm! _\".P\r'<I"]],'expr')

--When yanking, the cursor likes to jump to the beginning of the yank, so just don't.
map('x','y','ygv<esc>')

-- Don't yank on paste.
map('x','p','P')
map('x','P','p')
```

# Other
Here goes everything that doesn't fit in any other category.

Auto jump to last known position.
```lua
autocmd('BufRead',function() pcall(vim.cmd --[[@as function]],[[noautocmd norm! g`"]]) end)
```

Live preview markdown/html files.
```lua
plugin{'brianhuster/live-preview.nvim',opts={},cmd='LivePreview'}
```

Makes it so that you can `gx` a plugin name and open the github page for it.
```lua
local open=vim.ui.open
rawset(vim.ui,'open',function(path) return open((path:gsub('^([a-zA-Z0-9._-]+/[a-zA-Z0-9._-]+)$','https://github.com/%1'))) end)
```

A simple logging function.
```lua
function vim.lg(...)
    if vim.in_fast_event() then return vim.schedule_wrap(vim.lg)(...) end
    return vim.fn.writefile(vim.fn.split(vim.inspect(#{...}>1 and {...} or ...),'\n'),'/tmp/nlog','a')
end
```
```lua space
space_map('cl',':edit /tmp/nlog\r')
```

Highlight every instance of selected text.
```lua small
require'small.highlight_selected'.setup{}
```

When diff, fold the diff.
```lua
autocmd('OptionSet',function () vim.o.foldmethod=vim.v.option_new==true and 'diff' or 'manual' end,{pattern='diff'})
```

Better increment/decrement.
```lua
plugin{'monaqa/dial.nvim',keys={
  {'<C-a>',function () return require'dial.map'.inc_normal() end,expr=true},
  {'<C-x>',function () return require'dial.map'.dec_normal() end,expr=true},
}}
```

## Other-Mini-plugins
Reminder.
```lua small
require'small.reminder2'.conf={path='/home/user/.gtd/gtd/plans.md'}
require'small.reminder2'.setup{}
```
```lua space
space_map('cr',function () require'small.reminder2'.sidebar() end)
```

Terminal.
```lua space
space_map("'",':lua require"small.nterm".run("fish",true)\r')
```

Copyring. Also highlights yanks/pastes.
```lua small
require'small.copyring'.setup{}
```

Exchange.
```lua small
local ex=require'small.exchange'
vim.keymap.set('n','cx',ex.ex_oper)
vim.keymap.set('n','cX',ex.ex_eol)
vim.keymap.set('n','cxx',ex.ex_line)
vim.keymap.set('n','cxc',ex.ex_cancel)
vim.keymap.set('x','X',ex.ex_visual)
```

**Fast** **multi**line **f**ind
```lua small
local fs=require'small.fastmultif'
vim.keymap.set('n','t',fs.ffind)
vim.keymap.set('n','T',fs.rffind)
```

Open `:help` on current word (smartly).
```lua small
local hc=require'small.help_cword'
vim.keymap.set('n','K',hc.run)
```

Vertical/horizontal select same character.
```lua small
local to=require'small.textobj'
vim.keymap.set('x','im',to.wordcolumn,{expr=true})
vim.keymap.set('o','im',to.charcolumn,{expr=true})
vim.keymap.set('x','ik',to.wordrow,{expr=true})
vim.keymap.set('o','ik',to.charrow,{expr=true})
```

Quickly add lua function annotations.
```lua small
local w=require'small.whint'
vim.keymap.set('i',':',w.run,{expr=true})
```

Interactive lua scratchpad repl.
```lua space
space_map('cR',function () require'small.luay'.run() end)
```

# Mini-plugin
```lua
plugin{'altermo/small.nvim',config=function()

  -- This is a macro
  &SMALL!()

end,lazy=false}
```

# Plugin-manager
## AutoInstall
```lua
local lazypath=vim.fn.stdpath'data'..'/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
  vim.system{'git','clone','--filter=blob:none','https://github.com/folke/lazy.nvim.git','--branch=stable',lazypath}:wait()
end
```

## Setup & optinos
```lua
vim.opt.rtp:prepend(lazypath)

-- Why not `:Lazy\r`, because the command may not be defined yet at startup.
map('n','\\p','<cmd>lua require"lazy.view.commands".cmd("")\r')

require'lazy'.setup(_plugins,{

    -- I don't care about lock files
    lockfile='/dev/null',

    -- Lazy everything by default
    defaults={lazy=true},

    performance={rtp={disabled_plugins={
      'matchparen',
      'matchit',
      'spellfile',
      'gzip',
      'zipPlugin',
      'man',

      -- Some of the project I work on has (useful) editorconfig files
      --  'editorconfig',

      'tohtml',
      'tarPlugin',
      'netrwPlugin',
      'netrw',
      'rplugin',
      'shada',
      'tutor',
    }}}})
```

# Space-map
```lua
map('n',' ',function ()
  vim.keymap.del('n',' ')

  -- This is a macro
  &SPACE!()

  vim.api.nvim_input(' ')
end)
```

# Lazy-loading
```lua
vim.api.nvim_create_autocmd('SafeState',{callback=function()

  -- This is a macro
  &LATER!()

  vim.cmd.doau'User Later'
end,once=true})
vim.api.nvim_create_autocmd('InsertEnter',{callback=function()

  -- This is a macro
  &IMAP!()

end,once=true})
vim.api.nvim_create_autocmd({'InsertEnter','CmdlineEnter','TermEnter'},{callback=function()

  -- This is a macro
  &ICTMAP!()

end,once=true})
```

<!-- vim: set conceallevel=0 ts=2 sw=2 : -->
