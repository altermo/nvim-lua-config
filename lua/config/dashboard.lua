local db=require'dashboard'
db.setup{
  theme='doom',
  config={
    center={
      {icon=' ',desc='Recently opened files',key='SPC s o',action='Telescope oldfiles'},
      {icon=' ',desc='New file'             ,key='SPC n'  ,action='enew'},
      {icon=' ',desc='Find word'            ,key='SPC s s',action='Telescope live_grep'},
      {icon=' ',desc='Find file'            ,key='SPC s f',action='Telescope find_files'},
      {icon=' ',desc='Change colorscheme'   ,key='SPC s r',action='ReachOpen colorschemes'},
    }
  },
  hide={
    statusline=false,
    tabline=false,
  }
}
