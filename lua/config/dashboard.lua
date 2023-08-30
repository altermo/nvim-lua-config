local db=require'dashboard'
db.setup{
  theme='doom',
  config={
    center={
      {icon=' ',desc='Recently opened files',key='SPC s o',action='Telescope oldfiles'},
      {icon=' ',desc='File browser'         ,key='SPC s w',action='Telescope file_browser file_browser'},
      {icon=' ',desc='Open project'         ,key='SPC s p',action='Telescope project project'},
      {icon=' ',desc='Change colorscheme'   ,key='SPC s c',action='Telescope colorscheme'},
      {icon=' ',desc='Documentation'        ,key='SPC s h',action='Telescope help_tags'},
      {icon='󰁯 ',desc='Reload last session'  ,key='SPC c r',action='source /tmp/session.vim'},
    }
  },
  hide={
    statusline=false,
    tabline=false,
  }
}
