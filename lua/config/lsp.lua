---@type uv --Temp
vim.uv=vim.uv
require'mason'.setup{}
local lspconfig=require'lspconfig'
local lightbulb=require'nvim-lightbulb'
lightbulb.setup({
    autocmd={enabled=true},
    virtual_text={enabled=true},
    sign={enabled=false},
    ignore={clients={'lua_ls'}},
})
lspconfig.pyright.setup{}
lspconfig.lua_ls.setup{
    settings={
        Lua={
            hint={
                enable=true,
            },
            completion={
                displayContext=30,
                postfix=':',
            },
            --misc={
                --parameters={
                    --'--develop=true',
                --},
            --},
            runtime={
                version='LuaJIT',
                --plugin='/home/user/.config/nvim/lua/utils/lua_ls-plugin.lua'
            },
            --diagnostics={
                --globals={'vim'},
            --},
            workspace={
                library={
                    '/home/user/.local/share/nvim/site/pack/packer/opt/neodev.nvim/types/nightly',
                    '/usr/local/share/nvim/runtime/lua',
                    '${3rd}/luv/library',
                    '~/.config/nvim/lua',
                }
            }
        }
    }
}
lspconfig.jsonls.setup{}
lspconfig.clangd.setup{}
lspconfig.rust_analyzer.setup{}
lspconfig['fennel_ls'].setup{}
lspconfig.grammarly.setup{autostart=false}
lspconfig.zls.setup{} --TODO something is slowing it down
local nno=require'utils.keymap'.nno
nno('[d',vim.diagnostic.goto_prev)
nno(']d',vim.diagnostic.goto_next)
nno(']D',vim.diagnostic.disable)
nno('[D',vim.diagnostic.enable)
