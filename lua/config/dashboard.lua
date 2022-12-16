local db=require'dashboard'
db.custom_center={
  {icon=' ',desc='Recently opened files ',shortcut='SPC s o',action='Telescope oldfiles'},
  {icon=' ',desc='New file              ',shortcut='SPC n  ',action='enew'},
  {icon=' ',desc='Find word             ',shortcut='SPC s s',action='Telescope live_grep'},
  {icon=' ',desc='Find file             ',shortcut='SPC s f',action='Telescope find_files'},
  {icon=' ',desc='Change colorscheme    ',shortcut='SPC s r',action='ReachOpen colorschemes'},
}
db.hide_statusline=false
db.hide_tabline=false
