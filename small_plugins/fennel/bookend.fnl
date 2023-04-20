(local M {})
(tset M :locked-files {})
(fn get_list [key]
  (icollect [_ v (ipairs (vim.api.nvim_list_bufs))]
    (if (vim.api.nvim_buf_is_loaded v)
        (let [
              filepath (vim.fn.fnamemodify (vim.fn.bufname v) ":p")
              filename (vim.fn.fnamemodify filepath ":t")
              ]
          (if (= (vim.fn.filereadable filepath) 1)
              (if key
                  (if (= key (: filename :sub 1 1)) filepath)
                  filepath
                  ))))))
(fn open_file [file]
  (vim.cmd.edit file)
  )
(fn lock_file [key]
  (if (> (length (get_list key)) 1)
      (vim.ui.select (get_list key) {} #(tset M.locked-files key $1))
      (tset M.locked-files key (. (get_list key) 1))
      ))
(fn unlock_file [key]
  (tset M.locked-files key nil)
  )
(fn goto_file [key]
  (let [dict (get_list key)]
    (if dict
        (if (= (length dict) 1)
            (open_file (. dict 1))
            (if (. M.locked-files key)
                (open_file (. M.locked-files key))
                (vim.ui.select dict {} open_file)
                )))))
(fn select []
  (vim.ui.select (get_list)
                 {:format_item
                 (fn [file]
                   (if (vim.tbl_contains (vim.tbl_values M.locked-files) file)
                       (.. ">>" file)
                       file
                       ))}
                 (fn [choice]
                   (open_file choice)
                   )))
(fn M.run []
  (match (vim.fn.getcharstr)
    "" nil
    "\t" (lock_file (vim.fn.getcharstr))
    "\x80kB" (unlock_file (vim.fn.getcharstr))
    "\r" (select)
    char (goto_file char)
    ))
M
