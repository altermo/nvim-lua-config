----init--
local function fmap(num,cmd,name)
    local tbl={}
    for i=1,num do
        tbl[tostring(i)]={cmd:format(tostring(i),tostring(i),tostring(i),tostring(i)),name:format(tostring(i))}
    end
    return tbl
end
local function cmap(inp,cmd,name,add)
    local tbl={}
    for k,v in pairs(inp) do
        if add then
            tbl[k]=vim.tbl_extend('error',{cmd:format(v),name:format(v)},add)
        else
            tbl[k]={cmd:format(v),name:format(v)}
        end
    end
    return tbl
end
local function format(tbl)
    for k,v in pairs(tbl) do
        if k=='_' then
            for k2,v2 in pairs(tbl._) do
                tbl[k2]=v2
            end
            tbl._=nil
        elseif type(v)=='table' then
            format(v)
        end
    end
    return tbl
end
local spell={s='es',e='en',v='sv',n='nb'}
local mouse_center={}
local saved_pos={}
require'which-key'.setup{plugins={presets={operators=false}}}
require'which-key'.register({[' ']=format({

    ----other
    b={require'small.bufend'.run,'bufend'},
    L={':Luapad\r','luapad'},
    C={require'small.chat'.run,'chat'},
    ['.']={'@:','run-prev-cmd'},
    ------file
    W={function ()
        local tmp=vim.fn.tempname()
        vim.fn.writefile(vim.fn.getline(1,vim.fn.line('$')),tmp)
        vim.o.modified=false
        vim.cmd.vnew()
        local buf=vim.fn.bufnr()
        vim.fn.termopen('cat '..tmp..'|sudo tee '..vim.fn.expand('#:p'),{
            on_exit=function (_,_,_)
                vim.cmd.bdelete({buf,bang=true})
            end
        })
        vim.cmd.startinsert()
    end,'sudosave'},
    q={':q\r','quit'},
    Q={':q!\r','QUIT!'},
    x={':qa\r','quitall'},
    X={':qa!\r','QUITALL!'},
    ------visual
    z={'zM100zo','close-all-folds-but-cursor'},
    Z={'zM','close-all-folds'},
    ------buffer
    o={':only\r','only-window'},
    v={require'small.splitbuf'.vsplit,'vertical'},
    e={require'small.splitbuf'.split,'horizontal'},
    n={':enew\r','enew'},
    d={':lua require"mini.bufremove".delete()\r','buffer-close'},
    ------move
    r={require'small.ranger'.run,'ranger'},
    ['>']={function()
        if not saved_pos[1] then
            vim.notify"stack empty"
            return
        end
        vim.api.nvim_set_current_buf(saved_pos[#saved_pos].buf)
        vim.api.nvim_win_set_cursor(0,saved_pos[#saved_pos].cur)
        table.remove(saved_pos,#saved_pos)
    end,'pop-pos'},
    ['<']={function()
        saved_pos[#saved_pos+1]={
            cur=vim.api.nvim_win_get_cursor(0),
            buf=vim.api.nvim_get_current_buf(),
        }
    end,'push-pos'},

    ----apps
    a={name='+apps',
        d={require'small.dff'.file_expl,'dff'},
        e={':silent !emacsclient %&\r','send-emacs'},
        f={':Shell\r','shell'},
        r={require'small.ranger'.run,'ranger'},
        w={':call execute("terminal curl \'wttr.in/?nQF\' -s")|startinsert\r','weather'},
        i={':edit .\r','edir'},
        t={':Telescope file_browser file_browser hidden=true\r','telescope file_browser'},
        m={':MarkdownPreview\r','markdown-preview'},
        N={function ()
            local ino=require'utils.keymap'.ino
            ino('<left>','<left>')
            ino('<right>','<right>')
            ino('<up>','<C-o>gk')
            ino('<down>','<C-o>gj')
            vim.o.mouse='a'
        end,'set arrow keys'},
        h={':Bracey\r','html-preview'},
    },

    ----Tabe
    ['<tab>']={name='+tab',
        n={':tabnext\r','next'},
        p={':tabprev\r','prev'},
        d={':tabclose\r','delete'},
        [' ']={':tabnext\r','next'},
        ['<']={':-tabmove\r','move-prev'},
        ['>']={':+tabmove\r','move-next'},
        ['<tab>']={':exe "tabe ".expand("%:p")\r<C-o>','new'},
        _=fmap(9,':tabnext %s\r','tab-%s'),
        ['0']={':tablast\r','tab-last'},
        s={function()
            vim.opt.showtabline=1
            vim.defer_fn(function () vim.opt.showtabline=0 end,1000)
        end,'show'},
        m={name='+move-buffer',
            _=fmap(9,':lua require"utils.lib".tabbufmove(%s)\r','tab-%s'),
            ['0']={function() require'utils.lib'.tabbufmove'$' end,'last'},
            ['<']={function() require'utils.lib'.tabbufmove'-' end,'prev'},
            ['>']={function() require'utils.lib'.tabbufmove'+' end,'next'},
        },
    },

    ----cother
    c={name='+otherc',
        D={function ()
            local tomorrow=os.time()+24*60*60
            return '/'..os.date('@%Y-%m-%d')..'\rlc5e'..os.date('%Y-%m-%d',tomorrow)..''
        end,'increment-date',expr=true},
        ['<C-d>']={function ()
            local yesterday=os.time()-24*60*60
            return '/'..os.date('@%Y-%m-%d',yesterday)..'\rlc5e'..os.date('%Y-%m-%d')..''
        end,'increment-date',expr=true},
        d={':cd %:p:h|pwd\r','cd-to-file'},
        l={':edit /tmp/nlog\r','open-nlog'},
        L={':ls\r','ls'},
        r={':source /tmp/session.vim','reload-last-session',silent=false},
        G={function()
            local dir=vim.fs.dirname(vim.fs.find('.git',{upward=true})[1])
            if dir then vim.cmd('cd '..dir) end
            vim.cmd.pwd()
        end,'cd-to-project-root'},
        c={':mod\r','redraw-screen'},
        T={':lua require "mini.trailspace".trim()\r','trim spaces'},
        ------treesitter
        t={name='+treesitter',
            e={':hi link TSError NvimInternalError\r','highlight error'},
            f={':set foldexpr=v:lua.vim.treesitter.foldexpr()\r','set-foldexpr'},
        },
        ------fold
        f={name='+fold',
            --------foldmethod
            m={name='+foldmethod',
                _=cmap({m='manual',i='indent',e='expr',M='marker',S='syntex',d='diff'},':set foldmethod=%s\r','%s'),
            },
            --------foldexpr
            e={name='+foldexpr',
                t={':set foldexpr=v:lua.vim.treesitter.foldexpr()\r','treesitter'},
                d={':set foldexpr=v:lua.Fold(v:lnum)\r','default'},
            },
            ---------foldlevel
            l={name='+foldlevel',
                _=fmap(9,':set foldlevel=%s\r','%s')
            },
        },
        ------indent
        i={name='+indent',
            _=fmap(9,':set sw=%s ts=%s sts=%s\r','set indent=%s'),
        },
        ------git
        g={':DiffviewOpen\r','git-diff'},
    },

    ----files
    f={name='+files',
        b={':!cp "%" "%".bak\r','backup'},
        r={':Rename\r','rename',silent=false},
        d={':Duplicate\r','duplicate'},
        C={':!echo "%:p"|xsel -ib\r','copy-path'},
        T={':execute("edit ".tempname())\r','tempfile'},
        f={':Telescope find_files\r','find'},
        t={name='+set-type',
            o={':setf ','other',silent=false},
            _=cmap({p='python',t='txt',v='vim',s='fish',f='fennel',r='rust',l='lua',m='markdown',c='c',h='html',n="norg"},':set filetype=%s\r','%s')
        },
    },

    ----search
    s={name='+search',
        a={':Telescope\r','telescope'},
        q={':Telescope colorscheme enable_preview=true\r','preview-colorscheme'},
        F={require'small.foldselect'.run,'fold'},
        P={require'small.plugin_search'.run,'search-plugins'},
        _=(function ()
            local tbl={}
            for k,v in pairs({c='colorscheme',f='find_files',t='treesitter',
                o='oldfiles',s={'live_grep_args'},b='buffers', u={'undo'},
                p={'project'},y={'yank_history'},n={'notify'},
                T='telescope-tabs list_tabs',
                w={'file_browser'},m={'media_files'},
                h='help_tags',k='symbols',
            }) do
                if type(v)=='string' then
                    tbl[k]={':Telescope '..v..' theme=ivy hidden=true\r',v}
                else
                    tbl[k]={':Telescope '..v[1]..' '..v[1]..' theme=ivy hidden=true\r',v[1]}
                end
            end
            return tbl
        end)(),
        g={name='+git',
            s={':Telescope git_status\r','status'},
            c={':Telescope git_commits\r','commits'},
            b={':Telescope git_branches\r','branches'},
        },
        r={name='+replace',
            s={function() require("ssr").open() end,'structural'},
            l={':IncRename <C-r>=expand("<cword>")\r','lsp',silent=false},
            p={':Pyro/gr\r','pyro'},
            r={':Spectre\r','spectre'},
            w={':%s/\\<<C-r>=expand("<cword>")\r\\>//<Left>','word',silent=false},
        }
    },

    ----packer
    p={name='+packer',
        i={':Pckr install\r','install'},
        c={':Pckr clean\r','clean'},
        u={':Pckr update\r','update'},
        S={name='+special',
            f={':v/\\//d|%s/\\v^.{-}([a-zA-Z0-9._-]+\\/[a-zA-Z0-9._-]+).*/\\1/g\r','extraxt-plugs'},
        },
    },

    ----text
    y={name='+text',
        T={':Pantran\r','translate-window'},
        S={function ()
            local t=require'small.trans'
            t.from,t.to=t.to,t.from
            vim.notify(('%s to %s'):format(t.from,t.to))
        end,'translate-swap'},
        f={name='+translate-from',
            f={':lua require"small.trans".from=""<Left>','other',silent=false},
            _=cmap(spell,':lua require"small.trans".from="%s"\r','lang=%s',{silent=false})
        },
        t={name='+translate-to',
            t={':lua require"small.trans".to=""<Left>','other',silent=false},
            _=cmap(spell,':lua require"small.trans".to="%s"\r','lang=%s',{silent=false})
        },
        s={name='+spell',
            _=cmap(spell,':set spelllang=%s\r','lang=%s',{silent=false})
        },
        g={name='+grammar',
            w={':Wordy weak\r','wordy on'},
            W={':NoWordy\r','wordy off'},
            d={':ToggleDitto\r','ditto'},
        },
    },

    ----toggle
    t={name='+toggle',
        ['\r']={':set hls!\r','highlight'},
        T={':InspectTree\r','TSPlayground'},
        h={':TSToggle highlight\r','TS-highlight'},
        m={':CodeWindow\r','minimap'},
        u={':MundoToggle\r','undotree'},
        c={':HexokinaseToggle\r','color-name-highlight'},
        a={':TableModeToggle\r','table-mode'},
        C={function()
            local buf=vim.fn.bufnr() --[[@as number]]
            if mouse_center[buf] then
                vim.api.nvim_del_autocmd(mouse_center[buf])
                mouse_center[buf]=nil
            else
                mouse_center[buf]=vim.api.nvim_create_autocmd('CursorMoved,CursorMovedI',{command='norm! zz',buffer=buf})
                vim.cmd.norm {'zz',bang=true}
            end
        end,'centermouse'},
        z={name='+zen',
            t={':Twilight\r','twilight'},
            z={require'small.zen'.run,'zen'},
            m={':lua require "mini.misc".zoom(0,{})\r','max-mode'},
        },
    },

    -----browser
    G={name='+browser--',
        _=cmap({
            p='yi\':!setsid firefox https://www.github.com/<C-r>"\r',
            P=':!setsid firefox https://www.github.com/<C-r>"\r',
        },'%s\r','%s')
    },

    ----lsp
    l={name='+lsp',
        [' ']={':LspStart\r','start-lsp'},
        q={':lua vim.diagnostic.setqflist()\r','list-diagnostics'},
        r={':lua vim.lsp.buf.references()\r','references'},
        R={':Telescope lsp_references\r','search-references'},
        h={':lua vim.lsp.buf.hover()\r','hover'},
        f={':lua vim.lsp.buf.format()\r','format'},
        c={':lua vim.lsp.buf.code_action()\r','code-action'},
        i={':lua vim.lsp.inlay_hint(0)\r','toggle-inlay-hint'},
        I={':LspInfo\r','info'},
        s={':LspStop\r','stop'},
    },

    ----hop
    h={name='+hop',
        t={'<cmd>lua require"flash".treesitter()\r','tree'},
        f={':Telescope current_buffer_fuzzy_find\r','find-whole-file'},
        h={'<cmd>lua require"flash".jump()\r','1 char'},
        l={'<cmd>lua require("flash").jump({search={mode="search",max_length=0},label={after={0,0}},pattern="^"})\r','line'},
    },

    --window
    w={
        name='+window',
        v={':vsplit\r','vsplit'},
        e={':split\r','split'},
        c={':close\r','close'},
        ['\t']={':wincmd w\r','next'},
        _=(function ()
            local ret=fmap(9,':%swincmd w\r','window %s')
            for k,v in pairs{
                h={'<','decrease width','left'},
                j={'+','increase height','down'},
                k={'-','decrease height','up'},
                l={'>','decrease width','right'},
            } do
                ret[k]={':wincmd '..k..'\r',k}
                ret[k:upper()]={':wincmd '..v[1]..'\r',v[2]}
                ret['<C-'..k..'>']={':WinShift '..v[3]..'\r','move '..v[3]}
            end
            return ret
        end)(),
        s={function()
            vim.notify('work in progress')
        end,'swap'},
        [' ']={function()
            local win=require('window-picker').pick_window()
            if not win then return end
            vim.api.nvim_set_current_win(win)
        end,'hop'},
    },

    ----theme
    T={
        name='+UI',
        ['+']={function()
            vim.o.guifont=vim.fn.substitute(vim.o.guifont,[[\vh(\d+)]],'\\="h".(submatch(1)+1)','')
        end,'zoom in'},
        ['-']={function()
            vim.o.guifont=vim.fn.substitute(vim.o.guifont,[[\vh(\d+)]],'\\="h".(submatch(1)-1)','')
        end,'zoom out'},
        ['0']={function()
            vim.o.guifont=vim.fn.substitute(vim.o.guifont,[[\vh(\d+)]],'h11','')
        end,'zoom reset'},
        C={function ()
            vim.cmd.hi('Cursor blend=100')
            vim.o.guicursor='a:Cursor/lCursor,a:ver1'
        end,'hide-cursor'},
        c={':set guicursor&\r','reset-cursor'},
        f={':set guifont=*\r','select-font'},
        i={':IBLToggle\r','disable highlight indent level'},
        n={':lua require"notify".dismiss({pending=true,silent=true})\r','dismiss notify'},
        m={':ToggleMatchAll\r','toggle matchall'},
    },
})})
-- vim:fen:
