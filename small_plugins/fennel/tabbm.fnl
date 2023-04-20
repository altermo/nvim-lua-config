(fn tabbufmove [num]
  (let [
        buf (vim.fn.bufnr)
        win (vim.api.nvim_get_current_win)
        ]
    (vim.cmd.tabnext num)
    (vim.cmd (.. "vert sbuf" buf))
    (vim.api.nvim_win_close win {})
    )
  )
(fn runtabbufmove [{:args num}]
  (tabbufmove num)
  )
(vim.api.nvim_create_user_command "TabBufMove" runtabbufmove {:nargs 1})
