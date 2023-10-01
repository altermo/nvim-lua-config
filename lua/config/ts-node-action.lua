local tsaction=require('ts-node-action')
local function toggle_statement(node,times)
    local cont=vim.treesitter.get_node_text(node,0)
    local ret={}
    for i=0,times do
        table.insert(ret,vim.treesitter.get_node_text(node:child(i),0))
    end
    ret={table.concat(ret,' ')}
    for i in node:child(times+1):iter_children() do
        table.insert(ret,vim.treesitter.get_node_text(i,0))
    end
    table.insert(ret,vim.treesitter.get_node_text(node:child(times+2),0))
    if cont:find'\n' then
        return table.concat(ret,' ')
    else
        return ret,{format=true}
    end
end
local function wrap_toggle_statement(times)
    return function(node)
        return toggle_statement(node,times)
    end
end
tsaction.setup{
    lua={
        if_statement=wrap_toggle_statement(2),
        for_statement=wrap_toggle_statement(2),
        function_definition=wrap_toggle_statement(1),
    }
}
vim.keymap.set('n','K',tsaction.node_action)
