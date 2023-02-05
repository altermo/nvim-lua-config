(local BUILDERS {
       :python true
       :fish true
       :lua true
       :fennel true
       :cs ["csharp"]
       :rust ["cargo run"]
       :cpp "AsyncRun zig c++ -O2 % -o __tmp;./__tmp;rm __tmp"
       :c "AsyncRun zig cc -O2 % -o __tmp;./__tmp;rm __tmp"
       :vim "so %"
       :zig ["zig run"]
       })
(fn eval []
  (match vim.o.filetype
    "vim" (vim.cmd.so "%")
    "lua" (vim.cmd.luafile "%")
    "fennel" ((. (dofile "/usr/share/lua/5.4/fennel.lua") :dofile) (vim.fn.expand "%"))
    "python" (vim.cmd.pyfile "%")
    ))
(fn build [term?]
  (vim.cmd "silent! update")
  (let [ft vim.o.filetype]
    (if (. BUILDERS ft)
        (if (= (. BUILDERS ft) true)
            (if term?
                (vim.cmd (.. "vnew|call termopen('time " ft " \"'.expand('#').'\"')|startinsert"))
                (vim.cmd (.. "AsyncRun time " ft " '%'"))
                )
            (= (type (. BUILDERS ft)) "table")
            (if term?
                (vim.cmd (.. "vnew|call termopen('time " (. (. BUILDERS ft) 1) " \"'.expand('#').'\"')|startinsert"))
                (vim.cmd (.. "AsyncRun time " (. (. BUILDERS ft) 1) " '%'"))
                )
            (vim.cmd (. BUILDERS ft))
            )
        (vim.notify (.. "Builderror: filetype " ft " has no builder or can not be built"))
        )))
(let [nno (. (require "utils.keymap") :nno)]
  (nno "“" build)
  (nno "‘" #(build true))
  (nno "<F5>" build)
  (nno "<F6>" eval)
  (nno "<F7>" #(build true))
  (nno "<F8>" #(tset BUILDERS vim.o.filetype (vim.fn.input ":")))
  )
