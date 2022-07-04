----init--
local function wip()
    return ':echo "work in progress"\r'
end
require"which-key".setup{}
local spmaps={}
local wk=require("which-key")

----other
------file
spmaps.w={':up\r','smartsave'}
spmaps.W={wip(),'sudosave'}
spmaps.q={':q\r','quit'}
spmaps.Q={':qa\r','quitall'}
spmaps.x={':x\r','save&quit'}
------visual
spmaps['\r']={':set hls!\r','toggle-highlight'}
spmaps.C={':set guicursor=n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20\r','restore-cursor'}
------other
spmaps['\t']={':edit #\r','edit-last'}
spmaps.R={'m":Resource\r','reload-config'}
spmaps.S={':! "%"<Left><Left><Left><Left>','shell-file',silent=false}
spmaps.z={'zM100zo','close-all-folds-but-cursor'}
spmaps.Z={'zM','close-all-folds'}
spmaps.l={':ls\r','list-buffers'}
spmaps.o={':only\r','only-window'}
spmaps.d={':w !diff % -\r','diff-last-write'}
spmaps.M={':set ro virtualedit=all\r','read-only'}
spmaps.P={':py ','python',silent=false}
spmaps.k={':Telescope current_buffer_fuzzy_find\r','current-file-search'}
------hop
spmaps[' ']={':HopLine\r','SmartHop'}
spmaps['<S- >']={':HopLineMW\r','SmartHopMW'}

----apps
spmaps.a={name='+apps'}
spmaps.a.w={':call execute("terminal curl \'wttr.in/?nQF&lang=es\' -s")|startinsert\r','weather'}
spmaps.a.t={':vsplit|term set a (mktemp);while :;cat "%"|trans "es:sv" -b>$a;clear;cat $a;end\r:wincmd p\r','async-tranlate'}

----replace-vertical-horizontal
spmaps.r={name='+replace'}
spmaps.v={name='+vertical'}
spmaps.e={name='+horizontal'}
for k,v in pairs({t='Fish',n='enew',d='Dff',b='Telescope buffers'}) do
    spmaps.r[k]={':'..v..'\r',v}
    spmaps.v[k]={':vnew|'..v..'\r',v}
    spmaps.e[k]={':new|'..v..'\r',v}
end
spmaps.r.r={':RangerG "%"\r','ranger'}
spmaps.r.e={':execute "Emacs ".expand("%")\r','emacs'}
spmaps.r.k={':execute "Kak ".expand("%")\r','kakoune'}
--      .
spmaps.v.r={':vnew|RangerG "#"\r','ranger'}
spmaps.v.e={':vnew|Emacs .\r','emacs'}
spmaps.v.k={':vnew|execute "Kak ".expand("#")\r','kakoune'}
spmaps.v.v={':vsplit\r','vsplit'}
--      .
spmaps.e.r={':new|RangerG "#"\r','ranger'}
spmaps.e.e={':new|Emacs .\r','emacs'}
spmaps.e.k={':new|execute "Kak ".expand("#")\r','kakoune'}
spmaps.e.e={':split\r','split'}

----otherc
spmaps.c={name='+otherc'}
spmaps.c.d={':cd %:p:h|pwd\r','cd-to-file'}
spmaps.c.T={':!ctags -R .\r','ctags'}
spmaps.c.f={name='+call-function'}
spmaps.c.f.n={':call v:lua.Norm()\r','set-arrows&mouse'}
spmaps.c.f.t={':call v:lua.TN()\r','ett/en'}
spmaps.c.n={':CycleColorNext\r','color-next'}
spmaps.c.p={':CycleColorPrev\r','color-prev'}
spmaps.c.c={':mod\r','redraw-screen'}
spmaps.c.P={':v/\\//d|%s/\\v^.{-}([a-zA-Z0-9._-]+\\/[a-zA-Z0-9._-]+).*/\\1/g\r','extraxt-plugs'}
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

----find
spmaps.f={name='+find'}
for k,v in pairs({c='colorscheme',f='find_files',t='treesitter',
  o='oldfiles',s='live_grep',b='buffers',l='luasnip',B='builtin',
  h='harpoon marks',p='projects',L='software-licenses find',
  y='yank_history',n='notify'}) do
  spmaps.f[k]={':Telescope '..v..' theme=ivy hidden=true\r',v}
end

----files
spmaps.F={name='+files'}
spmaps.F.b={':!cp "%" "%".bak\r','backup'}
spmaps.F.r={':Rename ','rename',silent=false}
spmaps.F.c={':!echo "%:p"|xclip -selection c\r','copy-path'}
spmaps.F.p={':exe(\'vnew|call termopen("bat -pp \'.expand(\'<cfile>\').\'")\')\r','preview-under-cursor'}
spmaps.F.t={name='+set-type'}
for k,v in pairs({p='python',t='text',v='vim',f='fish',r='rust',l='lua'}) do
    spmaps.F.t[k]={':set filetype='..v..'\r',v}
end
spmaps.F.t.o={':set filetype=','other',silent=false}

----buffers
spmaps.b={name='+buffers'}
spmaps.b.c={':Bclose!\r','buffer-close'}
spmaps.b.d={name='+delete-all'}
spmaps.b.d.h={':Bdelete! hidden\r','hidden'}
spmaps.b.d.t={':BD! term\r','terminal'}

----packer
spmaps.p={name='packer'}
spmaps.p.s={':PackerSync\r','sync'}
spmaps.p.p={':PackerCompile\r','compile'}
spmaps.p.P={':PackerCompile profile=true\r','compile-profile'}
spmaps.p.i={':PackerInstall\r','install'}
spmaps.p.c={':PackerClean\r','clean'}

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
spmaps.t.e={':NvimTreeToggle\r','explorer'}
spmaps.t.h={':TSToggle highlight\r','TS-highlight'}
spmaps.t.t={':Tagbar\r','tagbar'}
spmaps.t.u={':MundoToggle\r','undotree'}
spmaps.t.T={':TSPlaygroundToggle\r','TSPlayground'}
spmaps.t.F={':FocusToggle\r','focus'}
spmaps.t.m={':MinimapToggle\r','minimap'}
spmaps.t.c={':ColorizerToggle\r','colorizer'}
spmaps.t.o={':SymbolsOutline\r','outline'}
spmaps.t.k={wip(),'kakoune-mode'}
spmaps.t.M={function ()
    if MaxGroop then
        vim.api.nvim_del_autocmd(MaxGroop)
        MaxGroop=nil
        vim.cmd('set winminheight& winminwidth&')
    else
        vim.o.winminwidth=0
        vim.o.winminheight=0
        MaxGroop=vim.api.nvim_create_autocmd('WinEnter',{command='execute("wincmd _")|wincmd |'})
        vim.cmd('wincmd _')
        vim.cmd('wincmd |')
    end
end,'max-mode'}
spmaps.t.z={':ZenMode\r','zen-mode'}
spmaps.t.Z={':Twilight\r','twilight'}
spmaps.t.b={':SimpleBufferToggle\r','simple-bufer-toggle'}

----browser
spmaps.g={name='+browser--'} -- TODO g is other> remap to G
for k,v in pairs({
    p='yi\':!setsid firefox https://www.github.com/<C-r>"\r',
    P='yi":!setsid firefox https://www.github.com/<C-r>"\r',
    ["π"]='0Y:!setsid firefox https://www.github.com/<C-r>"\r',
    c='yi\':!setsid firefox (curl -s "https://registry.npmjs.org/<C-r>""<Bar>jq -r ".homepage")\r',
    C='yi\':!setsid firefox "https://registry.npmjs.org/<C-r>""\r',
    w='lbyw:!setsid firefox "https://en.wikipedia.org/w/index.php?search=<C-r>""\r',
    q='lbyw:!setsid firefox "https://docs.qtile.org/en/latest/search.html?q=<C-r>"&check_keywords=yes&area=default"\r',
  }) do
  spmaps.g[k]={v..'\r',v}
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
spmaps.m.y={':% y\r','ayank'} --TODO

----lsp
spmaps.L={name='lsp'}
spmaps.L.q={':lua vim.diagnostic.setqflist()\r','quickfix'}

----last--
wk.register({[' ']=spmaps})
--TODO remake in format {a:{b:{c:{"a","b"}}}}
-- vim:fen:
