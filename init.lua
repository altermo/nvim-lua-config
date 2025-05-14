-- NOTE:
-- This file is only for tangling the README.md file.

vim.loader.enable()
local def_out=vim.fn.stdpath('config')..'/lua/user/init.lua'
local in_=vim.fn.stdpath('config')..'/README.md'
if not vim.uv.fs_stat(def_out) or vim.fn.getftime(in_)>vim.fn.getftime(def_out) then
    vim.fn.mkdir(vim.fn.stdpath('config')..'/lua/user','p')
    local file=assert(io.open(def_out,'w'))
    local scopes=vim.defaulttable(function () return '' end)
    local source=vim.fn.readblob(in_)
    local query=vim.treesitter.query.parse('markdown',[[
        (fenced_code_block (info_string (language) @lang) @info (code_fence_content) @code)
    ]])
    for _,match in query:iter_matches(vim.treesitter.get_string_parser(source,'markdown'):parse(true)[1]:root(),source) do
        local v={}
        for id,nodes in pairs(match) do
            v[query.captures[id]]=vim.treesitter.get_node_text(nodes[1],source)
        end
        local fname=vim.trim(v.info:sub(#v.lang+1))
        if fname=='' then
            for name,scode in pairs(scopes) do
                v.code=v.code:gsub(vim.pesc('&'..name:upper()..'!()'),vim.pesc(scode))
            end
            file:write(v.code)
        else
            scopes[fname]=scopes[fname]..' '..v.code
        end
    end
    file:close()
end
require('user.init')
