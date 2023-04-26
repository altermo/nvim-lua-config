local M={}
M.options={
    r={
        desc='ranger',
        action=function() vim.cmd.Ranger(vim.fn.expand('#')) end,
    },
    t={
        desc='terminal',
        action=vim.cmd.Fish,
    },
    n={
        desc='nothing',
        action=function() vim.cmd.edit('#') end,
    },
    q={
        desc='quit',
        action=vim.cmd.quit,
    }
}
function M.open(Iwin)
    local buf=vim.api.nvim_create_buf(false,true)
    vim.api.nvim_buf_set_option(buf,'bufhidden','wipe')
    local win=Iwin or vim.api.nvim_get_current_win()
    vim.api.nvim_win_set_buf(win,buf)
    for k,v in pairs(M.options) do
        vim.api.nvim_buf_set_lines(buf,0,0,false,{k..' : '..v.desc})
    end
    vim.cmd.redraw()
    local char=vim.fn.getcharstr()
    if M.options[char] then
        M.options[char].action()
    else
        vim.cmd.edit('#')
        vim.api.nvim_feedkeys(char,'m',true)
    end
end
function M.vsplit()
    vim.cmd.vsplit()
    M.open()
end
function M.split()
    vim.cmd.split()
    M.open()
end
return M
