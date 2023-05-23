local key=require'utils.keymap'
for k,v in pairs{cursorword={delay=0},splitjoin={}} do --trailspace={},tabline={}
    require('mini.'..k).setup(v)
end
vim.cmd.hi'link MiniTrailspace NvimInternalError'
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
for _,v in pairs({'a','i'}) do
    local fn=function ()
        local ma=require'mini.ai'
        ma.setup{}
        local char=vim.fn.getcharstr(0)
        if vim.v.operator~='' then
            vim.fn.feedkeys((vim.v.operator=='c' and '' or '')..vim.v.operator..v..char,'n')
        end
    end
    key.ono(v,fn)
    key.xno(v,fn)
end
for _,v in pairs({'ai','ii'}) do
    local fn=function ()
        local mi=require'mini.indentscope'
        mi.setup{options={indent_at_cursor=false}}
        vim.g.miniindentscope_disable=true
        if vim.v.operator~='' then
            vim.fn.feedkeys((vim.v.operator=='c' and '' or '')..vim.v.operator,'n')
        end
        vim.fn.feedkeys(v)
    end
    key.ono(v,fn)
    key.xno(v,fn)
end
