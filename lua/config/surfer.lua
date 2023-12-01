require'syntax-tree-surfer'
local k=require'utils.keymap'
k.nno('vn','<cmd>STSSelectCurrentNode\r')
k.xbmap('<C-j>','<cmd>STSSelectNextSiblingNode\r','<cmd>lua require("mini.move").move_selection("down")\r')
k.xbmap('<C-k>','<cmd>STSSelectPrevSiblingNode\r','<cmd>lua require("mini.move").move_selection("up")\r')
k.xbmap('<C-h>','<cmd>STSSelectParentNode\r','<cmd>lua require("mini.move").move_selection("left")\r')
k.xbmap('<C-l>','<cmd>STSSelectChildNode\r','<cmd>lua require("mini.move").move_selection("right")\r')
