(local vf vim.fn)
(local api vim.api)
(fn recursive [items]
  (if (and (= (length items) 1) (= (. items 1) ""))
      [["" "" ""]]
      (let [fmap {} ret []]
        (each [_ v (pairs items)]
          (let [fc (vf.get {"" "\r"} (v:sub 1 1) (v:sub 1 1))]
            (when (not (. fmap fc))
              (tset fmap fc {})
              )
            (tset (. fmap fc) (+ (length (. fmap fc)) 1) (v:sub 2))
            ))
        (each [k v (pairs fmap)]
          (each [_ i (pairs (recursive v))]
            (tset i 3 (.. k (. i 3)))
            (if (= (vf.len fmap) 1)
                (tset i 2 (.. "n" (. i 2)))
                (do
                  (tset i 1 (.. k (. i 1)))
                  (tset i 2 (.. "s" (. i 2)))
                  ))
            (tset ret (+ (length ret) 1) i)
            ))
        ret
        )))
(fn parse [items]
  (if (= (vf.index items "") -1) [])
  (if (= (length items) 1)
      (let [item (. items 1)]
        [[(item:sub 1 1) (.. "n" (vf.repeat "s" (- (length item) 1))) item]]
        )
      (recursive items)
      ))
(fn createtext [p search path]
  (icollect [_ v (pairs p)]
    (let [[searchterm _ name] v]
      (when (= search (searchterm:sub 1 (length search)))
        (.. (if (= (vf.isdirectory (.. path "/" (: name :gsub "\r$" ""))) 1) "/" " ") name)
        ))))
(fn mainloop [buf ipath]
  (var path ipath)
  (var search "")
  (while (= (vf.isdirectory path) 1)
    (let [
          parsed (parse (vf.readdir path))
          indexdict (collect [_ v (pairs parsed)]
                      (values (. v 1) (. v 3))
                      )
          text (createtext parsed search path)
          ]
      (api.nvim_buf_set_lines buf 0 -1 false text)
      (api.nvim_buf_set_lines buf -1 -1 false [(.. ":" search)])
      (vim.cmd.redraw)
      (match (vf.getchar)
        27
        (lua "return path")
        "\x80kb"
        (if
          (= search "")
          (set path (vf.fnamemodify path ":h"))
          (set search (search:sub 0 -2))
          )
        char
        (set search (.. search (vf.nr2char char)))
        )
      (when (. indexdict search)
        (set path (.. path "/" (: (. indexdict search) :gsub "\r$" "")))
        (set search "")
        )))
  path
  )
(fn Dff []
  (let [
        buf (api.nvim_create_buf false true)
        window (api.nvim_get_current_win)
        ]
    (api.nvim_buf_set_option buf "bufhidden" "wipe")
    (api.nvim_win_set_buf window buf)
    (vim.cmd.edit (mainloop buf (vf.fnamemodify "." ":p:h")))
    ))
(fn setup []
  (api.nvim_create_user_command "Dff" Dff {})
  )
(setup)
