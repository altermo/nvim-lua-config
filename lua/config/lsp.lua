local servers={
    pyright={'pyright'},
    lua_ls={'lua-language-server',settings={Lua={
        hint={enable=true},
        runtime={version='LuaJIT'},
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
}
require'mason'.setup{}
local lspconfig=require'lspconfig'
local mason_reg=require'mason-registry'
for _,opt in pairs(servers) do
    local pkg=mason_reg.get_package(opt[1])
    if not pkg:is_installed() then pkg:install() end
end
for lsp,opt in pairs(servers) do
    lspconfig[lsp].setup(opt)
end
vim.cmd.LspStart()
