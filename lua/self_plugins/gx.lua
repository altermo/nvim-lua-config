local fn=vim.fn
local function gx()
    local path=fn.expand('<cfile>')
    if fn.filereadable(path)==1 or fn.isdirectory(path)==1 then
        vim.cmd('edit '..path)
    else --TODO
        vim.api.nvim_feedkeys('gx','nx',true)
    end
end
vim.keymap.set('n','gx',gx,{noremap=true})
--[[
a/b
--]]
