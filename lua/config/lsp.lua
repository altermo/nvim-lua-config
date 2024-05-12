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
    tsserver={'typescript-language-server'},
    vimls={'vim-language-server'},
    jsonls={'vscode-json-language-server'},
    --hyprls={'hyprls'},
}) do
    if vim.fn.executable(opt[1])==0 then vim.notify(opt[1]..' LSP executable not found')
    else require'lspconfig'[lsp].setup(opt) end
end
vim.cmd.LspStart()
