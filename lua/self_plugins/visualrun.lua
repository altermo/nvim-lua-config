local fn=vim.fn
local codes=''
local temp=fn.tempname()
function Visualadd()
    local line1=fn.line("'<")
    local line2=fn.line("'>")
    local code=fn.getline(line1,line2)
    codes=codes..fn.join(code,'\n')..'\n'
end
function Visualprint()
    vim.notify(codes)
end
function Visualrun()
    local line1=fn.line("'<")
    local line2=fn.line("'>")
    local code=fn.getline(line1,line2)
    local f=function ()
        load(codes..fn.join(code))()
    end
    local err,_=pcall(f)
    if not err then
        error(err)
    end
end
function Visualrunnormal()
    local f=function ()
        load(codes)()
    end
    local err,_=pcall(f)
    if not err then
        error(err)
    end
end
function VisualOpen()
    fn.writefile(fn.split(codes,'\n'),temp,'b')
    vim.cmd('split '..temp)
    vim.cmd'set write'
    local group=vim.api.nvim_create_augroup('VisualBuf',{clear=true})
    vim.api.nvim_create_autocmd('CursorMoved',{callback=function ()
        codes=fn.join(fn.readfile(temp),'\n')
    end,group=group,buffer=0})
end
function Visualclear()
    codes=''
end
function VisualCode()
    return codes
end
vim.keymap.set('x','\\\r',':<C-u>call v:lua.Visualrun()\r',{silent=true,noremap=true})
vim.keymap.set('x','\\va',':<C-u>call v:lua.Visualadd()\r',{silent=true,noremap=true})
vim.keymap.set('n','\\\r',':call v:lua.Visualrunnormal()\r',{silent=true,noremap=true})
vim.keymap.set('n','\\vc',':call v:lua.Visualclear()\r',{silent=true,noremap=true})
vim.keymap.set('n','\\vp',':call v:lua.Visualprint()\r',{silent=true,noremap=true})
vim.keymap.set('n','\\ve',':call v:lua.VisualOpen()\r',{silent=true,noremap=true})
