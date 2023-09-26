local luapad=require'luapad'
luapad.setup{
    preview=false,
    on_init=function ()
        vim.api.nvim_buf_set_lines(vim.api.nvim_get_current_buf(),0,-1,false,{'---@diagnostic disable: undefined-global,unused-local',''})
        vim.cmd.norm{'G',bang=true}
    end,
}
