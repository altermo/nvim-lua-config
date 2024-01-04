local cmp=require'cmp'
local data={
    {name='buffer',menu='BUF',types={'','/'}},
    {name='nvim_lsp',menu='LSP'},
    {name='codeium',menu='CI'},
    {name='nvim_lsp_signature_help'},
    {name='cmdline',menu='CL',types={':'}},
}
local function gen(type,tbl)
    return vim.iter(tbl):map(function (item)
        return vim.tbl_contains(item.types or {''},type) and {name=item.name} or nil
    end):totable()
end
local menu=vim.iter(data):fold({},function (acc,item) acc[item.name]=item.menu return acc end)
local function format(entry,item) return setmetatable({dup=0,menu=menu[entry.source.name],kind=''},{__index=item}) end
cmp.setup{
    formatting={format=format},
    snippet={expand=function (args)
        vim.snippet.expand(args.body:gsub('${(%d):(.-)}','$%1'))
        vim.snippet.exit()
    end},
    sources=cmp.config.sources(gen('',data)),
    mapping={
        ['<CR>']=cmp.mapping(function(fallback)
            if cmp.get_active_entry() and vim.tbl_contains({'nvim_lsp','codeium'},cmp.get_selected_entry().source.name) then
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
