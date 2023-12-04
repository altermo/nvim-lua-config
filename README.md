# nvim-lua
This is my private neovim config.

## Special about this config
Here is a list of things unique about this config:
+ Ultra fast load times when opening files: 50ms
    + [NvChad](https://github.com/NvChad/nvchad) has 110ms when opening files
    + *Note*: on kitty 85ms (because of kitty integration)
+ No status column (no line numbers)
+ No snippet plugin (uses `vim.snippet`) (still has cmp)
+ [small.nvim](https://github.com/altermo/small.nvim): my collection of private plugins
+ Uses [pckr.nvim](https://github.com/lewis6991/pckr.nvim) as package manager
+ Conceal specific keywords in lua into symbols
+ Nushell highlighting
+ Manual lsp install
+ Compact similar actions into one label in which-key (ex. (w)indow->number)
