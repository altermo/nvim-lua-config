local sts=require'syntax-tree-surfer'
local k=require'utils.keymap'
k.nno('vx','<cmd>STSSelectMasterNode\r')
k.nno('vn','<cmd>STSSelectCurrentNode\r')
k.xbmap('<C-j>','<cmd>STSSelectNextSiblingNode\r','<Plug>GoVSMDown')
k.xbmap('<C-k>','<cmd>STSSelectPrevSiblingNode\r','<Plug>GoVSMUp')
k.xbmap('<C-h>','<cmd>STSSelectParentNode\r','<Plug>GoVSMLeft')
k.xbmap('<C-l>','<cmd>STSSelectChildNode\r','<Plug>GoVSMRight')
k.xbmap('<C-S-k>','<cmd>STSSwapPrevVisual\r','<Plug>GoVSDDown')
k.xbmap('<C-S-j>','<cmd>STSSwapNextVisual\r','<Plug>GoVSDUp')
k.xbmap('<C-S-h>','<cmd>STSSwapPrevVisual\r','<Plug>GoVSDLeft')
k.xbmap('<C-S-l>','<cmd>STSSwapNextVisual\r','<Plug>GoVSDRight')
k.xno('<A-k>','<Plug>GoVMLineUp')
k.xno('<A-j>','<Plug>GoVMLineDown')
k.nno('<A-k>','<Plug>GoNMLineUp')
k.nno('<A-j>','<Plug>GoNMLineDown')
k.nno('gF',function() sts.targeted_jump({'function','if_statement','else_clause','else_statement',
    'elseif_statement','for_statement','while_statement','switch_statement',}) end)
