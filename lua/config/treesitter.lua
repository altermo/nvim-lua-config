require'nvim-treesitter.configs'.setup({
    highlight={enable=true},
    indent={enable=true},
    rainbow={enable=true},
    endwise={enable=true},
})
vim.api.nvim_create_user_command('TSUpadte',function()
    require'nvim-treesitter.configs'.setup({ensure_installed='all'})
    require'nvim-treesitter.install'.commands.TSUpdate['run']()
end,{})
---@source https://github.com/nushell/tree-sitter-nu/blob/main/installation/neovim.md
--{{
local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

parser_config.nu = {
  install_info = {
    url = "https://github.com/nushell/tree-sitter-nu",
    files = { "src/parser.c" },
    branch = "main",
  },
  filetype = "nu",
}
--}}
