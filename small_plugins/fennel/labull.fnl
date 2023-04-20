(fn inchars [chars]
  (let [
        differ (if (chars:match "%u") (if (chars:match "%U") (error (.. "string:" chars " may not contain booth upper and lower case")) 65) 97)
        tbl (icollect [c (: (chars:reverse) :gmatch ".")] (string.byte c))
        ]
    (tset tbl 1 (+ 1 (or (. tbl 1) (- differ 1))))
    (var i 1)
    (while (= (- (. tbl i) differ) 26)
      (tset tbl i (- (. tbl i) 26))
      (set i (+ i 1))
      (tset tbl i (+ (or (. tbl i) (- differ 1)) 1))
      )
    (: (accumulate [sum "" _ i (ipairs tbl)] (.. sum (string.char i))) :reverse)
    ))
(fn labull [inp]
  (or
    (inp:match "^%s*[+%-]+ [[].[]] ")
    (if
      (inp:match "^%s*[+%-]+ .*:$")
      (inp:gsub "^(%s*)([+%-]+) .*:$" (.. "%1    %2 "))
      )
    (inp:match "^%s*[+%-]+ ")
    (if (inp:match "^%s*%d+[.)] ")
        (inp:gsub "^(%s*)(%d+)([.)] ).*" (fn [indent number end]
                                           (.. indent (+ (tonumber number) 1) end)
                                           )))
    (if (inp:match "^%s*%a+[.)] ")
        (inp:gsub "^(%s*)(%a+)([.)] ).*" (fn [indent chars end]
                                           (.. indent (inchars chars) end)
                                           )))))
(fn main []
    (let [line (vim.fn.getline ".")
    laline (labull line)]
      (.. "o" (or (and laline (.. "<esc>I" laline)) "")) ;hack
      ))
((. (require "utils.keymap") :nno) "o" main {:expr true})
