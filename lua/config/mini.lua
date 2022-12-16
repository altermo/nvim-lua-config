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


require('mini.base16').setup({palette={
    base00='#191919', --fourground
    base01='#242424', --virtual fourground
    base02='#600000', --visual mode
    base03='#444444', --comments
    base04='#555555', --numberline number (not relativenumber)
    base05='#888888', --cursor and text
    base06='#ffffff', --unused?
    base07='#444444', --scroolbar
    ---
    base08='#ffa82b', --general text
    base09='#cc7e46', --number
    base0A='#46a436', --statment
    base0B='#9ff895', --string
    base0C='#ca6ecf', --statment
    base0D='#42d08a', --statment
    base0E='#ffc4ff', --statment
    base0F='#00a5c5', --statment
}})
vim.g.terminal_color_0='#000000'
vim.g.terminal_color_1='#FF0000'
vim.g.terminal_color_2='#00FF00'
vim.g.terminal_color_3='#FFFF00'
vim.g.terminal_color_4='#0000FF'
vim.g.terminal_color_5='#FF00FF'
vim.g.terminal_color_6='#00FFFF'
vim.g.terminal_color_7='#FFFFFF'
vim.g.terminal_color_8='#888888'
vim.g.terminal_color_9='#FF8888'
vim.g.terminal_color_10='#88FF88'
vim.g.terminal_color_11='#FFFF88'
vim.g.terminal_color_12='#8888FF'
vim.g.terminal_color_13='#FF88FF'
vim.g.terminal_color_14='#88FFFF'
vim.g.terminal_color_15='#FFFFFF'
