(local vf vim.fn)
(fn nno [lhs rhs opt]
 (vim.keymap.set "n" lhs rhs (or opt {:silent true :noremap true}))
 )
(fn toggle [opt on off]
  (if
    off
    (tset vim.o opt (or (and (= (. vim.o opt) on) off) on))
    on
    (tset vim.o opt (or (and (= (. vim.o opt) "") on) ""))
    (tset vim.o opt (not (. vim.o opt)))
    )
  (print (.. opt "=" (tostring (. vim.o opt))))
  )
(fn seton [opt on]
  (tset vim.o opt (or on true))
  (print (.. opt "=" (tostring (. vim.o opt))))
  )
(fn setoff [opt off]
  (tset vim.o opt (or off false))
  (print (.. opt "=" (tostring (. vim.o opt))))
  )

(fn parent [path]
  (when (= path "/") (error "cant get parrent dir of /"))
  (vf.fnamemodify path ":h")
  )
(fn base [path]
  (vf.fnamemodify path ":t")
  )
(fn last? [path first?]
  (let [parlist (vf.readdir (parent path))]
    (and (= (. parlist (or (and first? 1) (length parlist))) (base path)))
    ))
(fn join [path1 path2]
  (.. path1 "/" path2)
  )
(fn getnext [path prev?]
  (if
    (and (= (vf.isdirectory path) 1) (next (vf.readdir path)))
    (join path (. (vf.readdir path) (or (and prev? (length (vf.readdir path)))1)))
    (do
      (var path path)
      (while (last? path prev?)
        (set path (parent path))
        )
      (let [
            par (parent path)
            parlist (vf.readdir par)
            ]
        (join par (. parlist (+ (vf.index parlist (base path)) (or (and prev? 0) 2))))
        ))))
(fn get_next_file [path prev?]
  (var path (vf.fnamemodify path ":p"))
  (set path (getnext path prev?))
  (while (= (vf.isdirectory path) 1)
    (set path (getnext path prev?))
    )
  path
  )
(nno "]f" #(vim.cmd.edit (get_next_file (vf.expand "%:p"))))
(nno "[f" #(vim.cmd.edit (get_next_file (vf.expand "%:p") true)))

(each [k v (pairs {
                  :b {:opt "background" :on "light" :off "dark"} :c "cursorline"
                  :h "hlsearch" :l "list" :i "ignorecase" :n "number" :r "relativenumber"
                  :s "spell" :u "cursorcolumn" :w "wrap" :d "diff"
                  :t {:opt "colorcolumn" :on "1,41,81,121,161,201,241"}
                  :v {:opt "virtualedit" :on "block,onemore"} :M {:opt "mouse" :on "a"}
                  :f "foldenable" :e "scrollbind" :m {:opt "conceallevel" :on 2 :off 0}
                  :p {:opt "matchpairs" :on "(:),{:},[:]" :off ""}
                  :T {:opt "showtabline" :on 1 :off 0}
                  })]
  (let [opt (or v.opt v)]
    (nno (.. "]o" k) #(seton opt v.on))
    (nno (.. "[o" k) #(setoff opt v.off))
    (nno (.. "yo" k) #(toggle opt v.on v.off))
    ))
(nno "yox" ":set cursorcolumn!|let &cursorline=&cursorcolumn\r")
(nno "[ox" ":set cursorcolumn cursorline\r")
(nno "]ox" ":set nocursorcolumn nocursorline\r")
;; vim:fen:
