for k,v in pairs{
    align={mappings={start='gl',start_with_preview='gL'}},
    ai={},
    surround={
        mappings={
            add='S',
            delete='ds',
            find='',
            find_left='',
            highlight='',
            replace='cs',
            update_n_lines='',
        }}} do
    require('mini.'..k).setup(v)
end
local ma=require'mini.align'
ma.config.modifiers['=']=nil
ma.config.modifiers[' ']=nil
ma.config.modifiers[',']=nil
