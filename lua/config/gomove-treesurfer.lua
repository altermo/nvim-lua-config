local sts=require'syntax-tree-surfer'
local k=require'utils.keymap'
k.nno('vx','<cmd>STSSelectMasterNode\r')
k.nno('vn','<cmd>STSSelectCurrentNode\r')
k.xbmap('<C-j>','<cmd>STSSelectNextSiblingNode\r','<Plug>GoVSMDown')
k.xbmap('<C-k>','<cmd>STSSelectPrevSiblingNode\r','<Plug>GoVSMUp')
k.xbmap('<C-h>','<cmd>STSSelectParentNode\r','<Plug>GoVSMLeft')
k.xbmap('<C-l>','<cmd>STSSelectChildNode\r','<Plug>GoVSMRight')
k.xbmap('<C-S-j>','<cmd>STSSwapNextVisual\r','<Plug>GoVSDDown')
k.xbmap('<C-S-k>','<cmd>STSSwapPrevVisual\r','<Plug>GoVSDUp')
k.xbmap('<C-S-h>',':m 0\rgv','<Plug>GoVSDLeft')
k.xbmap('<C-S-l>',':m $\rgv','<Plug>GoVSDRight')
k.xno('<A-k>','<Plug>GoVMLineUp')
k.xno('<A-j>','<Plug>GoVMLineDown')
k.nno('<A-k>','<Plug>GoNMLineUp')
k.nno('<A-j>','<Plug>GoNMLineDown')
k.xno('<A-S-k>','<Plug>GoVDLineUp')
--k.xno('<A-S-j>','<Plug>GoVDLineDown')
--k.nno('<A-S-k>','<Plug>GoNDLineUp')
k.nno('<C-S-o>',':lua require("syntax-tree-surfer").go_to_top_node_and_execute_commands(false,{"normal!O","normal!O","startinsert"})\r')
k.nno('gFf',function() sts.targeted_jump({'function','arrrow_function','function_definition'}) end)
k.nno('gFi',function() sts.targeted_jump({'if_statement','else_clause','else_statement','elseif_statement'}) end)
k.nno('gFo',function() sts.targeted_jump({'for_statement','while_statement','switch_statement'}) end)
k.nno('gFv',function() sts.targeted_jump({'variable_declaration'}) end)
k.nno('gFs',function() sts.targeted_jump({'string'}) end)
k.nno('gFn',function() sts.targeted_jump({'ineger'}) end)
k.nno('gFa',function() sts.targeted_jump({'function','if_statement','else_clause','else_statement',
    'elseif_statement','for_statement','while_statement','switch_statement',}) end)
k.nno('<A-o>',function() sts.filtered_jump('default',true) end)
k.nno('<A-i>',function() sts.filtered_jump('default',false) end)
