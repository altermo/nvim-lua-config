vim.opt.runtimepath:prepend('/home/user/.config/nvim/.other/small.nvim')
local setup=function (m) return m.setup() end
local key=require'utils.keymap'
for k,v in pairs{
    highlight_selected=setup,
    matchall=setup,
    tabline=setup,
    help_readme=setup,
    foldtext=function (m)
        m.conf.treesitter=true
        m.setup()
    end,
    kitty=setup,
    splitbuf=function (m)
        m.conf.options={
            ["'"]={action=vim.cmd.Shell,desc='shell'},
            r={desc='ranger',action=require'small.ranger'.run},
            b={desc='bufend',action=require'small.bufend'.run},
        }
    end,
    exchange=function (m)
        key.nno('cx',m.ex_oper)
        key.nno('cX',m.ex_eol)
        key.nno('cxx',m.ex_line)
        key.nno('cxc',m.ex_cancel)
        key.xno('X',m.ex_visual)
    end,
    builder=function (m)
        key.nno("“",m.termbuild)
        key.nno("<F6>",m.eval)
        key.nno("<F7>",m.termbuild)
        key.nno("<F8>",m.set)
        key.nno("<F9>",m.swap)
    end,
    labull=function (m) key.nno('o',m.run,{noremap=true,expr=true}) end,
    macro=function (m)
        key.nno('q',m.toggle_rec)
        key.nno('Q',m.play_rec)
        key.xno('Q',m.play_rec)
        key.nno('cq',m.edit_rec)
    end,
    nodeswap=function (m)
        key.nno('<a',m.swap_prev)
        key.nno('>a',m.swap_next)
        key.nno('=a',m.over)
    end,
    onelinecomment=function (m)
        key.xno('gc',m.run)
        key.nno('gc',m.run)
    end,
    reminder=function (m)
        m.conf.path='/home/user/.gtd/vault/gtd/Plans.md'
        m.setup()
    end,
    textobj=function (m)
        key.xno('im',m.wordcolumn,{expr=true})
        key.ono('im',m.charcolumn,{expr=true})
        key.xno('ik',m.wordrow,{expr=true})
        key.ono('ik',m.charrow,{expr=true})
    end,
    trans=function (m) key.nno('þ',m.cword) end,
    unimpaired=function (m)
        key.nno(']f',m.edit_next_file)
        key.nno('[f',m.edit_prev_file)
        key.nno('yo',m.set_opt)
    end,
    whint=function (m) key.ino(':',m.run,{expr=true}) end,
    ranger=function (m) m.conf.exit_if_single=true end,
    help_cword=function (m) key.nno('gh',m.run) end
} do v(require('small.'..k)) end
