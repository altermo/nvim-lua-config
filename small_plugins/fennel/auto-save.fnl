(fn DoSave []
  (when (and vim.o.modified (not vim.o.readonly) (= vim.o.buftype ""))
    (vim.cmd "silent! update ++p")
    (vim.cmd.echon (.. "'" (: (.. "AutoSave: saved at " (vim.fn.strftime "%H:%M:%S")) :sub 1 (- vim.o.columns 12)) "'"))
    ))
(local AutoSave (vim.api.nvim_create_augroup "AutoSave" {:clear true}))
(vim.api.nvim_create_autocmd ["InsertLeave" "TextChanged"] {:callback DoSave :group AutoSave})
