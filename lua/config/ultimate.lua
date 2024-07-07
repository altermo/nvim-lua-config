vim.opt.runtimepath:prepend('/home/user/.config/nvim/.other/ua_') --For testing
local upair=require'ultimate-autopair'
_G.UA_DEV=true
upair.setup({
  --space2={enable=true},
  backspace={--[[space='balance',indent_ignore=true,single_delete=true]]},
  newline={--[[autoclose=true]]},
  fastwarp={
    --multi=true,
    --{},
    --{
    --  faster=true,
    --  map='<C-A-e>',
    --  cmap='<C-A-e>',
    --  rmap='<C-A-S-e>',
    --  rcmap='<C-A-S-e>',
    --},
  },
  --tabout={enable=true,hopout=true},
  filter={
    function()
      return vim.fn.reg_recording()=='' and vim.fn.reg_executing()==''
    end,
  },
  {'*','*',multiline=false,ft={'markdown'}},
  {'**','**',multiline=false,ft={'markdown'}},
  {'$','$',multiline=false,ft={'markdown'}},
  --change={{'[',']',filter={function (_,o) return o.line:sub(o.col-4,o.col)~='\\x1b' end}}},
})

