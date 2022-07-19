local npairs=require'nvim-autopairs'
npairs.setup{map_cr=false,fast_wrap={chars={'{','[','(','"',"'",'`'}}}
local rule=require('nvim-autopairs.rule')
npairs.add_rule(rule("'''","'''","python"))
local cond=require('nvim-autopairs.conds')
npairs.add_rule(rule('=','=','lua'):with_pair(cond.before_regex('[[]=*$',-1)))
npairs.add_rule(rule('/*','*/',{'c','cpp','java','javascript','rust','php','haskell','go'}))
