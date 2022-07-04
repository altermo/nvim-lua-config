local cmp=require'cmp'
local lspkind=require('lspkind')
cmp.setup({
    formatting={
        format=lspkind.cmp_format({menu={
            luasnip="SNIP",
            cmp_tabnine="TN",
            nvim_lsp="LSP",
            buffer="BUF",
            calc="CALC",
            spell="SP",
            path="PATH",
            rg="RG",
            fish='FISH',
            nvim_lua='NVL',
            orgmode='ORG',
            treesitter='TS',
            tags='TGS',
    },mode='text'})},
    snippet={
        expand=function(args)
            require('luasnip').lsp_expand(args.body)
        end
    },
    sources=cmp.config.sources({
        {name="luasnip"},
        {name="cmp_tabnine"},
        {name="nvim_lsp"},
        {name="nvim_lsp_signature_help"},
        {name="buffer"},
        {name="calc"},
        {name="spell"},
        {name="path"},
        {name="rg"},
        {name="fish"},
        {name='nvim_lua'},
        {name='orgmode'},
        {name='treesitter'},
        {name='tags'},
    }),
mapping=cmp.mapping.preset.insert({
    ["<CR>"]=cmp.mapping(function()
        if cmp.get_selected_entry() then
            cmp.confirm({
                behavior=cmp.ConfirmBehavior.Replace,
                select=false,
            })
        else
            vim.fn.feedkeys'o'
        end end),
    ["<Tab>"]=cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_next_item()
        else
            fallback()
        end end,{ "i","s" }),
    ["<S-Tab>"]=cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_prev_item()
        else
            fallback()
        end end,{ "i","s" })
    }),
})
cmp.setup.cmdline("/",{
    mapping=cmp.mapping.preset.cmdline(),
    cmp.config.sources({
        {name='buffer'},
    })
})
cmp.setup.cmdline(":",{
    mapping=cmp.mapping.preset.cmdline(),
    sources=cmp.config.sources({
        {name="path"},
        {name="cmdline"},
    })
})
local compare = require('cmp.config.compare')
cmp.setup({sorting={priority_weight=2,comparators={
    require('cmp_tabnine.compare'),
    compare.offset,
    compare.exact,
    compare.score,
    compare.recently_used,
    compare.kind,
    compare.sort_text,
    compare.length,
    compare.order,
}}})
