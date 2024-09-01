----init
local function fmap(cmd,name,null)
  local tbl={[null and 'à' or 'ß']=name:gsub('%%s',null and '0..9' or '1..9')}
  for i=null and 0 or 1,9 do
    tbl[tostring(i)]={cmd:gsub('%%s',i),'which_key_ignore'}
  end
  return tbl
end
local function cmap(inp,cmd,name,add)
  local tbl={}
  for k,v in pairs(inp) do
    tbl[k]=vim.tbl_extend('error',{cmd:format(v),name:format(v)},add or {})
  end
  return tbl
end
local function format(tbl)
  for k,v in pairs(tbl) do
    if k=='_' then
      for k2,v2 in pairs(tbl._) do
        tbl[k2]=v2
      end
      tbl._=nil
    elseif type(v)=='table' then
      format(v)
    end
  end
  return tbl
end
local function tabbufmove(num)
  local buf=vim.fn.bufnr()
  local win=vim.api.nvim_get_current_win()
  vim.cmd.tabnext(num)
  vim.cmd.sbuf{buf,mods={vertical=true}}
  vim.api.nvim_win_close(win,true)
end
_G.Tabbufmove__=tabbufmove
require'which-key'.setup{
  key_labels={['ß']='1..9',['à']='0..9'},
  triggers={' ','<C-w>'},
  plugins={
    marks=false,
    registers=false,
    spelling={enabled=false},
    presets={
      operators=false,
      motions=false,
      text_objects=false,
      nav=false,
      z=false,
      g=false,
    }}}
require'which-key'.register{[' ']=format{

  ----main
  b={require'small.bufend'.run,'bufend'},
  r={function () pcall(vim.cmd.lcd,vim.fn.expand'%:p:h') require'small.dff'.file_expl() end,'dff'},
  ["'"]={':lua require"small.nterm".run("fish",true)\r','shell'},
  i={function () require'oil'.open() end,'edir'},
  P={':Lazy\r','lazy'},
  ------window/buffer
  q={'<cmd>q\r','quit'},
  Q={'<cmd>q!\r','QUIT!'},
  x={'<cmd>qall\r','quitall'},
  v={function () vim.cmd.vsplit() end,'vsplit'},
  e={function () vim.cmd.split() end,'split'},
  D={function ()
    local buf=vim.api.nvim_get_current_buf()
    local sbuf=vim.api.nvim_create_buf(false,true)
    vim.bo[sbuf].bufhidden='wipe'
    for _,win in ipairs(vim.fn.win_findbuf(buf)) do
      vim.api.nvim_win_set_buf(win,sbuf)
    end
    pcall(vim.api.nvim_buf_delete,buf,{})
  end,'buffer-delete'},
  u={':lua vim.api.nvim_set_current_buf(vim.api.nvim_create_buf(true,true))\r','scratch'},
  w={'<cmd>WhichKey <C-w>\r','window'},
  y={name='+spell',_=cmap({e='en',s='sv'},':set spelllang=%s\r','lang=%s',{silent=false})},

  ---cmd/app
  c={name='+cmd/app',
    t={':InspectTree\r','TSPlayground'},
    n={':lua require"small.notify".dismiss()\r','dismiss notify'},
    N={':lua require"small.notify".open_history()\r','open notify history'},
    m={':MarkdownPreview\r','markdown-preview'},
    l={':edit /tmp/nlog\r','open-log'},
    r={require'small.reminder'.sidebar,'reminder sidebar'},
  },

  ---tabs
  ['<tab>']={name='+tab',
    d={':tabclose\r','delete'},
    ['<']={':-tabmove\r','move-prev'},
    ['>']={':+tabmove\r','move-next'},
    ['<tab>']={':tab split\r','new'},
    _=fmap(':tabnext %s\r','tab-%s'),
    ['0']={':tablast\r','tab-last'},
    m={name='+move-buffer',
      _=fmap(':lua _G.Tabbufmove__(%s)\r','tab-%s'),
      ['0']={function() tabbufmove'$' end,'last'},
      ['<']={function() tabbufmove'-' end,'prev'},
      ['>']={function() tabbufmove'+' end,'next'},
    },
  },

  ---files
  f={name='+files',
    W={function ()
      local tmp=vim.fn.tempname()
      vim.fn.writefile(vim.fn.getline(1,vim.fn.line('$')),tmp)
      vim.cmd.vnew()
      local buf=vim.fn.bufnr()
      vim.fn.termopen('cat '..tmp..'|sudo tee >/dev/null '..vim.fn.expand('#:p'),{
        on_exit=function (_,code,_)
          vim.cmd.bdelete({buf,bang=true})
          if code==0 then vim.o.modified=false end
        end
      })
      vim.cmd.startinsert()
    end,'sudosave'},
    c={':!wl-copy "%:p"\r','copy-path',silent=false},
    f={':Telescope find_files\r','find'},
  },

  ----search
  s={name='+search',
    a={':Telescope\r','telescope'},
    c={':lua require"small.colors".search_colors()\r','colorscheme'},
    C={':lua require"small.colors".search_colors_online()\r','colors-online'},
    P={require'small.plugin_search'.run,'plugins-online'},
    p={':Telescope find_files cwd=/home/user/.local/share/nvim/lazy/ find_command=ls\r','plugins'},
    r={':Telescope find_files cwd=/usr/local/share/nvim/runtime\r','root-runtime'},
    _=cmap({f='find_files',o='oldfiles',s='live_grep',h='help_tags',m='marks',b='buffers',[' ']='resume'},':Telescope %s\r','%s'),
    g={':Telescope grapple tags\r','grapple'},
  },

  ----toggle/theme
  t={name='+toggle/theme',
    t={':nohls\r','disable-search'},
    z={function () require'small.kitty'.toggle_padding(20) end,'toggle-padding'},
    C={function ()
      vim.cmd.hi('Cursor blend=100')
      vim.o.guicursor='a:Cursor/lCursor,a:ver1'
    end,'hide-cursor'},
    c={':set guicursor&\r','reset-cursor'},
  },

  ----lsp
  l={name='+lsp',
    f={':lua require"small.format".run()\r','format'},
    I={':lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())\r','toggle-inlay-hint'},
    i={':LspInfo\r','info'},
    s={':LspStop\r','stop'},
    S={':LspStart\r','start'},
    r={':Telescope lsp_references\r','search-references'},
    t={':lua vim.lsp.buf.type_definition()\r','type'},
    c={':lua vim.lsp.buf.code_action()\r','code-action'},
    n={':lua vim.diagnostic.goto_next({_highest=true})\r','diagnostic-next'},
    p={':lua vim.diagnostic.goto_prev({_highest=true})\r','diagnostic-prev'},
  },

  ---debug
  d={name='+debug',
    b={':lua require"dap".toggle_breakpoint()\r','toggle breakpoint'},
    R={':lua require"dap.repl".toggle()\r','repl'},
    c={':lua require"dap".continue()\r','continue'},
    n={':lua require"dap".step_over()\r','next'},
    i={':lua require"dap".step_into()\r','into'},
    r={"<cmd>lua require'small.qvim2'.open_run_buf()\r",'open-run-buf'},
    s={"<cmd>lua require'small.qvim2'.run()\r",'start'},
  },

  ---grapple
  h={name='+grapple',
    a={':Grapple toggle\r','append'},
    n={':Grapple cycle forward\r','next'},
    p={':Grapple cycle backward\r','prev'},
    h={':Grapple toggle_tags\r','menu'},
  },
},['<C-w>']=format{
    _=vim.tbl_extend('error',fmap(':%swincmd w\r','window %s'),
      cmap({['<C-h>']='left',['<C-j>']='down',['<C-k>']='up',['<C-l>']='right'},':WinShift %s\r','move %s')
    )}}
