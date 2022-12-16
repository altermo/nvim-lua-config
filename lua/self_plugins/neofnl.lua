local fennel = nil
local M = {}
local vf = vim.fn
M.FnlFile = function(file)
  if not fennel then
    fennel = dofile("/usr/share/lua/5.4/fennel.lua")
  else
  end
  return fennel.dofile(file)
end
M.RunFnlFile = function(_2_)
  local _arg_3_ = _2_
  local file = _arg_3_["args"]
  return M.FnlFile(vf.expand(file))
end
M.setup = function()
  return vim.api.nvim_create_user_command("FnlFile", M.RunFnlFile, {nargs = 1})
end
return M.setup()
