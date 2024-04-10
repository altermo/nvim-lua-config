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
require'which-key'.setup{
  key_labels={['ß']='1..9',['à']='0..9'},
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
  L={':Luapad\r','luapad'},
  C={require'small.chat'.run,'chat'},
  r={function () pcall(vim.cmd.lcd,vim.fn.expand'%:p:h') require'small.dff'.file_expl() end,'dff'},
  ["'"]={':lua require"small.nterm".run("fish",true)\r','shell'},
  --i={function () pcall(vim.cmd.lcd,vim.fn.expand'%:p:h') vim.cmd.edit'.' end,'edir'},
  i={function () require'oil'.open() end,'edir'},
  P={':Lazy\r','lazy'},
  z={'zMzv','fold-only'},
  ------window/buffer
  q={':q\r','quit'},
  Q={':q!\r','QUIT!'},
  x={':qall\r','quitall'},
  v={function () vim.cmd.vsplit() require'which-key'.show(' ',{mode='n'}) end,'vsplit+which'},
  e={function () vim.cmd.split() require'which-key'.show(' ',{mode='n'}) end,'split+which'},
  D={function ()
    local buf=vim.api.nvim_get_current_buf()
    local sbuf=vim.api.nvim_create_buf(false,true)
    vim.bo[sbuf].bufhidden='wipe'
    for _,win in ipairs(vim.fn.win_findbuf(buf)) do
      vim.api.nvim_win_set_buf(win,sbuf)
    end
    vim.api.nvim_buf_delete(buf,{})
  end,'buffer-delete'},
  u={':lua vim.api.nvim_set_current_buf(vim.api.nvim_create_buf(true,true))\r','scratch'},
  w={'<cmd>WhichKey <C-w>\r','window'},
  y={name='+spell',_=cmap({e='en',s='sv'},':set spelllang=%s\r','lang=%s',{silent=false})},
  F={name='+foldmethod',
    d={':set foldmethod=diff\r','diff'},
    t={':set foldmethod=expr\r:set foldexpr=v:lua.vim.treesitter.foldexpr()\r','treesitter'},
    f={':set foldmethod=expr\r:set foldexpr=v:lua.Fold(v:lnum)\r','default'},
  },

  ---cmd/app
  c={name='+cmd/app',
    t={':InspectTree\r','TSPlayground'},
    u={':lua require("undotree").toggle()\r','undotree'},
    n={':lua require"small.notify".dismiss()\r','dismiss notify'},
    N={':lua require"small.notify".open_history()\r','open notify history'},
    e={':silent !emacsclient %&\r','send-emacs'},
    m={':MarkdownPreview\r','markdown-preview'},
    l={':edit /tmp/nlog\r','open-log'},
    g={':lua require"mini.diff".enable()\r:lua require"mini.diff".toggle_overlay()\r','git-diff'},
    a={require'small.tableformat'.run,'format table'},
    r={require'small.reminder'.sidebar,'reminder sidebar'},
    c={':call codeium#Chat()\r','codeium chat'},
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
      _=fmap(':lua require"utils.lib".tabbufmove(%s)\r','tab-%s'),
      ['0']={function() require'core.utils.lib'.tabbufmove'$' end,'last'},
      ['<']={function() require'core.utils.lib'.tabbufmove'-' end,'prev'},
      ['>']={function() require'core.utils.lib'.tabbufmove'+' end,'next'},
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
    r={function () --TODO
      require'oil'.open()
      vim.defer_fn(function ()
        vim.api.nvim_feedkeys('f.i','n',false)
      end,100)
    end,'rename',silent=false},
    c={':!wl-copy "%:p"\r','copy-path',silent=false},
    f={':Telescope find_files\r','find'},
    t={name='+set-type',
      o={':setf ','other',silent=false},
      _=cmap({p='python',t='txt',v='vim',f='fish',r='rust',l='lua',m='markdown',c='c',h='html'},':set filetype=%s\r','%s')
    },
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
    m={':lua require"small.matchall".toggle()\r','toggle matchall'},
  },

  ----lsp
  l={name='+lsp',
    f={':lua require"small.format".run()\r','format'},
    I={':lua vim.lsp.inlay_hint.enable(0,not vim.lsp.inlay_hint.is_enabled())\r','toggle-inlay-hint'},
    i={':LspInfo\r','info'},
    s={':LspStop\r','stop'},
    S={':LspStart\r','start'},
    r={':Telescope lsp_references\r','search-references'},
    t={':lua vim.lsp.buf.type_definition()\r','type'},
    c={':lua vim.lsp.buf.code_action()\r','code-action'},
    n={':lua vim.diagnostic.goto_next()\r','diagnostic-next'},
    p={':lua vim.diagnostic.goto_prev()\r','diagnostic-prev'},
  },

  ---debug
  d={name='+debug',
    s={':lua require"small.qrun".run()\r','start'},
    b={':lua require"dap".toggle_breakpoint()\r','toggle breakpoint'},
    S={':lua require"small.dapnvim".start()\r','start-dap'},
    r={':lua require"dap.repl".toggle()\r','repl'},
    c={':lua require"dap".continue()\r','continue'},
    n={':lua require"dap".step_over()\r','next'},
    i={':lua require"dap".step_into()\r','into'},
  },

  ---grapple
  h={name='+grapple',
    a={':Grapple toggle\r','append'},
    n={':Grapple cycle forward\r','next'},
    p={':Grapple cycle backward\r','prev'},
    h={':Grapple toggle_tags\r','menu'},
  },

  ---project
  p={name='+project',
    p={':source /tmp/session.vim\r','reload-last-session',silent=false},
    [' ']={':exe "edit" v:oldfiles[0]\r','reload-last-file'},
    w={':wshada\r','write shada'},
    r={':rshada!\r','read shada!'},
    s={require'small.layout'.save,'layout-save'},
    l={require'small.layout'.load,'layout-load'},
  },
},['<C-w>']=format{
    _=vim.tbl_extend('error',fmap(':%swincmd w\r','window %s'),
      cmap({['<C-h>']='left',['<C-j>']='down',['<C-k>']='up',['<C-l>']='right'},':WinShift %s\r','move %s')
    ),
    S={function()
      local win=require'small.winpick'.pick()
      if not win then return end
      local curbuf=vim.api.nvim_win_get_buf(0)
      local twin=vim.api.nvim_open_win(curbuf,false,{hide=true,width=1,height=1,relative='cursor',col=1,row=1})
      vim.api.nvim_win_set_buf(0,vim.api.nvim_win_get_buf(win))
      vim.api.nvim_win_set_buf(win,curbuf)
      vim.api.nvim_win_close(twin,true)
    end,'swap'},
    [' ']={function()
      local win=require'small.winpick'.pick()
      if win then vim.api.nvim_set_current_win(win) end
    end,'hop'},
  }}
