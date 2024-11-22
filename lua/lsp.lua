local rename=vim.lsp.handlers['textDocument/rename']
vim.lsp.handlers['textDocument/rename']=function(_,result,ctx)
    rename(_,result,ctx)
    local changes=result.changes or result.documentChanges
    vim.notify(('Renamed %s instance in %s file'):format(
        vim.iter(changes):fold(0,function(a,_,n) return a+(#(n.edits or n)) end),
        #vim.tbl_keys(changes)))
end
for lsp,opt in pairs({
    basedpyright={'basedpyright-langserver',settings={basedpyright={analysis={typeCheckingMode='standard'}}}},
    lua_ls={'lua-language-server',settings={Lua={
        hint={enable=true},
        runtime={version='LuaJIT',unicodeName=true},
        completion={displayContext=30,postfix=':'},
        workspace={library={
            '/usr/local/share/nvim/runtime/lua/vim/',
            '${3rd}/luv/library',
            '~/.config/nvim/lua',
        }}}}},
    clangd={'clangd'},
    rust_analyzer={'rust-analyzer'},
    zls={'zls'},
    taplo={'taplo'},
    ts_ls={'typescript-language-server'},
    vimls={'vim-language-server'},
}) do
    if vim.fn.executable(opt[1])==0 then vim.notify(opt[1]..' LSP executable not found')
    else require'lspconfig'[lsp].setup(opt) end
end
vim.cmd.LspStart()
