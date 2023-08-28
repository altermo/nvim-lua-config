local k=require'utils.keymap'
local flash=require'flash'
flash.setup{
    labels='0123456789<,.+|-',
    modes={
        char={jump_labels=true},
        search={enabled=false}
    }
}
k.nno('s',function () require'flash'.jump() end)
k.ono('r',function () require'flash'.remote() end)
k.xno('s',function () require'flash'.jump() end)
