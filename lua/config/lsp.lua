require'mason'.setup{}
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
}) do
    local pkg=require'mason-registry'.get_package(opt[1])
    if not pkg:is_installed() then pkg:install() end
    require'lspconfig'[lsp].setup(opt)
end
vim.cmd.LspStart()
