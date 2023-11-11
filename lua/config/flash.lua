local k=require'utils.keymap'
local flash=require'flash'
flash.setup{
    label={uppercase=false},
    modes={
        search={enabled=false},
        char={
            labels='0123456789,.+-',
            jump_labels=true,
            autohide=true,
            config=function(opts)
                if vim.api.nvim_get_mode().mode:find('n[oi]') or
                    vim.v.count~=0 then opts.jump_labels=false end
            end
        }}}
k.nno('s',function () require'flash'.jump() end)
k.nno('<C-s>',function () require'flash'.treesitter() end)
k.xno('s',function () require'flash'.jump() end)
