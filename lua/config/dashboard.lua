local db=require'dashboard'
db.custom_center={
  {icon='⏲ ',desc='Recently opened files ',shortcut='SPC f h',action='Telescope oldfiles'},
  {icon=' ',desc='New file              ',shortcut='SPC r n',action='enew'},
  {icon=' ',desc='Find word             ',shortcut='SPC f s',action='Telescope live_grep'},
  {icon=' ',desc='Find file             ',shortcut='SPC f f',action='Telescope find_files'},
  {icon='🌢 ',desc='Change colorscheme    ',shortcut='SPC f c',action='Telescope colorscheme'},
}
db.hide_statusline=false
db.hide_tabline=false
