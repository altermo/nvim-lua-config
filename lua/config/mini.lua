for k,v in pairs{
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
