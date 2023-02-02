(fn recursive [items]
  (if (and (= (length items) 1) (= (. items 1) ""))
      true
      (let [fmap {}]
        (each [_ v (ipairs items)]
          (let [fc (vim.fn.get {"" "\r"} (v:sub 1 1) (v:sub 1 1))]
            (when (not (. fmap fc))
              (tset fmap fc {})
              )
            (tset (. fmap fc) (+ (length (. fmap fc)) 1) (v:sub 2))
            ))
        (collect [k v (pairs fmap)]
          (values k (recursive v))
          ))))
(fn create-index [items key str]
  (let [ret {}]
    (if (= (vim.tbl_count items ) 1)
        (each [k v (pairs items)]
          (if (= v true)
              (tset ret key (.. str k))
              (each [k v (pairs (create-index v (.. key k) str))]
                (tset ret k v)
                )))
        (each [k v (pairs items)]
          (if (= v true)
              (tset ret (.. key k) (.. str k))
              (each [k v (pairs (create-index v (.. key k) (.. str k)))]
                (tset ret k v)
                ))))
    ret
    ))
(fn out [items total buf count]
  (if (= items true)
      (vim.api.nvim_buf_set_lines buf count count false [total])
      (each [k v (pairs items)]
        (out v (.. total (if (= (vim.tbl_count items) 1) "_" "") k) buf (+ count 1))
        )))
(fn mainloop [buf ipath]
  (var path ipath)
  (var search "")
  (while (= (vim.fn.isdirectory path) 1)
    (let [
          parsed (recursive (vim.fn.readdir path))
          dictindex (create-index parsed "" "")
          ]
      (vim.api.nvim_buf_set_lines buf 1 (vim.api.nvim_buf_line_count buf) false [search])
      (vim.fn.writefile [search] "out")
      (out parsed "" buf 1)
      (vim.cmd.redraw)
      (match (vim.fn.getchar)
        27
        (lua "return path")
        "\x80kb"
        (if
          (= search "")
          (set path (vim.fn.fnamemodify path ":h"))
          (set search (search:sub 0 -2))
          )
        char
        (set search (.. search (vim.fn.nr2char char)))
        )
      (when (. dictindex search)
       (vim.pprint 1)
        (set path (.. path "/" (: (. dictindex search) :gsub "\r$" "")))
        (set search "")
        )
      )
    )
  )
(fn Dff []
  (let [
        buf (vim.api.nvim_create_buf false true)
        window (vim.api.nvim_get_current_win)
        ]
    (vim.api.nvim_buf_set_option buf "bufhidden" "wipe")
    (vim.api.nvim_win_set_buf window buf)
    (vim.cmd.edit (mainloop buf (vim.fn.fnamemodify "." ":p:h")))
    ))
(Dff)
