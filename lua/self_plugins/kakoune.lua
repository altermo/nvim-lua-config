local function map(kind,key,maps,opts)
  vim.keymap.set(kind,key,maps,opts)
end
local function vno(key,maps)
  map('v',key,maps,{noremap=true,silent=true})
end
--local function lvno(key,maps)
  --map('v',key,maps,{noremap=true})
--end
for i in ('hjkl'):gmatch('.') do
    vno(i,'<esc>'..i..'v')
end
for i in ('wbe'):gmatch('.') do
    vno(i,'<esc>v'..i)
end
vno('x','<esc>0v$')
vno('%','<esc>0ggvG$')
