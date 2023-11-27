for lsp,opt in pairs({
    pyright={'pyright'},
    lua_ls={'lua-language-server',settings={Lua={
        hint={enable=true},
        runtime={version='LuaJIT',unicodeName=true},
        completion={displayContext=30,postfix=':'},
        workspace={library={
            '/usr/local/share/nvim/runtime/lua/vim/',
            '${3rd}/luv/library',
            '~/.config/nvim/lua',
        }}}}},
    jsonls={'json-lsp'},
    clangd={'clangd'},
    rust_analyzer={'rust-analyzer'},
    fennel_language_server={'fennel-language-server'},
    zls={'zls'},
    taplo={'taplo'},
    tsserver={'typescript-language-server'},
    nushell={'nu'}
}) do
    if vim.fn.executable(opt[1])==0 then vim.notify(opt[1]..' not found') end
    require'lspconfig'[lsp].setup(opt)
end
vim.cmd.LspStart()
