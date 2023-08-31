for k,v in pairs{
    --splitjoin={},
    jump2d={mappings={start_jumping=''}},
    align={mappings={start='gl',start_with_preview='gL'}},
    ai={},
    indentscope={indent_at_cursor=false},
    surround={
        mappings={
            add='S',
            delete='ds',
            find='',
            find_left='',
            highlight='',
            replace='cs',
            update_n_lines='',
        }
    }
} do
    require('mini.'..k).setup(v)
end
local ma=require'mini.align'
ma.config.modifiers['=']=nil
ma.config.modifiers[' ']=nil
ma.config.modifiers[',']=nil
vim.g.miniindentscope_disable=true
vim.cmd.hi'link MiniTrailspace NvimInternalError'
