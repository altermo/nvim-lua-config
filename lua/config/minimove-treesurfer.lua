local sts=require'syntax-tree-surfer'
local k=require'utils.keymap'
k.nno('vx','<cmd>STSSelectMasterNode\r')
k.nno('vn','<cmd>STSSelectCurrentNode\r')
local move=require'mini.move'
k.nno('<A-k>',function() move.move_line('up') end)
k.nno('<A-j>',function() move.move_line('down') end)
k.xno('<A-k>',":move '<-2\rgv")
k.xno('<A-j>',":move '>+1\rgv")
k.xbmap('<C-j>','<cmd>STSSelectNextSiblingNode\r','<cmd>lua require("mini.move").move_selection("down")\r')
k.xbmap('<C-k>','<cmd>STSSelectPrevSiblingNode\r','<cmd>lua require("mini.move").move_selection("up")\r')
k.xbmap('<C-h>','<cmd>STSSelectParentNode\r','<cmd>lua require("mini.move").move_selection("left")\r')
k.xbmap('<C-l>','<cmd>STSSelectChildNode\r','<cmd>lua require("mini.move").move_selection("right")\r')
k.xbmap('<C-S-k>','<cmd>STSSwapPrevVisual\r','')
k.xbmap('<C-S-j>','<cmd>STSSwapNextVisual\r','')
k.xbmap('<C-S-h>','<cmd>STSSwapPrevVisual\r','')
k.xbmap('<C-S-l>','<cmd>STSSwapNextVisual\r','')
k.nno('gF',function() sts.targeted_jump({'function','if_statement','else_clause','else_statement',
    'elseif_statement','for_statement','while_statement','switch_statement',}) end)
k.nno('gX','<cmd>STSSwapOrHold\r')
k.xno('gX','<cmd>STSSwapOrHoldVisual\r')
