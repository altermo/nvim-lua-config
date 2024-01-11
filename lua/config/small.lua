vim.opt.runtimepath:prepend('/home/user/.config/nvim/.other/small.nvim') --For testing
local setup=function (m) return m.setup() end
local conf=function (conf,s) return function(m) m.conf=conf if s then s(m) end end end
local key=require'utils.keymap'
for k,v in pairs{
    highlight_selected=setup,
    matchall=setup,
    typos=setup,
    labull=setup,
    specfile=setup,
    foldtext=conf({treesitter=true},setup),
    treewarn=conf({lua={'((binary_expression (unary_expression "not") "==") @warn (#set! "mes" "`not a==b` => `a~=b`"))',
        '((for_generic_clause (expression_list ((identifier) @warn (#set! "mes" "`foo` => `pairs(foo)`")))))'}},setup),
    nterm=function (m) vim.api.nvim_create_user_command('Shell',function (opts) m.run('fish '..opts.args,true) end,{nargs='*'}) end,
    exchange=function (m)
        key.nno('cx',m.ex_oper)
        key.nno('cX',m.ex_eol)
        key.nno('cxx',m.ex_line)
        key.nno('cxc',m.ex_cancel)
        key.xno('X',m.ex_visual)
    end,
    builder=function (m)
        key.nno("“",m.termbuild)
        key.nno("<F6>",m.eval)
    end,
    macro=function (m)
        key.nno('q',m.toggle_rec)
        key.nno('Q',m.play_rec)
        key.xno('Q',m.play_rec)
        key.nno('cq',m.edit_rec)
    end,
    onelinecomment=function (m)
        key.xno('gc',m.run)
        key.nno('gc',m.run)
    end,
    reminder=conf({path='/home/user/.gtd/vault/gtd/plans.md'},setup),
    textobj=function (m)
        key.xno('im',m.wordcolumn,{expr=true})
        key.ono('im',m.charcolumn,{expr=true})
        key.xno('ik',m.wordrow,{expr=true})
        key.ono('ik',m.charrow,{expr=true})
    end,
    unimpaired=function (m) key.nno('yo',m.set_opt) end,
    whint=function (m) key.ino(':',m.run,{expr=true}) end,
    ranger=conf{exit_if_single=true},
    help_cword=function (m) key.nno('gh',m.run) end,
    ['emacs_features.recenter_top_bottom']=function(fn) key.nno('<C-z>',fn) end,
    ['emacs_features.iedit']=function (m)
        vim.keymap.set('x','gi',m.visual)
        vim.keymap.set('n','gC',m.clear)
    end,
    notify=function (m) m.overide_notify() end,
    cursor=function (m)
        key.nno('m',function() m.create_cursor() end)
        key.nno("'",function() m.goto_next_cursor(true) end)
        key.nno("<C-'>",function() m.goto_next_cursor() end)
        conf({show_cursors=true},setup)(m)
    end,
} do v(require('small.'..k)) end
