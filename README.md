# nvim-lua
This is my private neovim config.

## Special about this config
Here is a list of *somewhat* unique things about this config:
+ Uses features from the latest neovim development release
+ Ultra fast load times when **opening files**: 50ms
    + [NvChad](https://github.com/NvChad/nvchad) has 110ms when opening files
    + *Note*: on kitty 60ms (because of kitty integration)
+ No status column (no line numbers)
+ No snippet plugin (uses `vim.snippet`) (still has cmp)
+ [small.nvim](https://github.com/altermo/doune.nvim): my collection of plugins
+ No automatic LSP install
+ Treesitter queries:
    + In lua, conceal specific keywords
    + In hyprlang, inject bash highlights into shell code
+ Codeium as AI autocomplete
+ Auto sync terminal background with neovim background
