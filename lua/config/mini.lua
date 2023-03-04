local key=require'utils.keymap'
for k,v in pairs{cursorword={delay=0},trailspace={},ai={}} do --tabline={}
    require('mini.'..k).setup(v)
end
vim.cmd.hi'link MiniTrailspace NvimInternalError'
vim.api.nvim_create_autocmd('FileType',{pattern='dashboard',command='lua MiniTrailspace.unhighlight()'})
local loaded=false
local function lazy_load_jump2d(name)
    if loaded then return end
    if name=='mini.jump2d' then
        loaded=true
        require'mini.jump2d'.setup{mappings={start_jumping=''}}
    end
end
---@diagnostic disable-next-line: deprecated
table.insert(package.loaders,1,lazy_load_jump2d)
for _,v in pairs({'gl','gL'}) do
    local fn=function ()
        local ma=require'mini.align'
        ma.setup{
            mappings={
                start='gl',
                start_with_preview='gL',
            }}
        ma.config.modifiers['=']=nil
        ma.config.modifiers[' ']=nil
        ma.config.modifiers[',']=nil
        vim.fn.feedkeys(v)
    end
    key.nno(v,fn)
    key.xno(v,fn)
end

