(fn swapapos []
  (vim.cmd ":s/['\"]/\\=submatch(0)=='\"'?\"'\":'\"'/g")
  )
(vim.keymap.set "n" "' " swapapos {:noremap true})
