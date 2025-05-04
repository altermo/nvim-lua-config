vim.fn.timer_start(100,function() vim.fn.execute('silent! checktime') end,{['repeat']=-1})

local open=vim.ui.open
rawset(vim.ui,'open',function(path) return open((path:gsub('^([a-zA-Z0-9._-]+/[a-zA-Z0-9._-]+)$','https://github.com/%1'))) end)

function vim.lg(...)
    if vim.in_fast_event() then return vim.schedule_wrap(vim.lg)(...) end
    local d=debug.getinfo(2)
    return vim.fn.writefile(vim.fn.split(
        ':'..d.short_src..':'..d.currentline..':\n'..
        vim.inspect(#{...}>1 and {...} or ...),'\n'
    ),'/tmp/nlog','a')
end

require('vim._extui').enable{}
