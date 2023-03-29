local db=require'dashboard'
db.setup{
  theme='doom',
  config={
    center={
      {icon=' ',desc='Recently opened files',key='SPC s o',action='Telescope oldfiles'},
      {icon=' ',desc='New file'             ,key='SPC n'  ,action='enew'},
      {icon=' ',desc='Find file'            ,key='SPC s f',action='Telescope find_files'},
      {icon=' ',desc='Open project'         ,key='SPC s p',action='Telescope project project'},
      {icon=' ',desc='Change colorscheme'   ,key='SPC s c',action='Telescope colorscheme'},
      {icon=' ',desc='Documentation'        ,key='SPC s h',action='Telescope help_tags'},
    }
  },
  hide={
    statusline=false,
    tabline=false,
  }
}
