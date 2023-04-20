local function tabbufmove(num)
  local buf = vim.fn.bufnr()
  local win = vim.api.nvim_get_current_win()
  vim.cmd.tabnext(num)
  vim.cmd(("vert sbuf" .. buf))
  return vim.api.nvim_win_close(win, {})
end
local function runtabbufmove(_1_)
  local _arg_2_ = _1_
  local num = _arg_2_["args"]
  return tabbufmove(num)
end
return vim.api.nvim_create_user_command("TabBufMove", runtabbufmove, {nargs = 1})
