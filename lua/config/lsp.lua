---@type uv --Temp
vim.uv=vim.uv
--require'neodev'.setup{
    --library={
        --plugins=false,
    --},
--}
require'mason'.setup{}
local lspconfig=require'lspconfig'
lspconfig.pyright.setup{}
lspconfig.lua_ls.setup{
    settings={
        Lua={
            runtime={
                version='LuaJIT',
            },
            diagnostics={
                globals={'vim'},
            },
            workspace={
                library={
                    '/usr/local/share/nvim/runtime/lua',
                    '${3rd}/luv/library',
                    '/home/user/.local/share/nvim/site/pack/packer/opt/neodev.nvim/types/nightly',
                    '~/.config/nvim/lua',
                }
            }
        }
    }
}
lspconfig.jsonls.setup{}
lspconfig.clangd.setup{}
lspconfig.rust_analyzer.setup{} --TODO
lspconfig['fennel_ls'].setup{}
lspconfig.grammarly.setup{autostart=false}
local nno=require'utils.keymap'.nno
nno('[d',vim.diagnostic.goto_prev)
nno(']d',vim.diagnostic.goto_next)
nno(']D',vim.diagnostic.disable)
nno('[D',vim.diagnostic.enable)
