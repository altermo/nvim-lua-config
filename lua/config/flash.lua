local k=require'utils.keymap'
local flash=require'flash'
flash.setup{
    label={uppercase=false},
    modes={
        char={
            labels='0123456789,.+-',
            jump_labels=true,
            autohide=true,
            config=function(opts)
                if vim.fn.mode(true):find('n[oi]') or vim.v.count~=0 then
                    opts.jump_labels=false end
            end
        },
        search={enabled=false}
    }
}
k.nno('s',function () require'flash'.jump() end)
k.xno('s',function () require'flash'.jump() end)
k.ono('r',function ()
    local pos=vim.api.nvim_win_get_cursor(0)
    require'flash'.jump()
    vim.cmd.norm{'v',bang=true}
    require'flash'.jump()
    vim.cmd.norm{vim.v.operator}
    vim.api.nvim_win_set_cursor(0,pos)
end)
