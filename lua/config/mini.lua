for k,v in pairs({bufremove={},cursorword={delay=0},doc={},jump2d={mappings={start_jumping=''}},misc={},sessions={},test={},trailspace={}}) do
    require('mini.'..k).setup(v)
end
vim.cmd'hi link MiniTrailspace NvimInternalError'
vim.api.nvim_create_autocmd('FileType',{pattern='dashboard',command='lua MiniTrailspace.unhighlight()'})
