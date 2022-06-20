require("nvim-lsp-installer").setup{}
require("luasnip.loaders.from_vscode").lazy_load()

require'lspconfig'.pyright.setup{}
require'lspconfig'.sumneko_lua.setup{settings={Lua={diagnostics={globals={'vim'}}}}}
require'lspconfig'.jsonls.setup{}
require'lspconfig'.bashls.setup{}

vim.keymap.set('n','[d',vim.diagnostic.goto_prev,{noremap=true,silent=true})
vim.keymap.set('n',']d',vim.diagnostic.goto_next,{noremap=true,silent=true})

local cmp=require'cmp'
local lspkind = require('lspkind')
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
})--TODO
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

local ls=require("luasnip")
vim.keymap.set({"i","s"},"<c-l>",function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
end end,{silent=true})
vim.keymap.set({"i","s"},"<c-h>",function()
    if ls.jumpable(-1) then
        ls.jump(-1)
end end,{silent=true})
local snip=ls.snippet
local func=ls.function_node
ls.add_snippets(nil,{
    all={
        snip({trig="dd"},{func(function() return {os.date('%Y-%m-%d')} end)}),
        snip({trig="dt"},{func(function() return {os.date('%H-%M-%S')} end)}),
        snip({trig="path"},{func(function() return {vim.fn.expand('%')} end)}),
        snip({trig="pathh"},{func(function() return {vim.fn.expand('%:h')} end)}),
        snip({trig="patht"},{func(function() return {vim.fn.expand('%:t')} end)}),
}})
