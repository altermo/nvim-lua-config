vim.opt.runtimepath:prepend('/home/user/.config/nvim/.other/small.nvim') --For testing
require'small.small_loader'.run{
    'bufend','dff','colors','macro','format','help_cword','qvim2',
    'treeselect','notify','unimpaired','color_cmdline','plugin_search',
    'highlight_selected','nterm','copyring','exchange','whint','typo',
    {'reminder',conf={path='/home/user/.gtd/vault/gtd/plans.md'}},
    {'fastmultif',conf={labels='1234567890äḧẅëẗÿüïöẍÄḦẄËŸÜÏÖẌâŝĝĥĵŵêŷûîôẑĉÂŜĜĤĴŴÊŶÛÎÔẐĈ'}},
    {'kitty',conf={padding=20,no_sync_bg=true,strict=true}},
}
