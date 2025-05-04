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
        runtime={version='LuaJIT',unicodeName=true},
        workspace={library={'/usr/local/share/nvim/runtime/lua/'}}}}},
    clangd={'clangd'},
    rust_analyzer={'rust-analyzer'},
    zls={'zls'},
    taplo={'taplo'},
    ts_ls={'typescript-language-server'},
    vimls={'vim-language-server'},
}) do
    if vim.fn.executable(opt[1])==0 then vim.notify(opt[1]..' LSP executable not found') end
    vim.lsp.config[lsp]=vim.tbl_extend('force',vim.lsp.config[lsp],opt)
    vim.lsp.enable(lsp)
end
vim.diagnostic.config({virtual_text=true,severity_sort=true})
vim.cmd.LspStart()
