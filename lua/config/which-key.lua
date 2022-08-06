----init--
local function wip()
    return ':lua vim.notify"work in progress"\r'
end
require"which-key".setup{}
local spmaps={}
local wk=require("which-key")

----other
------file
spmaps.W={wip(),'sudosave'}
spmaps.q={':q\r','quit'}
spmaps.Q={':q!\r','QUIT!'}
spmaps.x={':qa\r','quitall'}
spmaps.X={':qa!\r','QUITALL!'}
------visual
spmaps['\r']={':set hls!\r','toggle-highlight'}
spmaps.C={':set guicursor=n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20\r','restore-cursor'}
------other
spmaps.r={':Ranger\r','ranger'}
spmaps['\t']={':edit #\r','edit-last'}
spmaps.S={':! "%"<Left><Left><Left><Left>','shell-file',silent=false}
spmaps.z={'zM100zo','close-all-folds-but-cursor'}
spmaps.Z={'zM','close-all-folds'}
spmaps.l={':ls\r','list-buffers'}
spmaps.o={':only\r','only-window'}
spmaps.d={':changes\r','changes',silent=false}
spmaps.M={':set ro virtualedit=all\r','read-only'}
spmaps.P={':py ','python',silent=false}
spmaps.v={':vsplit\r','vertical'}
spmaps.e={':split\r','horizontal'}
spmaps.n={':enew\r','enew'}
------hop
spmaps[' ']={':lua require"hop".hint_char1()\r','Hop'}
spmaps['<S- >']={':lua require"hop".hint_char1({multi_windows=true})\r','HopMW'}
------windwos
for i in ('0123456789'):gmatch('.') do
    spmaps[i]={':'..i..'wincmd w\r','window '..i}
end

----apps
spmaps.a={name='+apps'}
spmaps.a.w={':call execute("terminal curl \'wttr.in/?nQF&lang=es\' -s")|startinsert\r','weather'}
spmaps.a.t={':vsplit|term set a (mktemp);while :;cat "%"|trans "es:sv" -b>$a;clear;cat $a;end\r:wincmd p\r','async-tranlate'}
spmaps.a.e={':Emacs .\r','emacs'}
spmaps.a.k={':Kak .\r','kakoune'}
spmaps.a.d={':Dff\r','dff'}
spmaps.a.f={':Fish\r','fish-shell'}
spmaps.a.T={':FloatermToggle\r','terminal'}
spmaps.a.r={':RnvimrToggle\r','ranger'}

----otherc
spmaps.c={name='+otherc'}
spmaps.c.d={':cd %:p:h|pwd\r','cd-to-file'}
spmaps.c.T={':!ctags -R .\r','ctags'}
spmaps.c.f={name='+call-function'}
spmaps.c.f.n={':call v:lua.Norm()\r','set-arrows&mouse'}
spmaps.c.f.t={':call v:lua.TN()\r','ett/en'}
spmaps.c.c={':mod\r','redraw-screen'}
spmaps.c.P={':v/\\//d|%s/\\v^.{-}([a-zA-Z0-9._-]+\\/[a-zA-Z0-9._-]+).*/\\1/g\r','extraxt-plugs'}
spmaps.c.n={':tabe\r','new-tab'}
------treesitter
spmaps.c.t={name='+treesitter'}
spmaps.c.t.q={':TSCaptureUnderCursor\r','query1'}
spmaps.c.t.Q={':TSNodeUnderCursor\r','query2'}
spmaps.c.t.Q={':TSNodeUnderCursor\r','query2'}
spmaps.c.t.h={':lua require"tsht".nodes()\r','TSHT'}
spmaps.c.t.t={':doautocmd User autotag\r','autotag'}
------foldmethod
spmaps.c.F={name='+foldmethod'}
for k,v in pairs({m='manual',i='indent',e='expr',M='marker',S='syntex',d='diff'}) do
    spmaps.c.F[k]={':set foldmethod='..v..'\r',v}
end
------map
spmaps.c.m={name='+maps'}
spmaps.c.m.n={':nnoremap <C-v><CR> ','nmap-private',silent=false}
spmaps.c.m.v={':vnoremap <C-v><CR> ','vmap-private',silent=false}
------commentstring
spmaps.c.C={name='+commentstring'}
spmaps.c.C.h={':set commentstring=#%s','octothorpe-#%s'}
spmaps.c.C.l={':set commentstring=--%s','lines---%s'}
spmaps.c.C.s={':set commentstring=/*%s*/','slash-/*%s*/'}

----find
spmaps.f={name='+find'}
for k,v in pairs({c='colorscheme',f='find_files',t='treesitter',
    o='oldfiles',s={'live_grep_args'},b='buffers',
    u='builtin',H='harpoon marks',p={'project'},y={'yank_history'},
    n={'notify'},C={'changed_files'},T='tele_tabby list',B='vim_bookmarks all',
    r='refactoring refactors',P={'packer'},a='asynctasks all',R={'cder'},
    h={'howdoi'}
    }) do
    if type(v)=='string' then
        spmaps.f[k]={':Telescope '..v..' theme=ivy hidden=true\r',v}
    else
        spmaps.f[k]={':Telescope '..v[1]..' '..v[1]..' theme=ivy hidden=true\r',v[1]}
    end
end
spmaps.f.S={name='+small'}
for k,v in pairs({c='colorschemes',m='marks',b='buffers',t='tabpages'}) do
    spmaps.f.S[k]={':ReachOpen '..v..'\r',v}
end
spmaps.f.F={':Folds\r','folds'}

----files
spmaps.F={name='+files'}
spmaps.F.b={':!cp "%" "%".bak\r','backup'}
spmaps.F.r={':Rename <C-r>=expand("%")\r','rename',silent=false}
spmaps.F.c={':!echo "%:p"|xclip -selection c\r','copy-path'}
spmaps.F.p={':exe(\'vnew|call termopen("bat -pp \'.expand(\'<cfile>\').\'")\')\r','preview-under-cursor'}
spmaps.F.t={name='+set-type'}
spmaps.F.a={':tabe %\r','open alternetive'}
for k,v in pairs({p='python',t='txt',v='vim',f='fish',r='rust',l='lua',m='markdown',c='cpp',h='html'}) do
    spmaps.F.t[k]={':set filetype='..v..'\r',v}
end
spmaps.F.t.o={':set filetype=','other',silent=false}

----buffers
spmaps.b={name='+buffers'}
spmaps.b.c={':Bdelete!\r','buffer-close'}
spmaps.b.d={name='+delete-all'}
spmaps.b.d.h={':BDelete! hidden\r','hidden'}
spmaps.b.d.t={':BD! term\r','terminal'}

----packer
spmaps.p={name='packer'}
spmaps.p.s={':call luaeval("require \'plugins\'")|PackerSync\r','sync'}
spmaps.p.p={':call luaeval("require \'plugins\'")|PackerCompile\r','compile'}
spmaps.p.P={':call luaeval("require \'plugins\'")|PackerCompile profile=true\r','compile-profile'}
spmaps.p.i={':call luaeval("require \'plugins\'")|PackerInstall\r','install'}
spmaps.p.c={':call luaeval("require \'plugins\'")|PackerClean\r','clean'}

----spell/translate
spmaps.s={name='+spell'}
spmaps.T={name='+translate'}
spmaps.T.f={name='+from'}
spmaps.T.t={name='+to'}
for k,v in pairs({s='es',e='en',v='sv',n='nb'}) do
spmaps.s[k]={':set spelllang='..v..'\r','lang='..v,silent=false}
spmaps.T.f[k]={':let g:translator_source_lang="'..v..'"\r','lang='..v,silent=false}
spmaps.T.t[k]={':let g:translator_target_lang="'..v..'"\r','lang='..v,silent=false}
end
spmaps.T.s={':call v:lua.SwapLang()\r','swap_lang'}
spmaps.T.f.f={':let g:translator_source_lang=""<Left>','other',silent=false}
spmaps.T.t.t={':let g:translator_target_lang=""<Left>','other',silent=false}

----toggle
spmaps.t={name='+toggle'}
spmaps.t.e={':Neotree\r','explorer'}
spmaps.t.h={':TSToggle highlight\r','TS-highlight'}
spmaps.t.t={':Tagbar\r','tagbar'}
spmaps.t.u={':MundoToggle\r','undotree'}
spmaps.t.T={':TSPlaygroundToggle\r','TSPlayground'}
spmaps.t.F={':FocusToggle\r','focus'}
spmaps.t.m={':MinimapToggle\r','minimap'}
spmaps.t.c={':ColorizerToggle\r','colorizer'}
spmaps.t.o={':SymbolsOutline\r','outline'}
spmaps.t.k={function ()
    vim.notify('Note: this is still in development')
    require 'self_plugins.kakoune'
    end,'kakoune-mode'}
spmaps.t.M={wip(),'max-mode'}
spmaps.t.z={':ZenMode\r','zen-mode'}
spmaps.t.Z={':Twilight\r','twilight'}
spmaps.t.b={':SimpleBufferToggle\r','simple-bufer-toggle'}
spmaps.t.s={':lua require"shade".toggle()\r','shade'}
spmaps.t.C={':Centerpad\r','centerpad'}

----browser
spmaps.G={name='+browser--'}
for k,v in pairs({
    p='yi\':!setsid firefox https://www.github.com/<C-r>"\r',
    P='yi":!setsid firefox https://www.github.com/<C-r>"\r',
    ["π"]='0Y:!setsid firefox https://www.github.com/<C-r>"\r',
    c='yi\':!setsid firefox (curl -s "https://registry.npmjs.org/<C-r>""<Bar>jq -r ".homepage")\r',
    C='yi\':!setsid firefox "https://registry.npmjs.org/<C-r>""\r',
    w='lbyw:!setsid firefox "https://en.wikipedia.org/w/index.php?search=<C-r>""\r',
    q='lbyw:!setsid firefox "https://docs.qtile.org/en/latest/search.html?q=<C-r>"&check_keywords=yes&area=default"\r',
  }) do
  spmaps.G[k]={v..'\r',v}
end

----harpoon
spmaps.h={name='+harpoon'}
spmaps.h.a={':lua require"harpoon.mark".add_file()\r','add'}
spmaps.h.f={':lua require"harpoon.ui".toggle_quick_menu()\r','find'}
spmaps.h.n={':lua require"harpoon.ui".nav_next()\r','next'}
spmaps.h.p={':lua require"harpoon.ui".nav_next()\r','prev'}

----highlight
spmaps.H={name='+highlight'}
spmaps.H.r={':HSRmHighlight\r','remove'}
spmaps.H.R={':HSRmHighlight rm_all\r','remove-all'}
for i=1,9 do
    local n=tostring(i)
    spmaps.H[n]={':HSHighlight '..n..'\r','color '..n}
end

----multiline
spmaps.m={name='+multiline'}
spmaps.m.v={':v//d<Left><Left>','vdelete',silent=false}
spmaps.m.a={':% norm ','anorm',silent=false}
spmaps.m.j={':%s/\\n//<Left>','ajoin',silent=false}
spmaps.m.y={':% y\r','ayank'}
spmaps.m.d={':sort|w|w !uniq > %\r','remove duplicates'}

----lsp
spmaps.L={name='lsp'}
spmaps.L.q={':lua vim.diagnostic.setqflist()\r','quickfix'}

----goto
spmaps.g={name='+goto'}
spmaps.g.w={':lua require"hop".hint_words({ multi_windows = true })\r','word'}
spmaps.g.p={':Pounce\r','pounce'}
spmaps.g.r={':lua require"hop".hint_patterns()\r','regex'}
spmaps.g.l={':lua require"hop".hint_lines({ multi_windows = true })\r','line'}
spmaps.g.v={':lua require"hop".hint_vertical()\r','vertical'}
spmaps.g['2']={':lua require"hop".hint_char2({ multi_windows = true })\r','2 char'}
spmaps.g.f={':Lista\r','find-whole-file'}
spmaps.g.m={':lua require"mini.jump2d".start()\r','mini-jump'}
spmaps.g.s={':Smalls\r','smalls'}
------current-line
spmaps.g.c={name='+current line'}
spmaps.g.c.c={':lua require"hop".hint_char1({ current_line_only = true })\r','1 char'}
spmaps.g.c['2']={':lua require"hop".hint_char2({ current_line_only = true })\r','2 char'}
spmaps.g.c.w={':lua require"hop".hint_words({ current_line_only = true })\r','word'}
------aerojump
spmaps.g.a={name='+aerojump'}
spmaps.g.a.c={':Aerojump cursor bolt\r','cursor-bolt'}
spmaps.g.a.d={':Aerojump kbd default\r','default'}
spmaps.g.a.s={':Aerojump kbd space\r','space'}
spmaps.g.a.b={':Aerojump kbd bolt\r','bolt'}
spmaps.g.a.m={':Aerojump kbd milk\r','milk'}

----last--
wk.register({[' ']=spmaps})
-- vim:fen:
