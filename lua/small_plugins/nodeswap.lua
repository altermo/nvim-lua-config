local M={nodes={
    arguments=true,
    parameters=true,
}}
function M.get_node()
    local node=vim.treesitter.get_node()
    if not node then return end
    local parent=node:parent()
    while parent and not M.nodes[parent:type()] do
        node=parent
        parent=node:parent()
    end
    return parent and node
end
function M.swap(prev)
    local node=M.get_node()
    if not node then return end
    local other=prev and node:prev_named_sibling() or node:next_named_sibling()
    if not other then return end
    require'nvim-treesitter.ts_utils'.swap_nodes(node,other,0)
end
function M.setup()
    vim.keymap.set('n','<a',function() M.swap(true) end)
    vim.keymap.set('n','>a',function() M.swap() end)
end
return M
