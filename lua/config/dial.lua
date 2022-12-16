local k=require'utils.keymap'
local dialmap=require'dial.map'
k.nno('<C-a>',dialmap.inc_normal())
k.nno('<C-x>',dialmap.dec_normal())
k.xno('<C-a>',dialmap.inc_visual())
k.xno('<C-x>',dialmap.dec_visual())
