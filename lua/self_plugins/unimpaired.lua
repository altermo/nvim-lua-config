local fn=vim.fn
local function map(kind,key,maps,opts)
  vim.keymap.set(kind,key,maps,opts)
end
local function nno(key,maps)
  map('n',key,maps,{noremap=true,silent=true})
end
local function toggle(opt,on,off) --TODO : remake in lua
    if off then
        vim.cmd('let &'..opt..'=(&'..opt..'=="'..on..'"?"'..off..'":"'..on..'")')
    elseif on then
        vim.cmd('let &'..opt..'=(&'..opt..'==""?"'..on..'":"")')
    else
        vim.cmd('set '..opt..'!')
    end
    vim.cmd('|echo "'..opt..'=" &'..opt)
end
local function seton(opt,on)
    if on then
        vim.cmd('set '..opt..'='..on)
    else
        vim.cmd('set '..opt)
    end
    vim.cmd('|echo "'..opt..'=" &'..opt)
end
local function setoff(opt,off)
    if off then
        vim.cmd('set '..opt..'='..off)
    else
        vim.cmd('set no'..opt)
    end
    vim.cmd('|echo "'..opt..'=" &'..opt)
end

local function listdir(path)
    return fn.readdir(path)
end
local function join(path1,path2)
    return path1..'/'..path2
end
local function parent(path)
    if path=='/' then error('cant get parrent dir of /') end
    return fn.fnamemodify(path,':h')
end
local function base(path)
    return fn.fnamemodify(path,':t')
end
local function islast(path)
    local parlist=listdir(parent(path))
    return parlist[#parlist]==base(path)
end
local function isempty(path)
    return not next(fn.readdir(path))
end
local function isfirst(path)
    return listdir(parent(path))[1]==base(path)
end
local function getnext(path)
    if fn.isdirectory(path)==1 and not isempty(path) then
        return join(path,listdir(path)[1])
    end
    while islast(path) do
        path=parent(path)
    end
    local par=parent(path)
    local parlist=listdir(par)
    return join(par,parlist[fn.index(parlist,base(path))+2])
end
local function getprev(path)
    if fn.isdirectory(path)==1 and not isempty(path) then
        return join(path,listdir(path)[#listdir(path)])
    end
    while isfirst(path) do
        path=parent(path)
    end
    local par=parent(path)
    local parlist=listdir(par)
    return join(par,parlist[fn.index(parlist,base(path))])
end
local function get_next_file(path)
    path=fn.fnamemodify(path,':p')
    path=getnext(path)
    while fn.isdirectory(path)==1 do
        path=getnext(path)
    end
    return path
end
local function get_prev_file(path)
    path=fn.fnamemodify(path,':p')
    path=getprev(path)
    while fn.isdirectory(path)==1 do
        path=getprev(path)
    end
    return path
end
nno(']f',function() vim.cmd('edit '..get_next_file(fn.expand('%',nil,nil))) end)
nno('[f',function() vim.cmd('edit '..get_prev_file(fn.expand('%',nil,nil))) end)

for k,v in pairs({a='',b='b',l='l',q='c',t='t',['<C-t>']='pt'}) do
    nno(']'..k,':'..v..'next\r')
    nno('['..k,':'..v..'previous\r')
end
for k,v in pairs({A='',B='b',L='l',Q='c',T='t'}) do
    nno(']'..k,':'..v..'last\r')
    nno('['..k,':'..v..'first\r')
end

nno(']<C-q>',':cpfile\r')
nno('[<C-q>',':cnfile\r')
nno(']n',':  call search(\'^\\(@@ .* @@\\|[<=>|]\\{7}[<=>|]\\@!\\)\',"W")\r')
nno('[n',':  call search(\'^\\(@@ .* @@\\|[<=>|]\\{7}[<=>|]\\@!\\)\',"Wb")\r')
nno('[ ','O<esc>j')
nno('] ','o<esc>k')
nno('>p','p>>')
nno('<p','p<<')
nno('=p','p==')
nno('>P','P>>')
nno('<P','P<<')
nno('=P','P==')

for k,v in pairs({
    b={opt='background',on='light',off='dark'},
    c='cursorline',h='hlsearch',l='list',
    i='ignorecase',n='number',r='relativenumber',
    s='spell',u='cursorcolumn',w='wrap',d='diff',
    t={opt='colorcolumn',on='1,41,81,121,161,201,241'}, --TODO
    v={opt='virtualedit',on='block,onemore'}, --TODO
    m={opt='mouse',on='a'},f='foldenable',
}) do
    if type(v)~='table' then v={opt=v} end
    nno('[o'..k,function () seton(v.opt,v.on) end)
    nno(']o'..k,function () setoff(v.opt,v.off) end)
    nno('yo'..k,function () toggle(v.opt,v.on,v.off) end)
    nno('<s'..k,function () seton(v.opt,v.on) end)
    nno('>s'..k,function () setoff(v.opt,v.off) end)
    nno('=s'..k,function () toggle(v.opt,v.on,v.off) end)
end
nno('yox',':set cursorcolumn!|let &cursorline=&cursorcolumn\r')
nno('[ox',':set cursorcolumn cursorline\r')
nno(']ox',':set nocursorcolumn nocursorline\r')
-- vim:fen:
