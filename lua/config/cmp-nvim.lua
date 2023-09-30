---@diagnostic disable: undefined-field
local cmp=require'cmp'
local data={
    {name='neorg',menu='NORG'},
    {name='buffer',menu='BUF',types={'','/'}},
    {name='nvim_lsp',menu='LSP'},
    {name='codeium',menu='CI',conf={entry_filter=function () return not _G.CMD_NO_SPAM end}},
    {name='async_path',menu='PATH',types={'',':'}},
    {name='calc',menu='CALC'},
    {name='rg',menu='RG',conf={option={additional_arguments='--max-depth 4'},max_item_count=20,entry_filter=function () return not _G.CMD_NO_SPAM end}},
    {name='nvim_lsp_signature_help'},
    {name='cmdline',menu='CL',types={':'}},
    {name='cmdline_history',menu='CLH',types={':'}},
}
local function gen(type,tbl)
    return vim.iter(tbl):map(function (item)
        return vim.tbl_contains(item.types or {''},type) and
            vim.tbl_extend('error',{name=item.name},item.conf or {})
            or nil end):totable()
end
local menu=vim.iter(data):fold({},function (acc,item) acc[item.name]=item.menu return acc end)
local normal=gen('',data)
local cmdline=gen(':',data)
local searchline=gen('/',data)
local function format(entry,item)
    return vim.tbl_extend('force',item,{dup=0,menu=menu[entry.source.name]})
end
local function snippet(args)
    local line_num,col=unpack(vim.api.nvim_win_get_cursor(0))
    local line_text=vim.api.nvim_buf_get_lines(0,line_num-1,line_num,true)[1]
    local indent=line_text:match('^%s*')
    local replace=vim.split(args.body:gsub('$%d',''),'\n')
    local pos=args.body:find('$1') or #replace[1]+1
    replace[1]=line_text:sub(0,col):gsub('^%s*','')..replace[1]
    replace[#replace]=replace[#replace]..line_text:sub(col+1)
    for i,line in ipairs(replace) do replace[i]=indent..line:gsub('\t',(' '):rep(vim.o.shiftwidth)) end
    vim.api.nvim_buf_set_lines(0,line_num-1,line_num,true,replace)
    vim.api.nvim_win_set_cursor(0,{line_num,pos+col-1})
end
cmp.setup({
    formatting={format=format},
    snippet={expand=snippet},
    sources=cmp.config.sources(normal),
    mapping={
        ['<CR>']=cmp.mapping(function(fallback)
            if cmp.get_active_entry() and ({async_path=true,nvim_lsp=true,codeium=true})[cmp.get_selected_entry().source.name] then
                cmp.confirm()
            else
                fallback()
            end end),
        ['<Tab>']=cmp.mapping.select_next_item(),
        ['<S-Tab>']=cmp.mapping.select_prev_item(),
    },
})
cmp.setup.cmdline('/',{
    formatting={format=format},
    mapping=cmp.mapping.preset.cmdline(),
    sources=cmp.config.sources(searchline)
})
cmp.setup.cmdline(':',{
    formatting={format=format},
    mapping=cmp.mapping.preset.cmdline(),
    sources=cmp.config.sources(cmdline)
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
