require'small.small_loader'.run{
    'dff','help_cword','exchange',
    'treeselect','notify','whint','typo',
    'highlight_selected','nterm','copyring',
    {'reminder2',conf={path='/home/user/.gtd/gtd/plans.md'}},
    {'fastmultif',conf={labels='1234567890äḧẅëẗÿüïöẍÄḦẄËŸÜÏÖẌâŝĝĥĵŵêŷûîôẑĉÂŜĜĤĴŴÊŶÛÎÔẐĈ'}},
    {'node_eval',conf={handle=function (res) _G.lualine_val=res vim.schedule(function() require'lualine'.refresh({})
        end) end,handle_pre=function () _G.lualine_val=nil end,bin='fend',node='inline_formula'}},
}
