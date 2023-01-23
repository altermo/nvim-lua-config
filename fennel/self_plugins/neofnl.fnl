;;Self
;make require have the ability to load fennel files
;functions :Fnl and :FnlDo
;;Life
;cache required files because of speed !important


(var fennel nil)
(local M {})
(local vf vim.fn)
(fn M.FnlFile [file]
  (when (not fennel)
    (set fennel (dofile "/usr/share/lua/5.4/fennel.lua"))
    )
  (fennel.dofile file)
  )
(fn M.RunFnlFile [{:args file}]
  (M.FnlFile (vf.expand file))
  )
(fn M.setup []
  (vim.api.nvim_create_user_command "FnlFile" M.RunFnlFile {:nargs 1})
  (set vim.fennel M.FnlFile)
  )
(M.setup)
