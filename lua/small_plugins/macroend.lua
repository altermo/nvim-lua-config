local M={}
M.path=vim.fs.joinpath(vim.fn.stdpath('data'),'macroend.json')
function M._load_save()
    local fs=io.open(M.path)
    if not fs then return {old={}} end
    local jsondata=fs:read('a*')
    local tbl=vim.json.decode(jsondata)
    if not tbl.old then tbl.old={} end
    return tbl
end
function M._save_save(save)
    local jsondata=vim.json.encode(save)
    local fs=io.open(M.path,'w')
    if not fs then error() end
    fs:write(jsondata) fs:flush()
end
function M.load_save(fn)
    local save=M._load_save()
    local ret={fn(save)}
    M._save_save(save)
    return unpack(ret)
end
function M.backup(tbl,macro)
    if #tbl>10 then table.remove(tbl,1) end
    table.insert(tbl,macro)
end
function M.save_macro(macro,key)
    M.load_save(function (save)
        if save[key] then M.backup(save.old,macro) end
        save[key]={macro=macro,key=key}
    end)
end
function M.toggle_rec()
    if vim.fn.reg_recording()=='' then
        vim.cmd.normal{'qq',bang=true}
        vim.notify('started recording',vim.log.levels.INFO)
        return
    end
    local prev=vim.fn.getreg('q')
    vim.cmd.normal{'q',bang=true}
    local new=vim.fn.getreg('q') --[[@as string]]
    if new=='q' then
        vim.notify('empty macro, previous recoding is kept',vim.log.levels.INFO)
        vim.fn.setreg('q',prev)
        return
    end
    vim.fn.setreg('q',new:sub(1,-2))
    vim.notify('Recorded macro: '..vim.fn.keytrans(new:sub(1,-2)),vim.log.levels.INFO)
end
function M.get_macro(key)
    local macro
    M.load_save(function(save)
        if not save[key] then return end
        macro=save[key].macro
    end)
    return macro
end
function M.play_save(key)
    local save=vim.fn.getreg('q')
    local macro=M.get_macro(key)
    if not macro then vim.notify('macro ['..key..'] not set') return end
    vim.fn.setreg('q',macro)
    M.play_rec()
    vim.fn.setreg('q',save)
end
function M.play_rec()
    if vim.fn.reg_recording()~='' then
        vim.notify('Cant play macro while recoding, stoping recording',vim.log.levels.ERROR)
        local prev=vim.fn.getreg('q')
        vim.cmd.normal{'q',bang=true}
        vim.fn.setreg('q',prev)
        return
    end
    vim.cmd.normal{vim.v.count1..'@q',bang=true}
end
function M.edit_rec()
    local reg=vim.fn.getreg('q')
    ---@cast reg string
    vim.ui.input({
        prompt='>',
        default=vim.fn.keytrans(reg),
    },function (inp)
            if not inp or inp=='' then return end
            vim.fn.setreg('q',vim.keycode(inp))
        end)
end
function M.edit_save(key)
    if key=='' then return end
    M.load_save(function (save)
        if not save[key] then return end
        local macro=save[key]
        local bak=vim.fn.getreg('q')
        vim.fn.setreg('q',macro.macro)
        M.edit_rec()
        macro.macro=vim.fn.getreg('q')
        vim.fn.setreg('q',bak)
    end)
end
function M.save_rec(key)
    if key=='' then return end
    M.save_macro(vim.fn.getreg('q'),key)
end
function M.list()
    vim.cmd.vsplit()
    local buf=vim.api.nvim_create_buf(true,true)
    vim.api.nvim_buf_set_option(buf,'bufhidden','wipe')
    local win=vim.api.nvim_get_current_win()
    vim.api.nvim_win_set_buf(win,buf)
    M.load_save(function (save)
        for k,v in pairs(save) do
            if k~='old' then
                vim.api.nvim_buf_set_lines(buf,0,0,false,{k..' : '..v.macro})
            end
        end
    end)
end
function M.setup()
    vim.keymap.set('n','q',M.toggle_rec)
    vim.keymap.set('n','Q',M.play_rec)
    vim.keymap.set('x','Q',M.play_rec)
    vim.keymap.set('n','cq',M.edit_rec)
end
function M.run()
    local char=vim.fn.getcharstr()
    if char=='\t' then M.edit_save(vim.fn.getcharstr())
    elseif char=='\r' then M.save_rec(vim.fn.getcharstr())
    elseif char=='\x80kb' then M.list()
    elseif char~='' then M.play_save(char)
    end
end
return M
