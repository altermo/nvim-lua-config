(local api vim.api)
(local nmsp (api.nvim_create_namespace "visualer"))
(fn get_visual []
  (let [
        [_ ls cs]  (vim.fn.getpos "v")
        [r le ce] (vim.fn.getpos ".")]
    (if (or (> ls le) (and (= ls le) (> cs ce)))
        (api.nvim_buf_get_text 0 (- le 1) (- ce 1) (- ls 1) cs {})
        (api.nvim_buf_get_text 0 (- ls 1) (- cs 1) (- le 1) ce {})
        )))
(var au nil)
(fn hig []
  (let [vis (get_visual)]
    (vim.cmd.syn "clear Visual")
    (vim.cmd.syn (.. "match Visual \"" (. vis 1) "\""))
    ))
(fn clhig []
  (vim.cmd.syn "clear Visual")
  )
(api.nvim_create_autocmd ["ModeChanged"] {
                         :pattern "*:[vV\x16]"
                         :callback #(set au (api.nvim_create_autocmd ["CursorMoved"] {:callback hig}))
                         })
(api.nvim_create_autocmd ["ModeChanged"] {
                         :pattern "[vV\x16]:*" :callback #(do (clhig) (api.nvim_del_autocmd au))
                         })
