for k,v in pairs{cursorword={delay=0},trailspace={},ai={}} do --tabline={}
    require('mini.'..k).setup(v)
end
vim.cmd'hi link MiniTrailspace NvimInternalError'
vim.api.nvim_create_autocmd('FileType',{pattern='dashboard',command='lua MiniTrailspace.unhighlight()'})
local mini_mods={
    ["mini.jump2d"]=function (p)
        p.setup{mappings={start_jumping=''}}
    end,
}
local loaded={}
local function lazy_load_module(name)
    if loaded[name] then return end
    loaded[name]=true
    for pat,f in pairs(mini_mods) do
        if name==pat then
            local pack=require(name)
            if f then
                f(pack)
            end
            return pack
        end
    end
end
---@diagnostic disable-next-line: deprecated
table.insert(package.loaders, 1, lazy_load_module)

