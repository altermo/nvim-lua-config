require'mason'.setup{}
local lspconfig=require'lspconfig'
lspconfig.pylsp.setup{settings={pylsp={plugins={pycodestyle={enabled=false}}}}}
lspconfig.lua_ls.setup{settings={Lua={diagnostics={globals={'vim','unpack'}}}}}
lspconfig.jsonls.setup{}
lspconfig.clangd.setup{}
lspconfig.rust_analyzer.setup{} --TODO
lspconfig['fennel_ls'].setup{}
local nno=require'utils.keymap'.nno
nno('[d',vim.diagnostic.goto_prev)
nno(']d',vim.diagnostic.goto_next)
nno(']D',vim.diagnostic.disable)
nno('[D',vim.diagnostic.enable)
