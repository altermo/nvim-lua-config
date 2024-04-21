vim.opt.runtimepath:prepend('/home/user/.config/nvim/.other/ua') --For testing
local upair=require'ultimate-autopair'
_G.UA_DEV=true
local configs={upair.extend_default{
  --space2={enable=true},
  bs={space='balance',indent_ignore=true,single_delete=true,map={'<C-w>','<bs>'}},
  cr={autoclose=true},
  fastwarp={
    multi=true,
    {},
    {
      faster=true,
      map='<C-A-e>',
      cmap='<C-A-e>',
      rmap='<C-A-S-e>',
      rcmap='<C-A-S-e>',
    },
  },
  tabout={enable=true,hopout=true},
  extensions={
    --utf8=false,
    cond={cond={function(fn) return not fn.in_macro() end}}
  },
  {'*','*',multiline=false,ft={'markdown'}},
  {'**','**',multiline=false,ft={'markdown'}},
  {'$','$',multiline=false,ft={'markdown'}},
  config_internal_pairs={{'[',']',cond=function (_,o) return o.line:sub(o.col-4,o.col)~='\\x1b' end}},
},
  {profile=require'ultimate-autopair.experimental.terminal'.init,{'{','}'}},
  {profile=require'ultimate-autopair.experimental.matchpair'.init},
}
require'ultimate-autopair.core'.modes={'i','c','n','t'}
upair.init(configs)
