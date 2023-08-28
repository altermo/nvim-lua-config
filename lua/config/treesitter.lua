require'nvim-treesitter.configs'.setup({
    highlight={enable=true},
    indent={enable=true},
    rainbow={enable=true},
    endwise={enable=true},
})
vim.api.nvim_create_user_command('TSUpadte',function()
    require'nvim-treesitter.configs'.setup({
        ensure_installed={
            'python','lua','fish',
            'bash','vim',
            --
            'go','c','html','c_sharp',
            'java','javascript','css',
            'cpp','rust','typescript',
            'haskell','fennel','commonlisp',
            'llvm','tlaplus',
            --
            'vimdoc','org','markdown',
            'json','toml','hjson',
            'jsonc','norg','jsdoc',
            'json5','rst','todotxt',
            'markdown_inline',
            --
            'comment','regex','query',
        }})
    require'nvim-treesitter.install'.commands.TSUpdate['run']()
end,{})
local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

parser_config.nu = {
  install_info = {
    url = "https://github.com/nushell/tree-sitter-nu",
    files = { "src/parser.c" },
    branch = "main",
  },
  filetype = "nu",
}
