(local M {})
(local F {
       :lua "local function ()\rend\x1bk0ww"
       :vim "function ()\rendfunction\x1bk0w"
       :fennel "(fn  []\r\r)\x1bkkll"
       })
(local C {
       :lua "local ={}\rfunction :new()\rself.__index=self\rreturn setmetatable({},self)\rend\x1bkkkk0w"
       })
(fn gototopnodeandexec [exec]
  ((. (require "syntax-tree-surfer") :go_to_top_node_and_execute_commands) true ["normal! o\x1bo" exec "startinsert"])
  )
(fn get_f []
  (or (. F vim.o.filetype) "(){\r}\x1bk")
  )
(fn get_c []
  (or (. C vim.o.filetype) "class {\r}\x1bkw")
  )
(fn M.func []
  (gototopnodeandexec (.. "normal! I" (get_f)))
  )
(fn M.class []
  (gototopnodeandexec (.. "normal! I" (get_c)))
  )
M
