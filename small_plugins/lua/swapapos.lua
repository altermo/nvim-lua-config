local M={}
function M.swapapos()
    vim.cmd(":s/['\"]/\\=submatch(0)=='\"'?\"'\":'\"'/g")
end
function M.setup()
    vim.keymap.set("n","' ",M.swapapos,{noremap=true})
end
return M
