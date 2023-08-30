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
k.ono('r',function () require'flash'.remote() end)
k.xno('s',function () require'flash'.jump() end)
--TODO: better remote jump
