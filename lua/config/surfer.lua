require'syntax-tree-surfer'
local k=require'utils.keymap'
k.nno('vn','<cmd>STSSelectCurrentNode\r')
k.xno('<C-j>','<cmd>STSSelectNextSiblingNode\r')
k.xno('<C-k>','<cmd>STSSelectPrevSiblingNode\r')
k.xno('<C-h>','<cmd>STSSelectParentNode\r')
k.xno('<C-l>','<cmd>STSSelectChildNode\r')
