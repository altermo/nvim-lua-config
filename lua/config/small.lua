vim.opt.runtimepath:prepend('/home/user/.config/nvim/.other/small.nvim') --For testing
require'small.small_loader'.run{
    'highlight_selected','matchall','typo','labull','specfile','color_cmdline',
    'copyring', 'exchange','notify','builder','macro','textobj',
    'unimpaired','whint', 'help_cword',
    {'foldtext',conf={treesitter=true,skip_fn_luadoc=true}},
    {'treewarn',conf={lua={'((binary_expression (unary_expression "not") "==") @warn (#set! "mes" "`not a==b` => `a~=b`"))',
        '((for_generic_clause (expression_list ((identifier) @warn (#set! "mes" "`foo` => `pairs(foo)`")))))'}}},
    {'reminder',conf={path='/home/user/.gtd/vault/gtd/plans.md'}},
    {'recenter_top_bottom',keys=function (m,fn)
        fn.map('n','<C-z>',m.run)
    end},
    {'cursor',keys=function (m,fn)
        fn.map('n','m',function () m.create_cursor() end)
        fn.map('n',"'",function () m.goto_next_cursor(true) end)
        fn.map('n',"<C-'>",function () m.goto_next_cursor() end)
    end},
    {'fastmultif',conf={labels='1234567890äḧẅëẗÿüïöẍÄḦẄËẗŸÜÏÖẌâŝĝĥĵŵêŷûîôẑĉÂŜĜĤĴŴÊŶÛÎÔẐĈ'}},
    {'kitty',conf={padding=20,no_sync_bg=true}},
}
