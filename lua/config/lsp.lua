require'mason'.setup{}
local lspconfig=require'lspconfig'
local lightbulb=require'nvim-lightbulb'
lightbulb.setup({
    autocmd={enabled=true},
    virtual_text={enabled=true},
    sign={enabled=false},
    ignore={clients={'lua_ls'}},
})
for lsp,opt  in pairs{
    pyright={},
    lua_ls={settings={Lua={
        hint={enable=true},
        runtime={version='LuaJIT'},
        completion={
            displayContext=30,
            postfix=':',
        },
        --diagnostics={globals={'vim'}},
        workspace={
            library={
                '/home/user/.local/share/nvim/site/pack/packer/opt/neodev.nvim/types/nightly',
                '/usr/local/share/nvim/runtime/lua',
                '${3rd}/luv/library',
                '~/.config/nvim/lua',
            }}}}},
    jsonls={},
    clangd={},
    rust_analyzer={},
    fennel_ls={},
    grammarly={autostart=false},
    zls={},
    taplo={},
} do
    lspconfig[lsp].setup(opt)
end
local nno=require'utils.keymap'.nno
nno('[d',vim.diagnostic.goto_prev)
nno(']d',vim.diagnostic.goto_next)
nno(']D',vim.diagnostic.disable)
nno('[D',vim.diagnostic.enable)
vim.cmd.LspStart()
