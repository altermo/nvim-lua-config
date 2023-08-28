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
local azz={}
local pos
require'which-key'.register({[' ']=format({

    ----other
    b={require'small_plugins.bookend'.run,'bookend'},
    L={':Luapad\r','luapad'},
    C={require'small_plugins.chat'.run,'chat'},
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
    v={":lua require'small_plugins.splitbuf'.vsplit()\r",'vertical'},
    e={":lua require'small_plugins.splitbuf'.split()\r",'horizontal'},
    n={':enew\r','enew'},
    d={':BDelete! this\r','buffer-close'},
    _=fmap(9,':%swincmd w\r','window %s'),
    ------move
    r={':Ranger\r','ranger'},
    ['<']={function()
        if not pos then return end
        vim.api.nvim_win_set_cursor(0,pos)
    end,'load'},
    ['>']={function()
        pos=vim.api.nvim_win_get_cursor(0)
    end,'save'},

    ----apps
    a={name='+apps',
        T={':FloatermToggle\r','terminal'},
        d={':Dff\r','dff'},
        e={':silent !emacsclient %&\r','send-emacs'},
        f={':Shell\r','shell'},
        r={':Ranger\r','ranger'},
        w={':call execute("terminal curl \'wttr.in/?nQF&lang=es\' -s")|startinsert\r','weather'},
        E={':edit .\r','edir'},
        t={':Telescope file_browser file_browser hidden=true\r','telescope file_browser'},
        m={':MarkdownPreview\r','markdown-preview'},
        c={':Calendar\r','calendar'},
        N={function ()
            local ino=require'utils.keymap'.ino
            ino('<left>','<left>')
            ino('<right>','<right>')
            ino('<up>','<C-o>gk')
            ino('<down>','<C-o>gj')
            vim.o.mouse='a'
        end,'set arrow keys'}
    },

    ----Tabe
    ['<tab>']={name='+tab',
        n={':tabnext\r','next'},
        p={':tabprev\r','prev'},
        d={':tabclose\r','delete'},
        [' ']={':tabnext\r','next'},
        ['<']={':-tabmove\r','move-prev'},
        ['>']={':+tabmove\r','move-next'},
        ['<tab>']={':exe "tabe ".expand("%:p")\r','new'},
        _=fmap(9,':tabnext %s\r','tab-%s'),
        ['0']={':tablast\r','tab-last'},
        s={function()
            vim.opt.showtabline=1
            vim.defer_fn(function ()
                vim.opt.showtabline=0
            end,1000)
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
        r={':source /tmp/session.vim','reload-last-session'},
        G={function()
            local dir=vim.fs.dirname(vim.fs.find('.git',{upward=true})[1])
            if dir then vim.cmd('cd '..dir) end
            vim.cmd.pwd()
        end,'cd-to-project-root'},
        c={':mod\r','redraw-screen'},
        T={':lua require "mini.trailspace".trim()\r','trim spaces'},
        ------treesitter
        t={name='+treesitter',
            t={':doautocmd User autotag\r','autotag'},
            e={':hi link TSError NvimInternalError\r','highlight error'},
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
        s={':! "%"<Left><Left><Left><Left>','shell-file',silent=false},
        b={':!cp "%" "%".bak\r','backup'},
        r={require'genghis'.renameFile,'rename',silent=false},
        d={require'genghis'.duplicateFile,'duplicate'},
        C={':!echo "%:p"|xsel -ib\r','copy-path'},
        --p={':exe(\'vnew|call termopen("bat -pp \'.expand(\'<cfile>\').\'")\')\r','preview-under-cursor'},
        T={':execute("edit ".tempname())\r','tempfile'},
        f={':Telescope find_files\r','find'},
        t={name='+set-type',
            o={':setf ','other',silent=false},
            _=cmap({p='python',t='txt',v='vim',s='fish',f='fennel',r='rust',l='lua',m='markdown',c='cpp',h='html',n="norg"},':set filetype=%s\r','%s')
        },
    },

    ----search
    s={name='+search',
        F={':Folds\r','folds'},
        a={':Telescope\r','telescope'},
        q={':Telescope colorscheme enable_preview=true\r','preview-colorscheme'},
        _=(function ()
            local tbl={}
            for k,v in pairs({c='colorscheme',f='find_files',t='treesitter',
                o='oldfiles',s={'live_grep_args'},b='buffers', u={'undo'},
                p={'project'},y={'yank_history'},n={'notify'},
                T='telescope-tabs list_tabs',
                w={'file_browser'},
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
            s={require("ssr").open,'structural'},
            l={':IncRename <C-r>=expand("<cword>")\r','lsp',silent=false},
            p={':Pyro/gr\r','pyro'},
            r={':lua require("spectre").toggle()\r','specter'},
            w={':%s/\\<<C-r>=expand("<cword>")\r\\>//<Left>','word',silent=false},
            m={':MurenToggle\r','mutli'},
        }
    },

    ----buffer-delete
    B={name='+buffers-delete',
        h={':BDelete! hidden\r','hidden'},
        t={':BDelete! glob=term://*\r','terminal'},
    },

    ----packer
    p={name='+packer',
        s={':lua vim.req("plugins") vim.cmd"PackerSync"\r','sync'},
        p={':lua vim.req("plugins") vim.cmd"PackerCompile"\r','compile'},
        P={':lua vim.req("plugins") vim.cmd"PackerCompile" profile=true\r','compile-profile'},
        i={':lua vim.req("plugins") vim.cmd"PackerInstall"\r','install'},
        c={':lua vim.req("plugins") vim.cmd"PackerClean"\r','clean'},
        S={name='+special',
            f={':v/\\//d|%s/\\v^.{-}([a-zA-Z0-9._-]+\\/[a-zA-Z0-9._-]+).*/\\1/g\r','extraxt-plugs'},
        },
    },

    ----text
    y={name='+text',
        S={':call v:lua.SwapLang()\r','swap-lang'},
        T={':Pantran\r','translate-window'},
        f={name='+translate-from',
            f={':let g:translator_source_lang=""<Left>','other',silent=false},
            _=cmap(spell,':let g:translator_source_lang="%s"\r','lang=%s',{silent=false})
        },
        s={name='+spell',
            _=cmap(spell,':set spelllang=%s\r','lang=%s',{silent=false})
        },
        g={name='+grammar',
            w={':Wordy weak\r','wordy on'},
            W={':NoWordy\r','wordy off'},
            d={':ToggleDitto\r','ditto'},
            g={':LspStart Grammarly\r','grammar'},
            s={':LspStop Grammarly\r','grammar-stop'},
        },
        t={name='+translate-to',
            t={':let g:translator_target_lang=""<Left>','other',silent=false},
            _=cmap(spell,':let g:translator_target_lang="%s"\r','lang=%s',{silent=false})
        },
    },

    ----toggle
    t={name='+toggle',
        ['\r']={':set hls!\r','highlight'},
        T={':InspectTree\r','TSPlayground'},
        h={':TSToggle highlight\r','TS-highlight'},
        m={':CodeWindow\r','minimap'},
        t={':Tagbar\r','tagbar'},
        u={':MundoToggle\r','undotree'},
        c={':HexokinaseToggle\r','color-name-highlight'},
        a={':TableModeToggle\r','table-mode'},
        C={function()
            local b=vim.fn.bufnr() --[[@as number]]
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
            z={require'small_plugins.zen'.run,'zen'},
            m={':lua require "mini.misc".zoom(0,{})\r','max-mode'},
        },
    },

    -----browser
    G={name='+browser--',
        _=cmap({
            p='yi\':!setsid firefox https://www.github.com/<C-r>"\r',
            P=':!setsid firefox https://www.github.com/<C-r>"\r',
            w='lbyw:!setsid firefox "https://en.wikipedia.org/w/index.php?search=<C-r>""\r',
            q='lbyw:!setsid firefox "https://docs.qtile.org/en/latest/search.html?q=<C-r>"&check_keywords=yes&area=default"\r',
        },'%s\r','%s')
    },

    ----lsp
    l={name='+lsp',
        [' ']={':LspStart\r','start-lsp'},
        q={':lua vim.diagnostic.setqflist()\r','list-diagnostics'},
        r={':lua vim.lsp.buf.references()\r','references'},
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
        f={':Lista\r','find-whole-file'},
        m={':lua require"mini.jump2d".start()\r','mini-jump'},
        h={'<cmd>lua require"flash".jump()\r','1 char'},
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
        i={':IndentBlanklineToggle!\r','toggle highlight indent level'},
        w={':let b:minicursorword_disable=luaeval("not vim.b.minicursorword_disable")\r','toggle highlight cursor word'},
        n={':lua require"notify".dismiss({pending=true,silent=true})\r','dismiss notify'},
        r={':TSToggle rainbow\r','toggle rainbow'},
        [' ']={':lua require "mini.trailspace".unhighlight()\r','unhighlight spaces'},
        ['<c- >']={':lua require "mini.trailspace".highlight()\r','highlight spaces'},
        ['<C-t>']={':let g:neovide_transparency=1\r','no-transparency'},
        t={':let g:neovide_transparency=0.9\r','transparency'}
    },

    ----refactoring
    R={
        name='+refactor',
        f={':Refactor extract ','extract',silent=false},
        i={':Refactor inline_var ','inline-var',silent=false},
    },

    ----macro
    m={require'small_plugins.macroend'.run,'macro'},
})})
-- vim:fen:
