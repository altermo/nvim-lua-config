vim.opt.runtimepath:prepend('/home/user/.config/nvim/.other/small.nvim') --For testing
require'small.small_loader'.run{
    'bufend','treeselect','unimpaired','color_cmdline','format','help_cword','qvim2',
    'labull','dff','notify','builder','colors','matchall','specfile','copyring','exchange',
    'highlight_selected','nterm','textobj','macro','plugin_search','whint','layout','typo',
    {'foldtext',conf={treesitter=true,skip_fn_luadoc=true}},
    {'treewarn',conf={lua={'((binary_expression (unary_expression "not") "==") @warn (#set! "mes" "`not a==b` => `a~=b`"))'}}},
    {'reminder',conf={path='/home/user/.gtd/vault/gtd/plans.md'}},
    {'recenter_top_bottom',keys=function (m,fn) fn.map('n','<C-z>',m.run) end},
    {'fastmultif',conf={labels='1234567890äḧẅëẗÿüïöẍÄḦẄËẗŸÜÏÖẌâŝĝĥĵŵêŷûîôẑĉÂŜĜĤĴŴÊŶÛÎÔẐĈ'}},
    {'kitty',conf={padding=20,no_sync_bg=true,strict=true}},
}
