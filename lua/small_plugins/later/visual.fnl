(local api vim.api)
(local nmsp (api.nvim_create_namespace "visualer"))
(fn get_visual []
  (let [
        [_ ls cs]  (vim.fn.getpos "v")
        [_ le ce] (vim.fn.getpos ".")]
    (if (or (> ls le) (and (= ls le) (> cs ce)))
        (api.nvim_buf_get_text 0 (- le 1) (- ce 1) (- ls 1) cs {})
        (api.nvim_buf_get_text 0 (- ls 1) (- cs 1) (- le 1) ce {})
        )))
(var au nil)
(var id nil)
(fn hig []
  (let [vis (get_visual)]
    (when (and id (~= id 1)) (vim.fn.matchdelete id) (set id 1))
    (if (= (length vis) 1)
        (set id (vim.fn.matchadd "visual" (.. "\\V" (vim.fn.escape (. vis 1) "\\")) ));TODO \< \> if wordstart or wordend maybe
        )))
(fn clhig []
  (when (and id (~= id 1))
    (vim.fn.matchdelete id)
    (set id nil)
    ))
(api.nvim_create_autocmd ["ModeChanged"] {
                         :pattern "*:[vV\x16]"
                         :callback #(set au (api.nvim_create_autocmd ["CursorMoved"] {:callback hig}))
                         })
(api.nvim_create_autocmd ["ModeChanged"] {
                         :pattern "[vV\x16]:*" :callback #(do (api.nvim_del_autocmd au) (clhig))
                         })
