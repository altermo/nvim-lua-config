----init--
local function wip()
    vim.notify'work in progress'
end
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
local azz={}
require'which-key'.register({[' ']=format({

    ----other
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
    ['\r']={':set hls!\r:lua require("hlslens").start()\r','toggle-highlight'},
    z={'zM100zo','close-all-folds-but-cursor'},
    Z={'zM','close-all-folds'},
    ------buffer
    l={':ls\r','list-buffers'},
    o={':only\r','only-window'},
    v={':vsplit\r','vertical'},
    e={':split\r','horizontal'},
    n={':enew\r','enew'},
    d={':BDelete! this\r','buffer-close'},
    _=fmap(9,':%swincmd w\r','window %s'),
    ------move
    [' ']={':lua require"hop".hint_char1()\r','Hop'},
    ['<C- >']={':lua require"hop".hint_char1({multi_windows=true})\r','HopMW'},
    r={':Ranger\r','ranger'},

    ----apps
    a={name='+apps',
        T={':FloatermToggle\r','terminal'},
        d={':Dff\r','dff'},
        e={':silent !emacsclient %&\r','send-emacs'},
        f={':Fish\r','fish-shell'},
        r={':Ranger\r','ranger'},
        w={':call execute("terminal curl \'wttr.in/?nQF&lang=es\' -s")|startinsert\r','weather'},
        E={':edit .\r','edir'},
        t={':Telescope file_browser file_browser hidden=true\r','telescope file_browser'},
        m={':MarkdownPreview\r','markdown-preview'},
    },

    ----Tabe
    ['<tab>']={name='+tab',
        ['<tab>']={':tabe\r','new'},
        o={':tabe %\r','open'},
        n={':tabnext\r','next'},
        p={':tabprev\r','prev'},
        c={':tabclose\r','close'},
    },

    ----cother
    c={name='+otherc',
        d={':cd %:p:h|pwd\r','cd-to-file'},
        c={':mod\r','redraw-screen'},
        T={':lua require "mini.trailspace".trim()\r','trim spaces'},
        ------treesitter
        t={name='+treesitter',
            t={':doautocmd User autotag\r','autotag'},
            e={':hi link TSError NvimInternalError\r','highlight error'},
        },
        ------fold
        f={name='+fold',
            u={':FastFoldUpdate\r','fast-fold-update'},
            --------foldmethod
            m={name='+foldmethod',
                _=cmap({m='manual',i='indent',e='expr',M='marker',S='syntex',d='diff'},':set foldmethod=%s\r','%s'),
            },
            --------foldexpr
            e={name='+foldexpr',
                t={':set foldexpr=nvim_treesitter#foldexpr()\r','treesitter'},
                d={':set foldexpr=v:lua.Fold(v:lnum)\r','default'},
            },
            ---------foldlevel
            l={name='+foldlevel',
                _=fmap(9,':set foldlevel=%s\r','%s')
            },
        },
        ------g
        g={name='+fcreate',
            f={':lua require"self_plugins.fcreate".func()\r','function'},
            c={':lua require"self_plugins.fcreate".class()\r','class'},
        },
        ------indent
        i={name='+indent',
            _=fmap(9,':set sw=%s ts=%s sts=%s\r','set indent=%s'),
        },
    },

    ----files
    f={name='+files',
        s={':! "%"<Left><Left><Left><Left>','shell-file',silent=false},
        b={':!cp "%" "%".bak\r','backup'},
        r={':Rename <C-r>=expand("%")\r','rename',silent=false},
        c={':!echo "%:p"|xclip -selection c\r','copy-path'},
        p={':exe(\'vnew|call termopen("bat -pp \'.expand(\'<cfile>\').\'")\')\r','preview-under-cursor'},
        o={':exe("edit ".expand("<cfile>"))\r',"file.under-cursor"},
        T={':execute("edit ".tempname())\r','tempfile'},
        f={':Telescope find_files\r','find'},
        t={name='+set-type',
            o={':setf ','other',silent=false},
            _=cmap({p='python',t='txt',v='vim',s='fish',f='fennel',r='rust',l='lua',m='markdown',c='cpp',h='html',n="norg"},':set filetype=%s\r','%s')
        },
    },

    ----search
    s={name='+search',
        r={':ReachOpen colorschemes\r','reach-colorschemes'},
        F={':Folds\r','folds'},
        A={':Telescope\r','telescope'},
        _=(function ()
            local tbl={}
            for k,v in pairs({c='colorscheme',f='find_files',t='treesitter',
                o='oldfiles',s={'live_grep_args'},b='buffers', u='builtin',
                H='harpoon marks',p={'project'},y={'yank_history'},n={'notify'},
                C={'changed_files'},T='tele_tabby list',B='vim_bookmarks all',
                P={'packer'},a='asynctasks all',['?']={'howdoi'},w={'file_browser'},
                k='current_buffer_fuzzy_find',h='help_tags',K='symbols',
            }) do
                if type(v)=='string' then
                    tbl[k]={':Telescope '..v..' theme=ivy hidden=true\r',v}
                else
                    tbl[k]={':Telescope '..v[1]..' '..v[1]..' theme=ivy hidden=true\r',v[1]}
                end
            end
            return tbl
        end)()
    },

    ----buffers
    b={name='+buffers-delete',
        h={':BDelete! hidden\r','hidden'},
        t={':BDelete! glob=term://*\r','terminal'},
    },

    ----packer
    p={name='+packer',
        s={':call luaeval("require \'plugins\'")|PackerSync\r','sync'},
        p={':call luaeval("require \'plugins\'")|PackerCompile\r','compile'},
        P={':call luaeval("require \'plugins\'")|PackerCompile profile=true\r','compile-profile'},
        i={':call luaeval("require \'plugins\'")|PackerInstall\r','install'},
        c={':call luaeval("require \'plugins\'")|PackerClean\r','clean'},
        S={name='+special',
            f={':v/\\//d|%s/\\v^.{-}([a-zA-Z0-9._-]+\\/[a-zA-Z0-9._-]+).*/\\1/g\r','extraxt-plugs'},
        },
    },

    ----text
    y={name='+text',
        s={name='+spell',
            _=cmap(spell,':set spelllang=%s\r','lang=%s',{silent=false})
        },
        t={name='+translate',
            s={':call v:lua.SwapLang()\r','swap_lang'},
            A={':vsplit|term set a (mktemp);while :;cat "%"|trans "es:sv" -b>$a;clear;cat $a;end\r:wincmd p\r','async-tranlate'},
            f={name='+from',
                f={':let g:translator_source_lang=""<Left>','other',silent=false},
                _=cmap(spell,':let g:translator_source_lang="%s"\r','lang=%s',{silent=false})
            },
            t={name='+to',
                t={':let g:translator_target_lang=""<Left>','other',silent=false},
                _=cmap(spell,':let g:translator_target_lang="%s"\r','lang=%s',{silent=false})
            },
        },
    },

    ----toggle
    t={name='+toggle',
        T={':TSPlaygroundToggle\r','TSPlayground'},
        c={':ColorizerToggle\r','colorizer'},
        e={':Neotree\r','explorer'},
        h={':TSToggle highlight\r','TS-highlight'},
        m={':MinimapToggle\r','minimap'},
        o={':SymbolsOutline\r','outline'},
        t={':Tagbar\r','tagbar'},
        u={':MundoToggle\r','undotree'},
        H={':HexokinaseToggle\r','color-name-highlight'},
        C={function()
            local b=vim.fn.bufnr()
            if azz[b] then
                vim.api.nvim_del_autocmd(azz[b])
                azz[b]=nil
            else
                azz[b]=vim.api.nvim_create_autocmd('CursorMoved,CursorMovedI',{command='norm! zz',buffer=b})
                vim.cmd.norm {'zz',bang=true}
            end
        end,'centermouse'},
        z={name='+zen',
            t={':Twilight\r','twilight'},
            z={':ZenMode\r','zen-mode'},
            m={':TZFocus\r','max-mode'},
            p={':Peepsight\r','peepsight'},
            l={':Limelight!!\r','limelight'},
        },
    },

    ----browser
    G={name='+browser--',
        _=cmap({
            p='yi\':!setsid firefox https://www.github.com/<C-r>"\r',
            P='yi":!setsid firefox https://www.github.com/<C-r>"\r',
            ["π"]='0Y:!setsid firefox https://www.github.com/<C-r>"\r',
            w='lbyw:!setsid firefox "https://en.wikipedia.org/w/index.php?search=<C-r>""\r',
            q='lbyw:!setsid firefox "https://docs.qtile.org/en/latest/search.html?q=<C-r>"&check_keywords=yes&area=default"\r',
        },'%s\r','%s')
    },

    ----harpoon
    h={name='+harpoon',
        a={':lua require"harpoon.mark".add_file()\r','add'},
        f={':lua require"harpoon.ui".toggle_quick_menu()\r','find'},
        n={':lua require"harpoon.ui".nav_next()\r','next'},
        p={':lua require"harpoon.ui".nav_next()\r','prev'},
    },

    ----highlight
    H={name='+highlight',
        r={':HSRmHighlight\r','remove'},
        R={':HSRmHighlight rm_all\r','remove-all'},
        _=fmap(9,':HSHighlight %s\r','color %s')
    },

    ----lsp
    L={name='+lsp',
        q={':lua vim.diagnostic.setqflist()\r','quickfix'},
    },

    ----goto
    g={name='+goto',
        w={':lua require"hop".hint_words({ multi_windows = true })\r','word'},
        t={':lua require"tsht".nodes()\r','TSHT'},
        p={':Pounce\r','pounce'},
        r={':lua require"hop".hint_patterns()\r','regex'},
        l={':lua require"hop".hint_lines({ multi_windows = true })\r','line'},
        v={':lua require"hop".hint_vertical()\r','vertical'},
        ['2']={':lua require"hop".hint_char2({ multi_windows = true })\r','2 char'},
        f={':Lista\r','find-whole-file'},
        m={':lua require"mini.jump2d".start()\r','mini-jump'},
        s={':Smalls\r','smalls'},
        A={':lua require"hop".hint_anywhere()\r','anywhere'},
        ------current-line
        c={name='+current line',
            c={':lua require"hop".hint_char1({ current_line_only = true })\r','1 char'},
            ['2']={':lua require"hop".hint_char2({ current_line_only = true })\r','2 char'},
            w={':lua require"hop".hint_words({ current_line_only = true })\r','word'},
            A={':lua require"hop".hint_anywhere({ current_line_only = true })\r','anywhere'},
        },
        ------aerojump
        a={name='+aerojump',
            c={':Aerojump cursor bolt\r','cursor-bolt'},
            d={':Aerojump kbd default\r','default'},
            s={':Aerojump kbd space\r','space'},
            b={':Aerojump kbd bolt\r','bolt'},
            m={':Aerojump kbd milk\r','milk'},
        },
    },

    ----theme
    T={
        name='+UI',
        ['+']={function()
            vim.o.guifont=vim.o.guifont:gsub('%d+$','')..(tonumber(vim.o.guifont:gsub('.-(%d+)$','%1'),10)+1)
        end,'zoom in'}, --TODO
        ['-']={function()
            vim.o.guifont=vim.o.guifont:gsub('%d+$','')..(tonumber(vim.o.guifont:gsub('.-(%d+)$','%1'),10)-1)
        end,'zoom out'}, --TODO
        ['0']={function()
            vim.o.guifont=vim.o.guifont:gsub('%d+$','')..'11'
        end,'zoom reset'}, --TODO
        C={':set guicursor=a:ver1\r','hide-cursor'}, --TODO
        c={':set guicursor&\r','reset-cursor'},
        f={':set guifont=*\r','select-font'},
        ['8']={':call overlength#toggle()\r','toggle highlight past 80'},
        i={':IndentBlanklineToggle!\r','toggle highlight indent level'},
        w={':let b:minicursorword_disable=luaeval("not vim.b.minicursorword_disable")\r','toggle highlight cursor word'},
        n={':require"notify".dismiss()\r','dismiss notify'},
    }
})})
-- vim:fen:
