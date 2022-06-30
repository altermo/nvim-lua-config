function SOLVPROBLEM()
    vim.fn.system("sed 's/\\[\\[\\(.*\\)\\'\\(.*\\)\\'\\(.*keys = \"\\]\\]\".*\\)\\]\\]/\\'\\1\"\\2\"\\3\\'/' -i ~/.config/nvim/plugin/packer_compiled.lua")
end SOLVPROBLEM() --temp
vim.fn.timer_start(2000,function() vim.fn.execute('checktime') end,{['repeat']=-1})
vim.g.loaded_matchparen        = 1
vim.g.loaded_matchit           = 1
vim.g.loaded_logiPat           = 1
vim.g.loaded_rrhelper          = 1
vim.g.loaded_tarPlugin         = 1
vim.g.loaded_man               = 1
vim.g.loaded_gzip              = 1
vim.g.loaded_zipPlugin         = 1
vim.g.loaded_2html_plugin      = 1
vim.g.loaded_shada_plugin      = 1
vim.g.loaded_spellfile_plugin  = 1
vim.g.loaded_netrw             = 1
vim.g.loaded_netrwPlugin       = 1
vim.g.loaded_tutor_mode_plugin = 1
vim.g.loaded_fzf               = 1
vim.g.loaded_remote_plugins    = 1 --TODO
vim.cmd([[
set textwidth=0
set shiftwidth=4
set tabstop=4
set softtabstop=4
set virtualedit=block,onemore
set foldmethod=expr
nmap Y y$
vnoremap s :norm 
vnoremap <silent> S <cmd>HopChar1<CR>
nnoremap <nowait><buffer> z za
nnoremap <silent> S :HopChar1<CR>
]]) --TODO
