local cmp=require'cmp'
local data={
    cmdline={menu='CL',types={':'}},
    buffer={menu='BUF',types={'','/'}},
    nvim_lsp={menu='LSP',types={''}},
}
local function gen(type,tbl)
    return vim.iter(tbl):map(function (name,item) return vim.tbl_contains(item.types,type) and {name=name} or nil end):totable()
end
cmp.setup{
    formatting={format=function (entry,item)
        return setmetatable({dup=0,menu=require('cmp.types').lsp.CompletionItemKind.Snippet==entry:get_kind()
            and 'SLSP' or data[entry.source.name].menu,kind=''},{__index=item})
    end},
    snippet={expand=function (args)
        vim.snippet.expand(args.body:gsub('${(%d-):(.-)}','$%1'))
        vim.snippet.stop()
    end},
    sources=cmp.config.sources(gen('',data)),
    mapping={
        ['<CR>']=cmp.mapping(function(fallback)
            if cmp.get_active_entry() and vim.tbl_contains({'Snippet','Event'},require('cmp.types').lsp.CompletionItemKind[cmp.get_active_entry():get_kind()]) then
                cmp.confirm()
            else
                fallback()
            end end),
        ['<Tab>']=cmp.mapping.select_next_item(),
        ['<S-Tab>']=cmp.mapping.select_prev_item(),
    }}
cmp.setup.cmdline({'/','?'},{
    mapping=cmp.mapping.preset.cmdline(),
    sources=cmp.config.sources(gen('/',data))
})
cmp.setup.cmdline(':',{
    mapping=cmp.mapping.preset.cmdline(),
    sources=cmp.config.sources(gen(':',data))
})
