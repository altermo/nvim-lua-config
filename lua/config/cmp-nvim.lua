local cmp=require'cmp'
local data={
    {name='cody',menu='SG'},
    {name='neorg',menu='NORG'},
    {name='buffer',menu='BUF',types={'','/'}},
    {name='nvim_lsp',menu='LSP'},
    {name='codeium',menu='CI'},
    {name='async_path',menu='PATH',types={'',':'}},
    {name='nvim_lsp_signature_help'},
    {name='cmdline',menu='CL',types={':'}},
    {name='fend',menu='FEND'},
}
local function gen(type,tbl)
    return vim.iter(tbl):map(function (item)
        return vim.tbl_contains(item.types or {''},type) and
            vim.tbl_extend('error',{name=item.name},item.conf or {})
            or nil end):totable()
end
local menu=vim.iter(data):fold({},function (acc,item) acc[item.name]=item.menu return acc end)
local function format(entry,item)
    return setmetatable({dup=0,menu=menu[entry.source.name],kind=''},{__index=item})
end
cmp.setup{
    formatting={format=format},
    snippet={expand=function (args)
        vim.snippet.expand(args.body:gsub('${(%d):(.-)}','$%1'))
        vim.snippet.exit()
    end},
    sources=cmp.config.sources(gen('',data)),
    mapping={
        ['<CR>']=cmp.mapping(function(fallback)
            if cmp.get_active_entry() and ({cody=true,async_path=true,nvim_lsp=true,codeium=true})[cmp.get_selected_entry().source.name] then
                cmp.confirm()
            else
                fallback()
            end end),
        ['<Tab>']=cmp.mapping.select_next_item(),
        ['<S-Tab>']=cmp.mapping.select_prev_item(),
    }}
cmp.setup.cmdline('/',{
    formatting={format=format},
    mapping=cmp.mapping.preset.cmdline(),
    sources=cmp.config.sources(gen('/',data))
})
cmp.setup.cmdline(':',{
    formatting={format=format},
    mapping=cmp.mapping.preset.cmdline(),
    sources=cmp.config.sources(gen(':',data))
})
local Kind=cmp.lsp.CompletionItemKind
cmp.event:on(
    'confirm_done',
    function (evt)
        if vim.tbl_contains({Kind.Function,Kind.Method},evt.entry:get_completion_item().kind) then
            vim.api.nvim_feedkeys('()'..vim.keycode'<Left>','n',false)
        end end)
vim.cmd.doautocmd("InsertEnter")
