local utils=dofile'util.lua' --temp
local data=dofile'data.lua' --temp
local part=dofile'part.lua' --temp
local M={}
local function insert(text)
    local r=utils.getcol()
    local line=utils.getline()
    line=line:sub(1,r-1)..text..line:sub(r)
    utils.setline(line)
end
local function add_pairs(pair)
    if part.open_par_after(pair) then
        insert(pair)
    else
        insert(pair..data.bte[pair])
    end
    utils.movel()
end
local function add_paire(pair)
    local col=utils.getcol()
    if not (utils.getline():sub(col,col)==pair
        and part.open_par_before(pair)) then
        insert(pair)
    end
    utils.movel()
end
local function add_paira(pair)
    local col=utils.getcol()
    if not (utils.getline():sub(col,col)==pair
        and part.open_par_ambigous_before(pair)) then
        if part.open_par_ambigous_after(pair) then
            insert(pair)
        else
            insert(pair..pair)
        end
    elseif not part.open_par_ambigous_after(pair) then
        insert(pair)
    end
    utils.movel()
end
function M.setup()
    local keymap=require 'utils.keymap'
    keymap.ino('&',function() add_pairs('&') end)
    keymap.ino('?',function() add_paire('?') end)
    keymap.ino('#',function() add_paira('#') end)
end
M.setup()
return M--#ab#
