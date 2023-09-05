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
                if not (
                    (vim.fn.mode(true):find('no')) or
                    (vim.fn.mode(true):find('ni')) or
                    (vim.v.count~=0)
                ) then return end
                opts.jump_labels=false
            end
        },
        search={enabled=false}
    }
}
k.nno('s',function () require'flash'.jump() end)
k.xno('s',function () require'flash'.jump() end)
k.ono('r',function () require'flash'.remote() end)
k.ono('R',function ()
    local pos=vim.api.nvim_win_get_cursor(0)
    require'flash'.jump()
    vim.cmd.norm{'v',bang=true}
    require'flash'.jump()
    vim.cmd.norm{vim.v.operator}
    vim.api.nvim_win_set_cursor(0,pos)
end)
