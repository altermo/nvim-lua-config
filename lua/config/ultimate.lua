local upair=require'ultimate-autopair'
_G.UA_DEV=true
local linecount
local configs={upair.extend_default{
    space2={enable=true},
    bs={
        space='balance',
        indent_ignore=true,
        single_delete=true,
    },
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
    tabout={
        enable=true,
        hopout=true,
    },
    extensions={
        fly={nofilter=true},
        cond={cond=function(fn) return not fn.in_node({'comment'}) end},
    },
    config_internal_pairs={
        {'"','"',fly=true,bs_overjumps=true,multiline=true},
        {"'","'",fly=true},
        {'{','}',suround=true},
    },
    {'<<','>>',suround=true,fastwarp=true,space=true,disable_end=true},
    {'<>','<>',bs_overjumps=true,fastwarp=true,space=true},
    {'\\(','\\)'},
    { "`", "'", fly = true, ft = { "tex", "latex" }},
    {'&','?',disable_start=true,disable_end=true,newline=true},
},
    {profile=require'ultimate-autopair.experimental.terminal'.init},
    {profile=require'ultimate-autopair.experimental.matchpair'.init},
    {profile=require'ultimate-autopair.experimental.addons_.comma_after_table'.init},
    {profile=require'ultimate-autopair.experimental.addons_.fix_ts_endwise'.init}
}
require'ultimate-autopair.core'.modes={'i','c','n','t'}
if not upair._check_depreciated(configs[1]) then
    upair.init(configs)
end
