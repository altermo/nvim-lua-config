local M={}
local F={
    lua='local function ()\rend\x1bk0ww',
    vim='function ()\rendfunction\x1bk0w'
}
local C={
    lua='local ={}\rfunction :new()\rself.__index=self\rreturn setmetatable({},self)\rend\x1bkkkk0w'
}
local function gototopnodeandexec(exec)
    require('syntax-tree-surfer').go_to_top_node_and_execute_commands(true,{'normal! o\x1bo',exec,'startinsert'})
end
local function get_f()
    local f=F[vim.o.filetype]
    return f and f or '(){\r}\x1bk'
end
local function get_c()
    local f=C[vim.o.filetype]
    return f and f or 'class {\r}\x1bkw'
end
function M.func()
    gototopnodeandexec('normal! I'..get_f())
end
function M.class()
    gototopnodeandexec('normal! I'..get_c())
end
return M
