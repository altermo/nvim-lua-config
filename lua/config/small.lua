vim.opt.runtimepath:prepend('/home/user/.config/nvim/.other/small.nvim')
local set={}
local setup=function (m) return m.setup() end
set.highlight_selected=setup
set.matchall=setup
set.tabline=setup
function set.builder(m)
    --vim.keymap.set('n',"“",b.build)
    vim.keymap.set('n',"“",m.termbuild)
    vim.keymap.set('n',"‘",m.termbuild)
    --vim.keymap.set('n',"<F5>",b.build)
    vim.keymap.set('n',"<F6>",m.eval)
    vim.keymap.set('n',"<F7>",m.termbuild)
    vim.keymap.set('n',"<F8>",m.set)
    vim.keymap.set('n',"<F9>",m.swap)
end
function set.labull(m)
    vim.keymap.set('n','o',m.run,{noremap=true,expr=true})
end
function set.macro(m)
    vim.keymap.set('n','q',m.toggle_rec)
    vim.keymap.set('n','Q',m.play_rec)
    vim.keymap.set('x','Q',m.play_rec)
    vim.keymap.set('n','cq',m.edit_rec)
end
function set.nodeswap(m)
    vim.keymap.set('n','<a',function() m.swap_prev() end)
    vim.keymap.set('n','>a',function() m.swap_next() end)
    vim.keymap.set('n','=a',function() m.over() end)
end
function set.onelinecomment(m)
    vim.keymap.set('x','gc',m.run)
    vim.keymap.set('n','gc',m.run)
end
function set.reminder(m)
    m.conf.path='/home/user/.gtd/vault/gtd/Plans.md'
    m.setup()
end
function set.textobj(m)
    vim.keymap.set('x','im',m.wordcolumn,{expr=true})
    vim.keymap.set('o','im',m.charcolumn,{expr=true})
    vim.keymap.set('x','ik',m.wordrow,{expr=true})
    vim.keymap.set('o','ik',m.charrow,{expr=true})
end
function set.trans(m)
    vim.keymap.set('n','þ',m.cword)
end
function set.unimpaired(m)
    vim.keymap.set('n',']f',m.edit_next_file)
    vim.keymap.set('n','[f',m.edit_prev_file)
    vim.keymap.set('n','yo',m.set_opt)
end
function set.whint(m)
    vim.keymap.set('i',':',m.run,{expr=true})
end
for k,v in pairs(set) do
    v(require('small.'..k))
end
