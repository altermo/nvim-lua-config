--vim.opt.runtimepath:prepend('/home/user/.config/nvim/.other/ua') --For testing
local upair=require'ultimate-autopair'
upair.setup({
  backspace={space='balance',indent_ignore=true,single_delete=true},
  fastwarp={
    multi=true,
    {},
    {
      faster=true,
      map='<C-A-e>',
      cmap='<C-A-e>',
      rmap='<C-A-S-e>',
      rcmap='<C-A-S-e>',
    },
  },
  filter={function() return vim.fn.reg_recording()=='' and vim.fn.reg_executing()=='' end},
})

