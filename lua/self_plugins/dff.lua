--[[
.conf/
.cashe/
dir/
file1
file2
>>>
/.c0 onf  > .c0 .co
/.c1 ashe > .c1 .ca
/d   ir   > d
 f0  ile1 > f0 file1
 f1  ile2 > f1 file2
--]]
local api=vim.api
local fn=vim.fn
local function counter(x) --list{any}:table{any:int}>vlib
    local out={}
    for _,v in pairs(x) do
        out[v]=fn.count(x,v)
    end
    return out
end
local function firstletterer(x) --list{str}:list{str}>lib
    local out={}
    for _,v in pairs(x) do
        out[#out+1]=string.sub(v,1,1)
    end
    return out
end
local function zfill(s,n) --str,int:str>vlib
    return fn['repeat']('0',n-fn.len(s))..s
end
local function shortnamer(x) --list{str}:table{str,str}>wlib
    if x[''] then error('All elements of list must have a minimum length of 1') end
    local firstletters=firstletterer(x)
    local count=counter(firstletters)
    local out={}
    local firstlettersnum={}
    for _,v in pairs(firstletters) do firstlettersnum[v]=0 end
    for _,i in pairs(x) do
        local firstletter=string.sub(i,1,1)
        if count[firstletter]==1 then
            out[firstletter]=i
        else
            out[firstletter..zfill(tostring(firstlettersnum[firstletter]),fn.len(tostring(count[firstletter])-1))]=i
            firstlettersnum[firstletter]=firstlettersnum[firstletter]+1
    end end
    return out
end
--vim.notify(vim.inspect(shortnamer({'a0','a1','a2','a3','a4','a5','a6','a7','a8','a9'})))
--vim.notify(vim.inspect(shortnamer({'a0','a1','a2','a3','a4','a5','a6','a7','a8','a9','a10'})))
local function createtext(x,pat,path) --dict{str,str}:list{str}>lib
    local out={}
    for k,v in pairs(x) do
        if string.sub(k,1,#pat)==pat then
            if fn.isdirectory(path..'/'..v)==1 then
                out[#out+1]='/'..k..' '..string.sub(v,2)
            else
                out[#out+1]=' '..k..' '..string.sub(v,2)
            end
        end
    end
    return out
end
local function mainloop(buf,path)
    local search=''
    while fn.isdirectory(path)==1 do
        local shortnames=shortnamer(fn.readdir(path))
        local text=createtext(shortnames,search,path)
        api.nvim_buf_set_lines(buf,0,vim.o.columns-11,false,text)
        for i = 0,vim.o.columns,1 do
            api.nvim_buf_add_highlight(buf,-1,'DiagnosticError',i,1,2)
        end
        api.nvim_buf_set_lines(buf,-1,-1,false,{':'..search})
        vim.cmd('redraw')
        local char=fn.getchar()
        if char==27 then
            return path
        elseif char=='\x80kb' then
            if search=='' then
                path=fn.fnamemodify(path,':h')
            else
            search=string.sub(search,0,-2)
            end
        else
            search=search..fn.nr2char(char)
        end
        if shortnames[search] then
            path=path..'/'..shortnames[search]
            search=''
        end
    end
    return path
end
function Dff()
    local buf=api.nvim_create_buf(false,true)
    api.nvim_buf_set_option(buf,'bufhidden','wipe')
    local window=api.nvim_get_current_win()
    api.nvim_win_set_buf(window,buf)
    vim.cmd('e '..mainloop(buf,fn.fnamemodify('.',':p')))
end
api.nvim_create_user_command('Dff','lua Dff()',{})
--TODO evrythong
