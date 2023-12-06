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
for i in ('= ,'):gmatch'.' do require'mini.align'.config.modifiers[i]=nil end
