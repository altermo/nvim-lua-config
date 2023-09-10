local M={}
function M.set_win()
    vim.wo.number=false
    vim.wo.relativenumber=false
    vim.wo.cursorline=false
    vim.wo.colorcolumn=''
    vim.wo.signcolumn='no'
end
function M.run()
    local saveopt=vim.o.equalalways
    local savewin=vim.api.nvim_get_current_win()
    vim.o.equalalways=false
    M.save={}
    for _,v in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
        vim.api.nvim_set_current_win(v)
        local width=vim.api.nvim_win_get_width(v)
        local s={win=v,width=width,nwidht=math.floor(width/10*8)}
        vim.cmd'leftabove vnew'
        s.left=vim.api.nvim_get_current_win()
        s.leftwidth=math.floor((s.width-s.nwidht)/2)
        M.set_win()
        vim.api.nvim_win_set_width(s.left,s.leftwidth)
        vim.cmd.wincmd'p'
        vim.cmd'rightbelow vnew'
        s.right=vim.api.nvim_get_current_win()
        s.rightwidth=vim.api.nvim_win_get_width(s.right)
        M.set_win()
        vim.api.nvim_win_set_width(v,s.nwidht)
        table.insert(M.save,s)
    end
    vim.api.nvim_set_current_win(savewin)
    vim.o.equalalways=saveopt
    M.act()
end
function M.derun()
    if not M.save then return end
    for _,v in ipairs(M.save) do
        vim.api.nvim_win_close(v.left,true)
        vim.api.nvim_win_close(v.right,true)
        vim.api.nvim_win_set_width(v.win,v.width)
    end
end
function M.act()
    for _,v in ipairs(M.save) do
        if not vim.api.nvim_win_is_valid(v.win) then
            vim.api.nvim_win_close(v.left,true)
            vim.api.nvim_win_close(v.right,true)
            M.save[_]=nil
            goto continue
        end
        v.width=vim.api.nvim_win_get_width(v.win)-v.nwidht+v.width-- -vim.api.nvim_win_get_width(v.left)+v.leftwidth
        vim.api.nvim_win_set_width(v.left,math.floor((v.width-v.nwidht)/2))
        vim.api.nvim_win_set_width(v.win,v.nwidht)
        ::continue::
    end
end
function M.setup()
    local g=vim.api.nvim_create_augroup('ZenAll',{})
    vim.api.nvim_create_autocmd('WinEnter',{callback=function ()
        local win=vim.api.nvim_get_current_win()
        for _,v in ipairs(M.save) do
            if v.left==win then
                vim.cmd.wincmd'h'
                vim.cmd.wincmd'h'
                vim.cmd.wincmd'h'
                vim.cmd.wincmd'l'
                return M.act()
            elseif v.right==win then
                vim.cmd.wincmd'l'
                vim.cmd.wincmd'l'
                vim.cmd.wincmd'l'
                vim.cmd.wincmd'h'
                return M.act()
            end
        end
    end,group=g})
end
if vim.dev then
    M.setup()
    M.run()
    --M.derun()
end
return M
