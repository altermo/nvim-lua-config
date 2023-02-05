local cmp=require'cmp'
local lspkind=require'lspkind'
cmp.setup({
    formatting={
        format=lspkind.cmp_format({menu={
            snippy='SNIP',
            cmp_tabnine='TN',
            nvim_lsp='LSP',
            calc='CALC',
            spell='SP',
            path='PATH',
            rg='RG',
            fish='FISH',
            nvim_lua='NVL',
            treesitter='TS',
            tags='TGS',
            --fuzzy_buffer='FB',
            buffer='BUF',
        },mode='text'})},
    snippet={
        expand=function(args)
            require('snippy').expand_snippet(args.body)
        end
    },
    sources=cmp.config.sources({
        {name='snippy'},
        {name='cmp_tabnine'},
        {name='nvim_lsp'},
        {name='nvim_lsp_signature_help'},
        {name='calc'},
        {name='spell'},
        {name='path'},
        {name='rg',option={additional_arguments='--hidden --max-depth 4'}},--cwd='..',
        {name='fish'},
        {name='nvim_lua'},
        {name='treesitter'},
        {name='tags'},
        --{name='fuzzy_buffer'},
        {name='buffer'},
    }),
    mapping=cmp.mapping.preset.insert({
        ['<CR>']=cmp.mapping(function()
            if cmp.get_active_entry() and ({snippy=true,path=true,nvim_lsp=true,cmp_tabnine=true})[cmp.get_selected_entry().source.name] then
                cmp.confirm()
            else
                require'ultimate-autopair.maps.cr'.newline()
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
    }),
})
cmp.setup.cmdline('/',{
    mapping=cmp.mapping.preset.cmdline(),
    sources=cmp.config.sources({
        {name='buffer'},
    })
})
cmp.setup.cmdline(':',{
    formatting={
        format=lspkind.cmp_format({menu={
            path='PATH',
            cmdline='CL',
            cmdline_history='CLH',
            cmp_tabnine='TN',
        },mode='text'})},
    mapping=cmp.mapping.preset.cmdline(),
    sources=cmp.config.sources({
        {name='path'},
        {name='cmdline'},
        {name='cmdline_history'},
        {name='cmp_tabnine'},
    })
})
cmp.setup.filetype({'AerojumpFilter'},{sources={}})
local compare=require('cmp.config.compare')
cmp.setup{sorting={priority_weight=2,comparators={
    require('cmp_tabnine.compare'),
    compare.offset,
    compare.exact,
    compare.score,
    compare.recently_used,
    compare.kind,
    compare.sort_text,
    compare.length,
    compare.order,
}}}
require'cmp_nvim_lua'.is_available=function ()
    return vim.bo.filetype=='lua' or vim.bo.filetype=='fennel'
end
