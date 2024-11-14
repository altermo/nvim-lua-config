# nvim-lua
This is my private neovim config.

## Special about this config
Here is a list of *somewhat* unique things about this config:
+ 23-27ms startup time
+ No status column (no line numbers)
+ No autocompletion plugin (use nvim-builtin)
+ [small.nvim](https://github.com/altermo/doune.nvim): my collection of plugins
+ Treesitter queries:
    + In lua, conceal specific keywords
    + In hyprlang, inject bash highlights into shell code
+ Auto sync terminal background with neovim background
+ Builtin micro plugins:
    + Macro recording/replaying and editing
    + Yank ring
    + Autosave
