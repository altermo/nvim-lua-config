local vf = vim.fn
local api = vim.api
local function recursive(items)
  if ((#items == 1) and (items[1] == "")) then
    return {{"", "", ""}}
  else
    local fmap = {}
    local ret = {}
    for _, v in pairs(items) do
      local fc = vf.get({[""] = "\13"}, v:sub(1, 1), v:sub(1, 1))
      if not fmap[fc] then
        fmap[fc] = {}
      else
      end
      fmap[fc][(#fmap[fc] + 1)] = v:sub(2)
    end
    for k, v in pairs(fmap) do
      for _, i in pairs(recursive(v)) do
        i[3] = (k .. i[3])
        if (vf.len(fmap) == 1) then
          i[2] = ("n" .. i[2])
        else
          i[1] = (k .. i[1])
          do end (i)[2] = ("s" .. i[2])
        end
        ret[(#ret + 1)] = i
      end
    end
    return ret
  end
end
local function parse(items)
  if (vf.index(items, "") == -1) then
    do local _ = {} end
  else
  end
  if (#items == 1) then
    local item = items[1]
    return {{item:sub(1, 1), ("n" .. vf["repeat"]("s", (#item - 1))), item}}
  else
    return recursive(items)
  end
end
local function createtext(p, search, path)
  local tbl_17_auto = {}
  local i_18_auto = #tbl_17_auto
  for _, v in pairs(p) do
    local val_19_auto
    do
      local _let_6_ = v
      local searchterm = _let_6_[1]
      local _0 = _let_6_[2]
      local name = _let_6_[3]
      if (search == searchterm:sub(1, #search)) then
        local function _7_()
          if (vf.isdirectory((path .. "/" .. name:gsub("\13$", ""))) == 1) then
            return "/"
          else
            return " "
          end
        end
        val_19_auto = (_7_() .. name)
      else
        val_19_auto = nil
      end
    end
    if (nil ~= val_19_auto) then
      i_18_auto = (i_18_auto + 1)
      do end (tbl_17_auto)[i_18_auto] = val_19_auto
    else
    end
  end
  return tbl_17_auto
end
local function mainloop(buf, ipath)
  local path = ipath
  local search = ""
  while (vf.isdirectory(path) == 1) do
    local parsed = parse(vf.readdir(path))
    local indexdict
    do
      local tbl_14_auto = {}
      for _, v in pairs(parsed) do
        local k_15_auto, v_16_auto = v[1], v[3]
        if ((k_15_auto ~= nil) and (v_16_auto ~= nil)) then
          tbl_14_auto[k_15_auto] = v_16_auto
        else
        end
      end
      indexdict = tbl_14_auto
    end
    local text = createtext(parsed, search, path)
    api.nvim_buf_set_lines(buf, 0, -1, false, text)
    api.nvim_buf_set_lines(buf, -1, -1, false, {(":" .. search)})
    vim.cmd.redraw()
    do
      local _11_ = vf.getchar()
      if (_11_ == 27) then
        return path
      elseif (_11_ == "\128kb") then
        if (search == "") then
          path = vf.fnamemodify(path, ":h")
        else
          search = search:sub(0, -2)
        end
      elseif (nil ~= _11_) then
        local char = _11_
        search = (search .. vf.nr2char(char))
      else
      end
    end
    if indexdict[search] then
      path = (path .. "/" .. (indexdict[search]):gsub("\13$", ""))
      search = ""
    else
    end
  end
  return path
end
local function Dff()
  local buf = api.nvim_create_buf(false, true)
  local window = api.nvim_get_current_win()
  api.nvim_buf_set_option(buf, "bufhidden", "wipe")
  api.nvim_win_set_buf(window, buf)
  return vim.cmd.edit(mainloop(buf, vf.fnamemodify(".", ":p:h")))
end
local function setup()
  return api.nvim_create_user_command("Dff", Dff, {})
end
return setup()
