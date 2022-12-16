require'nvim-lsp-installer'.setup{}
local lspconfig=require'lspconfig'
lspconfig.pyright.setup{}
lspconfig.sumneko_lua.setup{settings={Lua={diagnostics={globals={'vim','unpack'}}}}}
lspconfig.jsonls.setup{}
lspconfig.clangd.setup{}
lspconfig['fennel-ls'].setup{}
local nno=require'utils.keymap'.nno
nno('[d',vim.diagnostic.goto_prev)
nno(']d',vim.diagnostic.goto_next)
nno(']D',vim.diagnostic.disable)
nno('[D',vim.diagnostic.enable)
