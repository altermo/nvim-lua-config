vim.opt.runtimepath:prepend('/home/user/.config/nvim/.other/ua')
local upair=require'ultimate-autopair'
_G.UA_DEV=true
local configs={upair.extend_default{
    space2={enable=true},
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
    extensions={cond={cond=function(fn) return not fn.in_macro() end}},
    {'<<','>>',newline=true,suround=true},
    {'*','*',multiline=false,ft={'markdown'}},
    {'**','**',multiline=false,ft={'markdown'}},
    {'$','$',multiline=false,ft={'markdown'}},
},
    {profile=require'ultimate-autopair.experimental.terminal'.init,{'{','}'}},
    {profile=require'ultimate-autopair.experimental.matchpair'.init},
    {profile=require'ultimate-autopair.experimental.addons_.comma_after_table'.init},
    {profile=require'ultimate-autopair.experimental.addons_.fix_ts_endwise'.init}
}
require'ultimate-autopair.core'.modes={'i','c','n','t'}
if not upair._check_depreciated(configs[1]) then
    upair.init(configs)
end
