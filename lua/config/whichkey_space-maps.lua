----init--
local function map(kind,key,maps,opts)
  vim.keymap.set(kind,' '..key,maps,opts)
end
local function nno(key,maps)
  map('n',key,maps,{noremap=true,silent=true})
end
local function lnno(key,maps)
  map('n',key,maps,{noremap=true})
end
local spmaps={}
local wk=require("which-key")
local function wip()
    return ':echo "work in progress"\r'
end

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
spmaps.z={':mod\r','redraw-screen'}
------other
spmaps['\t']={':edit #\r','edit-last'}
spmaps.R={'m":Resource\r','reload-config'}
lnno('S',':! "%"<Left><Left><Left><Left>') spmaps.S='shell-file'
spmaps.Z={'zM','close-all-folds'}
spmaps.l={':ls\r','list-buffers'}
spmaps.o={':only\r','only-window'}
spmaps.d={':w !diff % -\r','diff-last-write'}
spmaps.M={':set ro virtualedit=all\r','read-only'}
lnno('P',':py ') spmaps.P='python'
spmaps.k={':Telescope current_buffer_fuzzy_find\r','current-file-search'}
------hop
spmaps.h={':HopLine\r','SmartHop'}
spmaps.H={':HopLineMW\r','SmartHopMW'}

----apps
spmaps.a={name='+apps'}
spmaps.a.w={':call execute("terminal curl \'wttr.in/?nQF&lang=es\' -s")|startinsert\r','weather'}
spmaps.a.t={':vsplit|term set a (mktemp);while :;cat "%"|trans "es:sv" -b>$a;clear;cat $a;end\r:wincmd p\r','async-tranlate'}

----otherm
spmaps.m={name='+otherm'}
spmaps.m['\r']={':marks\r','list-marks'}
lnno('mn',':nnoremap <C-v><CR> ') spmaps.m.n='nmap-private'
lnno('mv',':vnoremap <C-v><CR> ') spmaps.m.v='vmap-private'

----replace-vertical-horizontal
spmaps.r={name='+replace'}
spmaps.v={name='+vertical'}
spmaps.e={name='+horizontal'}
for k,v in pairs({t='Fish',n='enew',d='Dashboard',b='Telescope buffers'}) do
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
spmaps.c.t={':!ctags -R .\r','ctags'}
spmaps.c.f={name='+call-function'}
spmaps.c.f.n={':call v:lua.Norm()\r','set-arrows&mouse'}
spmaps.c.f.s={':call v:lua.SW()\r','sv-abbrevs'}
spmaps.c.n={':CycleColorNext\r','color-next'}
spmaps.c.p={':CycleColorPrev\r','color-prev'}
------treesitter
spmaps.c.T={name='+treesitter'}
spmaps.c.T.q={':TSCaptureUnderCursor\r','query1'}
spmaps.c.T.Q={':TSNodeUnderCursor\r','query2'}

----find
spmaps.f={name='+find'}
for k,v in pairs({c='colorscheme',f='find_files',t='treesitter',
  h='oldfiles',s='live_grep',b='buffers',l='luasnip',F='file_browser'}) do
  spmaps.f[k]={':Telescope '..v..' theme=ivy hidden=true\r',v}
end

----files
spmaps.F={name='+files'}
spmaps.F.b={':!cp "%" "%".bak\r','backup'}
lnno('Fr',':Rename ') spmaps.F.r='rename'
spmaps.F.c={':!echo "%:p"|xclip -selection c\r','copy-path'}
spmaps.F.p={':exe(\'vnew|call termopen("bat -pp \'.expand(\'<cfile>\').\'")\')\r','preview-under-cursor'}
spmaps.F.t={name='+set-type'}
for k,v in pairs({p='python',t='text',v='vim',f='fish',r='rust',l='lua'}) do
    spmaps.F.t[k]={':set filetype='..v..'\r',v}
end
lnno('Fto',':set filetype=') spmaps.F.t.o='other'

----buffers
spmaps.b={name='+buffers'}
spmaps.b.c={':Bclose!\r','buffer-close'}
spmaps.b.d={name='+delete-all'}
spmaps.b.d.h={':Bdelete! hidden\r','hidden'}
spmaps.b.d.t={':BD! term\r','terminal'}

----packer
spmaps.p={':PackerSync\r','sync'}

----spell/translate
spmaps.s={name='+spell'}
spmaps.T={name='+translate'}
spmaps.T.f={name='+from'}
spmaps.T.t={name='+to'}
for k,v in pairs({e='es',n='en',v='sv',b='nb'}) do
    lnno('s'..k,':set spelllang='..v..'\r') spmaps.s[k]='lang='..v
    spmaps.T.f[k]={':let g:translator_source_lang="'..v..'"\r',v}
    spmaps.T.t[k]={':let g:translator_target_lang="'..v..'"\r',v}
end
spmaps.s.s={':call v:lua.Toggle("spell")\r','toggle'}
spmaps.T.s={':call v:lua.SwapLang()\r','swap_lang'}
lnno('Tff',':let g:translator_source_lang=""<Left>') spmaps.T.f.f='other'
lnno('Ttt',':let g:translator_target_lang=""<Left>') spmaps.T.t.t='other'

----toggle
spmaps.t={name='+toggle'}
spmaps.t.e={':NvimTreeToggle\r','explorer'}
spmaps.t.h={':TSToggle highlight\r','TS-highlight'}
spmaps.t.t={':Tagbar\r','tagbar'}
spmaps.t.u={':UndotreeToggle\r','undotree'}
spmaps.t.f={':call v:lua.Toggle("foldenable")\r','fold'}
spmaps.t.T={':TSPlaygroundToggle\r','TSPlayground'}
spmaps.t.F={':FocusToggle\r','focus'}
spmaps.t.m={':MinimapToggle\r','minimap'}
spmaps.t.c={':ColorizerToggle\r','colorizer'}
spmaps.t.k={wip(),'kakoune-mode'}
spmaps.t.M={function ()
    vim.o.winminwidth=0
    vim.o.winminheight=0
    for i in ('hjkl'):gmatch('.') do
        print(i)
        nno('<C-'..i..'>','<C-w>'..i..'<C-w>|<C-w>_')
end end,'max-mode'} --TODO

----browser
spmaps.g={name='+browser--'}
for k,v in pairs({
    p='yi\':!setsid firefox https://www.github.com/<C-r>"\r',
    c='yi\':!setsid firefox (curl -s "https://registry.npmjs.org/<C-r>""<Bar>jq -r ".homepage")\r',
    C='yi\':!setsid firefox "https://registry.npmjs.org/<C-r>""\r',
    w='lbyw:!setsid firefox "https://en.wikipedia.org/w/index.php?search=<C-r>""\r',
    q='lbyw:!setsid firefox "https://docs.qtile.org/en/latest/search.html?q=<C-r>"&check_keywords=yes&area=default"\r',
  }) do
  nno('g'..k,v..'\r')
end

----last--
wk.register({[' ']=spmaps})
-- vim:fen:
