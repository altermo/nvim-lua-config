local BUILDERS = {python = true, fish = true, lua = true, fennel = true, cs = {"csharp"}, cpp = "AsyncRun g++ % -o __tmp;./__tmp;rm __tmp", vim = "so %"}
local function eval()
  local _1_ = vim.o.filetype
  if (_1_ == "vim") then
    return vim.cmd.so("%")
  elseif (_1_ == "lua") then
    return vim.cmd.luafile("%")
  elseif (_1_ == "fennel") then
    return (dofile("/usr/share/lua/5.4/fennel.lua")).dofile(vim.fn.expand("%"))
  elseif (_1_ == "python") then
    return vim.cmd.pyfile("%")
  else
    return nil
  end
end
local function build(term_3f)
  vim.cmd("silent! update")
  local ft = vim.o.filetype
  if BUILDERS[ft] then
    if (BUILDERS[ft] == true) then
      if term_3f then
        return vim.cmd(("vnew|call termopen('time " .. ft .. " \"'.expand('#').'\"')|startinsert"))
      else
        return vim.cmd(("AsyncRun time " .. ft .. " '%'"))
      end
    elseif (type(BUILDERS[ft]) == "table") then
      if term_3f then
        return vim.cmd(("vnew|call termopen('time " .. BUILDERS[ft][1] .. " \"'.expand('#').'\"')|startinsert"))
      else
        return vim.cmd(("AsyncRun time " .. BUILDERS[ft][1] .. " '%'"))
      end
    else
      return vim.cmd(BUILDERS[ft])
    end
  else
    return vim.notify(("Builderror: filetype " .. ft .. " has no builder or can not be built"))
  end
end
local nno = (require("utils.keymap")).nno
nno("\226\128\156", build)
local function _7_()
  return build(true)
end
nno("\226\128\152", _7_)
nno("<F5>", build)
nno("<F6>", eval)
local function _8_()
  return build(true)
end
nno("<F7>", _8_)
local function _9_()
  BUILDERS[vim.o.filetype] = vim.fn.input(":")
  return nil
end
return nno("<F8>", _9_)
