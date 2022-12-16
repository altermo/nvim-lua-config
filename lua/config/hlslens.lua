require('hlslens').setup()
local nno=require'utils.keymap'.nno
for _,v in pairs({'n','N','*','#','g*','g#'}) do
    nno(v,v..'<Cmd>lua require("hlslens").start()\r')
end
