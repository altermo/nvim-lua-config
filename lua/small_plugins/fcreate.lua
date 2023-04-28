local M={}
M.f={
    lua='local function ()\rend\x1bk0ww',
    vim='function ()\rendfunction\x1bk0w',
    fennel='(fn  []\r\r)\x1bkkll',
}
M.c={
    lua='local ={}\rfunction :new()\rself.__index=self\rreturn setmetatable({},self)\rend\x1bkkkk0w',
}
function M.gototopnodeandexec(exec)
    --TODO
end
function M.get_f()
    return M.f[vim.o.filetype] or '(){\r}\x1bk'
end
function M.get_c()
    return M.c[vim.o.filetype] or '(){\r}\x1bk'
end
function M.func()
    M.gototopnodeandexec('normal! I'..M.get_f)
end
function M.class()
    M.gototopnodeandexec('normal! I'..M.get_c)
end
return M
