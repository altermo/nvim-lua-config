----init
local function fmap(num,cmd,name,null)
  local tbl={[null and 'à' or 'ß']=name:gsub('%%s',null and '0..9' or '1..9')}
  for i=null and 0 or 1,num do
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
local spell={s='es',e='en',v='sv',n='nb'}
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
      windows=false,
      nav=false,
      z=false,
      g=false,
    }}}
require'which-key'.register{[' ']=format{

  ----main
  b={require'small.bufend'.run,'bufend'},
  L={':Luapad\r','luapad'},
  C={require'small.chat'.run,'chat'},
  ['.']={'@:','run-prev-cmd'},
  r={require'small.ranger'.run,'ranger'},
  ["'"]={':Shell\r','shell'},
  t={require'small.unimpaired'.set_opt,'toggle opt'},
  i={':edit .\r','edir'},
  ------lazy
  P={name='+lazy',_=cmap({p='lazy',i='install',c='clean',u='update'},':Lazy %s\r','%s')},
  ------fold
  z={'zMzv','close-all-folds-but-cursor'},
  Z={':e\r','reload-file'},
  ------window/buffer
  q={':q\r','quit'},
  Q={':q!\r','QUIT!'},
  x={':qall\r','quitall'},
  v={require'small.splitbuf'.vsplit,'vsplitbuf'},
  e={require'small.splitbuf'.split,'hsplitbuf'},
  d={':bdelete\r','buffer-delete'},
  u={':lua vim.api.nvim_set_current_buf(vim.api.nvim_create_buf(true,true))\r','scratch'},

  ---cmd/app
  c={name='+cmd/app',
    t={':InspectTree\r','TSPlayground'},
    u={':lua require("undotree").toggle()\r','undotree'},
    n={':lua require"small.notify".dismiss()\r','dismiss notify'},
    N={':lua require"small.notify".open_history()\r','open notify history'},
    c={':let &scrolloff=(&scrolloff==1000?5:1000)\r','centermouse'},
    e={':silent !emacsclient %&\r','send-emacs'},
    w={':vsplit|call execute("terminal curl \'wttr.in/?nQF\' -s")|startinsert\r','weather'},
    m={':MarkdownPreview\r','markdown-preview'},
    l={':edit /tmp/nlog\r','open-log'},
    g={':DiffviewOpen\r','git-diff'},
    d={require'small.dff'.file_expl,'dff'},
    a={require'small.tableformat'.run,'format table'},
    r={require'small.reminder'.sidebar,'reminder sidebar'},
  },

  ---fold/indent
  o={name='+fold/indent',
    ------foldmethod
    f={name='+foldmethod',
      d={':set foldmethod=diff\r','diff'},
      t={':set foldmethod=expr\r:set foldexpr=v:lua.vim.treesitter.foldexpr()\r','treesitter'},
      f={':set foldmethod=expr\r:set foldexpr=v:lua.Fold(v:lnum)\r','default'},
    },
    ------foldlevel
    l={name='+foldlevel',_=fmap(9,':set foldlevel=%s\r','set foldlevel=%s',true)},
    ------indent
    i={name='+indent',_=fmap(9,':set ts=%s\r','set indent=%s')},
  },

  ---tabs
  ['<tab>']={name='+tab',
    n={':tabnext\r','next'},
    p={':tabprev\r','prev'},
    d={':tabclose\r','delete'},
    [' ']={':tabnext\r','next'},
    ['<']={':-tabmove\r','move-prev'},
    ['>']={':+tabmove\r','move-next'},
    ['<tab>']={':tab split\r','new'},
    _=fmap(9,':tabnext %s\r','tab-%s'),
    ['0']={':tablast\r','tab-last'},
    m={name='+move-buffer',
      _=fmap(9,':lua require"utils.lib".tabbufmove(%s)\r','tab-%s'),
      ['0']={function() require'utils.lib'.tabbufmove'$' end,'last'},
      ['<']={function() require'utils.lib'.tabbufmove'-' end,'prev'},
      ['>']={function() require'utils.lib'.tabbufmove'+' end,'next'},
    },
  },

  ---files
  f={name='+files',
    W={function ()
      local tmp=vim.fn.tempname()
      vim.fn.writefile(vim.fn.getline(1,vim.fn.line('$')),tmp)
      vim.cmd.vnew()
      local buf=vim.fn.bufnr()
      vim.fn.termopen('cat '..tmp..'|sudo tee '..vim.fn.expand('#:p'),{
        on_exit=function (_,code,_)
          vim.cmd.bdelete({buf,bang=true})
          if code==0 then vim.o.modified=false end
        end
      })
      vim.cmd.startinsert()
    end,'sudosave'},
    r={':Rename\r','rename',silent=false},
    c={':!echo "%:p"|xsel -ib\r','copy-path',silent=false},
    f={':Telescope find_files\r','find'},
    t={name='+set-type',
      o={':setf ','other',silent=false},
      _=cmap({p='python',t='txt',v='vim',f='fish',r='rust',l='lua',m='markdown',c='c',h='html',n='norg'},':set filetype=%s\r','%s')
    },
  },

  ----search
  s={name='+search',
    a={':Telescope\r','telescope'},
    c={':Telescope colorscheme enable_preview=true\r','colorscheme'},
    F={require'small.foldselect'.run,'fold'},
    P={require'small.plugin_search'.run,'plugins-online'},
    _=cmap({f='find_files',o='oldfiles',s='live_grep',h='help_tags',b='marks',[' ']='resume'},':Telescope %s theme=ivy\r','%s'),
    y={':Telescope yank_history yank_history\r','yank'},
    g={name='+git',
      _=cmap({s='git_status',c='git_commits',b='git_branches'},':Telescope %s theme=ivy\r','%s'),
    },
    r={name='+replace',
      p={require'small.lbpr'.run,'lbpr'},
      --r={':Spectre\r','spectre'}, --TODO: replacement
    }
  },

  ----text
  y={name='+text',
    s={name='+spell',
      _=cmap(spell,':set spelllang=%s\r','lang=%s',{silent=false})
    },
    g={name='+grammar',
      w={':WordyToggle weak\r','wordy toggle'},
      d={':ToggleDitto\r','ditto'},
    },
  },

  ----theme
  T={name='+theme',
    h={':ColorizerToggle\r','toggle-color-name-highlight'},
    z={function () require'small.kitty'.toggle_padding(20) end,'toggle-padding'},
    C={function ()
      vim.cmd.hi('Cursor blend=100')
      vim.o.guicursor='a:Cursor/lCursor,a:ver1'
    end,'hide-cursor'},
    c={':set guicursor&\r','reset-cursor'},
    f={':set guifont=*\r','select-font'},
    m={':ToggleMatchAll\r','toggle matchall'},
  },

  ----lsp
  l={name='+lsp',
    h={':lua vim.lsp.buf.hover()\r','hover'},
    f={':lua vim.lsp.buf.format()\r','format'},
    c={':lua vim.lsp.buf.code_action()\r','code-action'},
    I={':lua vim.lsp.inlay_hint.enable(0,not vim.lsp.inlay_hint.is_enabled())\r','toggle-inlay-hint'},
    i={':LspInfo\r','info'},
    s={':LspStop\r','stop'},
    S={':LspStart\r','start'},
    r={':Telescope lsp_references\r','search-references'},
    R={':IncRename <C-r>=expand("<cword>")\r','replace',silent=false},
  },

  ---window
  w={name='+window',
    o={':only\r','only-window'},
    v={':vsplit\r','vsplit'},
    e={':split\r','split'},
    d={':close\r','delete'},
    w={':wincmd w\r','next'},
    ['<tab>']={':wincmd w\r','next'},
    _=(function ()
      local ret=fmap(9,':%swincmd w\r','window %s')
      for k,v in pairs{
        h={'<','decrease width','left'},
        j={'+','increase height','down'},
        k={'-','decrease height','up'},
        l={'>','increase width','right'},
      } do
        ret[k]={':wincmd '..k..'\r',v[3]}
        ret['<S-'..k..'>']={':5wincmd '..v[1]..'\r',v[2]}
        ret['<C-S-'..k..'>']={':wincmd '..v[1]..'\r','small '..v[2]}
        ret['<C-'..k..'>']={':WinShift '..v[3]..'\r','move '..v[3]}
      end
      return ret
    end)(),
    s={function()
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
}}
