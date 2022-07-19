require("luasnip.loaders.from_vscode").lazy_load()
local ls=require("luasnip")
vim.keymap.set({"i","s"},"<c-l>",function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
end end,{silent=true})
vim.keymap.set({"i","s"},"<c-h>",function()
    if ls.jumpable(-1) then
        ls.jump(-1)
end end,{silent=true})
local snip=ls.snippet
local func=ls.function_node
local ins=ls.insert_node
local text=ls.text_node
local fmt=require'luasnip.extras.fmt'.fmt
local rep=require'luasnip.extras'.rep
ls.add_snippets(nil,{
    all={
        snip({trig="path"},{func(function() return {vim.fn.expand('%')} end)}),
        snip({trig="pathh"},{func(function() return {vim.fn.expand('%:h')} end)}),
        snip({trig="patht"},{func(function() return {vim.fn.expand('%:t')} end)}),
        snip({trig="uname"},{func(function() return {vim.fn.systemlist('uname -a')[1]} end)}),
        snip({trig="neofetch"},{func(function() return vim.fn.systemlist('neofetch --stdout') end)}),
        snip({trig="git-info"},{func(function() return vim.fn.systemlist('nvim --version|head -n1;vim --version|head -n1;uname -sr;alacritty --version;echo alacritty;echo AUR') end)}),
    },
    python={
        snip({trig="MAIN"},{text{'def main():','    '},ins(1,'pass'),text{'','if __name__==\'__main__\':','    main()'}}),
        snip({trig="MAINARGV"},{text{'import sys','def main(argv):','    '},ins(1,'pass'),text{'','if __name__==\'__main__\':','    main(sys.argv)'}}),
        snip({trig="MAINER"},fmt([[#!/usr/bin/python3
# -*- coding: utf-8 -*-
import re
import sys
from {1} import {2}
if __name__ == '__main__':
    sys.argv[0] = re.sub(r'(-script\.pyw|\.exe)?$', '', sys.argv[0])
    sys.exit({3}())]],{ins(1,'moduel'),ins(2,'main'),rep(2)}
        )),
    }
})
for _,i in pairs({'abs','aiter','all','any','anext','ascii','bin','breakpoint','callable','chr','compile','delattr','dir','divmod','enumerate','eval','exec','filter','format','frozenset','getattr','globals','hasattr','hash','help','hex','id','input','isinstance','issubclass','iter','len','locals','map','max','memoryview','min','next','oct','open','ord','pow','print','range','repr','reversed','round','set','setattr','sorted','str','sum','super','type','vars','zip','__import__'}) do
    ls.add_snippets(nil,{python={snip({trig=i},{text(i..'('),ins(1),text(')')})}})
end
for _,i in pairs({'pairs','print'}) do
    ls.add_snippets(nil,{lua={snip({trig=i},{text(i..'('),ins(1),text(')')})}})
end
