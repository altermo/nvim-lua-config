local cmp=require'cmp'
local menu={
    snippy='SNIP',
    nvim_lsp='LSP',
    calc='CALC',
    spell='SP',
    async_path='PATH',
    rg='RG',
    buffer='BUF',
    codeium='CI',
    obsidian='OBS',
    cmdline_history='CLH',
    cmdline='CL',
}
local function format(entry,item)
    item.dup=0
    item.menu=menu[entry.source.name]
    return item
end
cmp.setup({
    formatting={format=format},
    snippet={
        expand=function(args)
            require('snippy').expand_snippet(args.body)
        end
    },
    sources=cmp.config.sources({
        {name='nvim_lsp'},
        {name='buffer'},
        {name='codeium'},
        {name='snippy'},
        {name='obsidian'},
        {name='spell'},
        {name='async_path'},
        {name='calc'},
        {name='rg',option={additional_arguments='--max-depth 4'}},
        {name='nvim_lsp_signature_help'},
    }),
    mapping={
        ['<CR>']=cmp.mapping(function(fallback)
            if cmp.get_active_entry() and ({snippy=true,path=true,nvim_lsp=true,cmp_tabnine=true,codeium=true})[cmp.get_selected_entry().source.name] then
                cmp.confirm()
            else
                fallback()
            end end),
        ['<Tab>']=cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end end,{'i','s'}),
        ['<S-Tab>']=cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end end,{'i','s'})
    },
})
cmp.setup.cmdline('/',{
    formatting={format=format},
    mapping=cmp.mapping.preset.cmdline(),
    sources=cmp.config.sources({
        {name='buffer'},
    })
})
cmp.setup.cmdline(':',{
    formatting={format=format},
    mapping=cmp.mapping.preset.cmdline(),
    sources=cmp.config.sources({
        {name='path'},
        {name='cmdline'},
        {name='cmdline_history'},
    })
})
local compare=require('cmp.config.compare')
cmp.setup{sorting={priority_weight=2,comparators={
    compare.score,
    compare.offset,
    compare.exact,
    compare.recently_used,
    compare.kind,
    compare.sort_text,
    compare.length,
    compare.order,
}}}
--if vim.o.filetype=='dirbuf' then
    --vim.api.nvim_create_autocmd('FileType',{pattern='conf',
        --callback=function()
            --if vim.fn.isdirectory(vim.api.nvim_buf_get_name(0)) then
                --vim.o.filetype='dirbuf'
            --end
        --end
    --})
--end
