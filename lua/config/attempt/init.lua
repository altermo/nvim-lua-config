local attempt=require'attempt'
local nno=require'utils.keymap'.nno
local cont={}
for file in vim.fs.dir(vim.fn.stdpath'config'..'/lua/config/attempt/content') do
    local ft=vim.fn.fnamemodify(file,':r') --[[@as string]]
    cont[vim.fs.basename(ft)]=require('config.attempt.content.'..vim.fs.basename(ft))
end
attempt.setup{
    ext_options={'lua','js','py','fnl','cpp','c','norg','fish','zig','rs','go','java','ts','cs','css','scss'},
    initial_content=cont}
nno('<leader>an',attempt.new_select)
nno('<leader>ai',attempt.new_input_ext)
nno('<leader>ad',attempt.delete_buf)
nno('<leader>ac',attempt.rename_buf)
nno('<leader>al',':Telescope attempt attempt\r')
