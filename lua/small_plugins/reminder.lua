local M={}
M.path='/home/user/.gtd/vault/gtd/Mainin.md'
function M.parse_date(date)
    local reg='(%d%d%d%d)%-(%d%d)%-(%d%d) (%d%d):(%d%d)'
    local year,month,day,hour,minute=date:match(reg)
    return {year=year,month=month,day=day,hour=hour,minute=minute}
end
function M.get_times()
    local times={}
    local reg=[[^%s*%- %[ %]%s*([^(]*)%s%(@(%d%d%d%d%-%d%d%-%d%d %d%d:%d%d)%)]]
    for i in io.lines(M.path) do
        local doc,date=i:match(reg) --vim.fn.matchlist
        if doc then
            table.insert(times,{doc,M.parse_date(date)})
        end
    end
    return times
end
function M.is_overdo(date)
    local num=os.time(date)
    local t=os.time()
    return t>num
end
function M.fn(times,done)
    for k,v in ipairs(times) do
        if not done[k] and M.is_overdo(v[2]) then
            done[k]=true
            vim.defer_fn(function() vim.notify('Reminder in 10s') end,0)
            vim.defer_fn(function() vim.notify('Reminder in 3s') end,7000)
            vim.defer_fn(function() vim.notify('Reminder in 2s') end,8000)
            vim.defer_fn(function() vim.notify('Reminder in 1s') end,9000)
            vim.defer_fn(function ()
                vim.ui.select({'TO'..'DO:'..v[1]},{},function() end)
            end,10000)
        end
    end
end
function M.setup()
    local times=M.get_times()
    local done={}
    vim.fn.timer_start(30000,function()M.fn(times,done)end,{['repeat']=-1})
end
return M
