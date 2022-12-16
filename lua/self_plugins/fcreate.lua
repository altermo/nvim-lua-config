local M = {}
local F = {lua = "local function ()\13end\27k0ww", vim = "function ()\13endfunction\27k0w", fennel = "(fn  []\13\13)\27kkll"}
local C = {lua = "local ={}\13function :new()\13self.__index=self\13return setmetatable({},self)\13end\27kkkk0w"}
local function gototopnodeandexec(exec)
  return (require("syntax-tree-surfer")).go_to_top_node_and_execute_commands(true, {"normal! o\27o", exec, "startinsert"})
end
local function get_f()
  return (F[vim.o.filetype] or "(){\13}\27k")
end
local function get_c()
  return (C[vim.o.filetype] or "class {\13}\27kw")
end
M.func = function()
  return gototopnodeandexec(("normal! I" .. get_f()))
end
M.class = function()
  return gototopnodeandexec(("normal! I" .. get_c()))
end
return M
