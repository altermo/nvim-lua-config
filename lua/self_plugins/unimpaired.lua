local vf = vim.fn
local nno = (require("utils.keymap")).nno
local function toggle(opt, on, off)
  if off then
    vim.o[opt] = (((vim.o[opt] == on) and off) or on)
  elseif on then
    vim.o[opt] = (((vim.o[opt] == "") and on) or "")
  else
    vim.o[opt] = not vim.o[opt]
  end
  return print((opt .. "=" .. tostring(vim.o[opt])))
end
local function seton(opt, on)
  vim.o[opt] = (on or true)
  return print((opt .. "=" .. tostring(vim.o[opt])))
end
local function setoff(opt, off)
  vim.o[opt] = (off or false)
  return print((opt .. "=" .. tostring(vim.o[opt])))
end
local function parent(path)
  if (path == "/") then
    error("cant get parrent dir of /")
  else
  end
  return vf.fnamemodify(path, ":h")
end
local function base(path)
  return vf.fnamemodify(path, ":t")
end
local function last_3f(path, first_3f)
  local parlist = vf.readdir(parent(path))
  return (parlist[((first_3f and 1) or #parlist)] == base(path))
end
local function join(path1, path2)
  return (path1 .. "/" .. path2)
end
local function getnext(path, prev_3f)
  if ((vf.isdirectory(path) == 1) and next(vf.readdir(path))) then
    return join(path, vf.readdir(path)[((prev_3f and #vf.readdir(path)) or 1)])
  else
    local path0 = path
    while last_3f(path0, prev_3f) do
      path0 = parent(path0)
    end
    local par = parent(path0)
    local parlist = vf.readdir(par)
    return join(par, parlist[(vf.index(parlist, base(path0)) + ((prev_3f and 0) or 2))])
  end
end
local function get_next_file(path, prev_3f)
  local path0 = vf.fnamemodify(path, ":p")
  path0 = getnext(path0, prev_3f)
  while (vf.isdirectory(path0) == 1) do
    path0 = getnext(path0, prev_3f)
  end
  return path0
end
local function _4_()
  return vim.cmd.edit(get_next_file(vf.expand("%:p")))
end
nno("]f", _4_)
local function _5_()
  return vim.cmd.edit(get_next_file(vf.expand("%:p"), true))
end
nno("[f", _5_)
for k, v in pairs({b = {opt = "background", on = "light", off = "dark"}, c = "cursorline", h = "hlsearch", l = "list", i = "ignorecase", n = "number", r = "relativenumber", s = "spell", u = "cursorcolumn", w = "wrap", d = "diff", t = {opt = "colorcolumn", on = "1,41,81,121,161,201,241"}, v = {opt = "virtualedit", on = "block,onemore"}, m = {opt = "mouse", on = "a"}, f = "foldenable", e = "scrollbind", p = {opt = "matchpairs", on = "(:),{:},[:]", off = ""}}) do
  local opt = (v.opt or v)
  local function _6_()
    return seton(opt, v.on)
  end
  nno(("]o" .. k), _6_)
  local function _7_()
    return setoff(opt, v.off)
  end
  nno(("[o" .. k), _7_)
  local function _8_()
    return toggle(opt, v.on, v.off)
  end
  nno(("yo" .. k), _8_)
end
nno("yox", ":set cursorcolumn!|let &cursorline=&cursorcolumn\13")
nno("[ox", ":set cursorcolumn cursorline\13")
return nno("]ox", ":set nocursorcolumn nocursorline\13")
