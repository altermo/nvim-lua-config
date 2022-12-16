(local vf vim.fn)
(local cmd vim.cmd)
(fn Ranger [path]
  (cmd.enew)
  (var realpath (vf.fnamemodify path ":p"))
  (let [
        file "/tmp/chosenfile"
        ranger_command "sleep 0.01;printf '\\e[?1000h';ranger --cmd 'set show_hidden=true' --cmd 'set preview_images=true'"
        jobargs {}
        buf (vf.bufnr)
        ]
    (fn jobargs.on_exit [...]
      (if (= (vf.filereadable file) 1)
          (do
            (cmd.enew)
            (cmd.bdelete {1 buf :bang true})
            (cmd.edit (. (vf.readfile file) 1))
            (vf.delete file)
            )
          (cmd.bdelete {1 buf :bang true})
          ))
    (while (and (= (vf.filereadable realpath) 0) (= (vf.isdirectory realpath) 0))
      (set realpath (vf.fnamemodify realpath ":h"))
      )
    (if (= (vf.isdirectory realpath) 1)
        (vf.termopen (.. ranger_command " '" realpath "' --choosefiles=" file) jobargs)
        (vf.termopen (.. ranger_command " --cmd 'select_file " realpath "' --choosefiles=" file) jobargs)
        )
    (cmd.startinsert)
    ))
(fn RunRanger [{:args path}]
  (if (= path "")
      (Ranger (vf.expand "%"))
      (Ranger (vf.expand path))
      ))
(fn setup []
  (vim.api.nvim_create_user_command "Ranger" RunRanger {:nargs "?"})
  )
(setup)
