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
local function snippet(args)
    local line_num,col=unpack(vim.api.nvim_win_get_cursor(0))
    local line_text=vim.api.nvim_buf_get_lines(0,line_num-1,line_num,true)[1]
    local indent=line_text:match('^%s*')
    local pos=args.body:find('$1')
    local replace=vim.split(args.body:gsub('$%d',''),'\n')
    local f=replace[1]
    replace[1]=line_text:sub(0,col):gsub('^%s*','')..replace[1]
    replace[#replace]=replace[#replace]..line_text:sub(col+1)
    for i,line in ipairs(replace) do replace[i]=indent..line end
    vim.api.nvim_buf_set_lines(0,line_num-1,line_num,true,replace)
    vim.api.nvim_win_set_cursor(0,{line_num,pos and pos+col-1 or col+#f})
end
cmp.setup({
    formatting={format=format},
    snippet={expand=snippet},
    sources=cmp.config.sources({
        {name='buffer'},
        {name='nvim_lsp'},
        {name='codeium'},
        {name='snippy'},
        {name='obsidian'},
        {name='spell',entry_filter=function () return not _G.CMD_NO_SPAM end},
        {name='async_path'},
        {name='calc'},
        {name='rg',option={additional_arguments='--max-depth 4'},max_item_count=20,entry_filter=function () return not _G.CMD_NO_SPAM end},
        --{name='rg',option={additional_arguments='--max-depth 4'},max_item_count=100,keyword_length=5},
        {name='nvim_lsp_signature_help'},
    }),
    mapping={
        ['<CR>']=cmp.mapping(function(fallback)
            if cmp.get_active_entry() and ({snippy=true,async_path=true,nvim_lsp=true,codeium=true})[cmp.get_selected_entry().source.name] then
                cmp.confirm()
            else
                fallback()
            end end),
        ['<Tab>']=cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end end),
        ['<S-Tab>']=cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end end)
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
vim.cmd.doautocmd("InsertEnter")
