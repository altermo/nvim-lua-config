require'nvim-treesitter.configs'.setup({ensure_installed={
    'python','lua','fish',
    'bash','vim',
    --
    'go','c','html',
    'java','javascript','css',
    'cpp','rust',
    --
    'help','org','markdown',
    'query','json','toml',
    'jsonc','norg'
},rainbow={enable=true},
highlight={enable=true},
refactor={ --TODO
smart_rename={enable=true,keymaps={smart_rename="gr"}},
navigation={enable=true,
keymaps={
    goto_definition = "gnd",
    list_definitions = "gnD",
    goto_next_usage = "<a-*>",
    goto_previous_usage = "<a-#>",
}}},
autotag={enable=true},
context_commentstring={enable=true},
pairs={enable=true,highlight_pair_events={'CursorMoved'}},
})
require'orgmode'.setup_ts_grammar()
