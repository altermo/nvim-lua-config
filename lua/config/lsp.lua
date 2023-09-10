require'mason'.setup{}
local lspconfig=require'lspconfig'
local lightbulb=require'nvim-lightbulb'
local mason_reg=require'mason-registry'
lightbulb.setup({
    autocmd={enabled=true},
    virtual_text={enabled=true},
    sign={enabled=false},
    ignore={clients={'lua_ls'}},
})
for _,server in ipairs({
    'fennel-language-server',
    'yaml-language-server',
    'zls',
    'clangd',
    'json-lsp',
    'lua-language-server',
    'pyright',
    'rust-analyzer',
    'taplo',
    'csharp-language-server',
}) do
    local pkg=mason_reg.get_package(server)
    if not pkg:is_installed() then pkg:install() end
end
for lsp,opt  in pairs{
    pyright={},
    lua_ls={settings={Lua={
        hint={enable=true},
        runtime={version='LuaJIT'},
        completion={displayContext=30,postfix=':'},
        workspace={
            library={
                '~/.local/share/nvim/site/pack/packer/opt/neodev.nvim/types/nightly',
                '/usr/local/share/nvim/runtime/lua',
                '${3rd}/luv/library',
                '~/.config/nvim/lua',
                '~/.config/nvim/.other/ua/lua/',
            }}}}},
    jsonls={},
    clangd={},
    rust_analyzer={},
    fennel_language_server={},
    --grammarly={},
    zls={},
    taplo={},
    csharp_ls={},
} do
    lspconfig[lsp].setup(opt)
end
local nno=require'utils.keymap'.nno
nno('[d',vim.diagnostic.goto_prev)
nno(']d',vim.diagnostic.goto_next)
nno(']D',vim.diagnostic.disable)
nno('[D',vim.diagnostic.enable)
vim.cmd.LspStart()
