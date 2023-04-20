local function swapapos()
  return vim.cmd(":s/['\"]/\\=submatch(0)=='\"'?\"'\":'\"'/g")
end
return vim.keymap.set("n", "' ", swapapos, {noremap = true})
