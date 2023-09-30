if vim.fn.filereadable('/tmp/focus')==1 then vim.cmd.quit() end
---@diagnostic disable-next-line: undefined-field
if _G.NVWM then
    vim.opt.runtimepath:append('/home/user/.config/nvim/.other/_later/nvwm')
end
vim.loader.enable()

require'utils.empty'
require'options'
require'keymaps'
require'acommands'
require'autocmds'
require'other'
if not pcall(vim.cmd.colorscheme,'own') then
    vim.o.background='dark'
    if not pcall(vim.cmd.colorscheme,'tokyonight') then
        vim.cmd.colorscheme'retrobox'
    end
end
require'plugins'
