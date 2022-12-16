(local vf vim.fn)
(fn _G.MyTabLine []
  (let [curtab (vf.tabpagenr)]
    (..
      (accumulate [line "" i _ (ipairs (vf.gettabinfo))]
        (let [file (vf.bufname (. (vf.tabpagebuflist i) (vf.tabpagewinnr i)))]
          (..
            line
            (or (and (= i curtab) "%#TabLineSel#") "%#TabLine#")
            "❬" ;❬❭❮❯❰❱
            (if
              (= file "")
              "N"
              (file:match "^term://")
              (or (and (file:match "ranger") "R") "T")
              (> (length file) 20)
              (.. (file:sub 1 17) "...")
              file
              )
            "❭"
            )))
      "%#TabLine#"
      )))
(tset vim.o :tabline "%!v:lua.MyTabLine()")
