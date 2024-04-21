vim.opt.runtimepath:prepend('/home/user/.config/nvim/.other/small.nvim') --For testing
require'small.small_loader'.run{
    'bufend','winpick','matchall','tableformat','specfile','color_cmdline','whint','exchange',
    'labull','dff','notify','builder','colors','textobj','unimpaired','copyring','help_cword',
    'highlight_selected','nterm','treeselect','macro','plugin_search','format','layout','typo',
    {'foldtext',conf={treesitter=true,skip_fn_luadoc=true}},
    {'treewarn',conf={lua={'((binary_expression (unary_expression "not") "==") @warn (#set! "mes" "`not a==b` => `a~=b`"))'}}},
    {'reminder',conf={path='/home/user/.gtd/vault/gtd/plans.md'}},
    {'recenter_top_bottom',keys=function (m,fn) fn.map('n','<C-z>',m.run) end},
    {'fastmultif',conf={labels='1234567890äḧẅëẗÿüïöẍÄḦẄËẗŸÜÏÖẌâŝĝĥĵŵêŷûîôẑĉÂŜĜĤĴŴÊŶÛÎÔẐĈ'}},
    {'kitty',conf={padding=20,no_sync_bg=true,strict=true}},
}
