local function recursive(items)
  if ((#items == 1) and (items[1] == "")) then
    return true
  else
    local fmap = {}
    for _, v in ipairs(items) do
      local fc = vim.fn.get({[""] = "\13"}, v:sub(1, 1), v:sub(1, 1))
      if not fmap[fc] then
        fmap[fc] = {}
      else
      end
      fmap[fc][(#fmap[fc] + 1)] = v:sub(2)
    end
    local tbl_14_auto = {}
    for k, v in pairs(fmap) do
      local _2_, _3_ = k, recursive(v)
      if ((nil ~= _2_) and (nil ~= _3_)) then
        local k_15_auto = _2_
        local v_16_auto = _3_
        tbl_14_auto[k_15_auto] = v_16_auto
      else
      end
    end
    return tbl_14_auto
  end
end
local function create_index(items, key, str)
  local ret = {}
  if (vim.tbl_count(items) == 1) then
    for k, v in pairs(items) do
      if (v == true) then
        ret[key] = (str .. k)
      else
        for k0, v0 in pairs(create_index(v, (key .. k), str)) do
          ret[k0] = v0
        end
      end
    end
  else
    for k, v in pairs(items) do
      if (v == true) then
        ret[(key .. k)] = (str .. k)
      else
        for k0, v0 in pairs(create_index(v, (key .. k), (str .. k))) do
          ret[k0] = v0
        end
      end
    end
  end
  return ret
end
local function out(items, total, buf, count)
  if (items == true) then
    return vim.api.nvim_buf_set_lines(buf, count, count, false, {total})
  else
    for k, v in pairs(items) do
      local function _9_()
        if (vim.tbl_count(items) == 1) then
          return "_"
        else
          return ""
        end
      end
      out(v, (total .. _9_() .. k), buf, (count + 1))
    end
    return nil
  end
end
local function mainloop(buf, ipath)
  local path = ipath
  local search = ""
  while (vim.fn.isdirectory(path) == 1) do
    local parsed = recursive(vim.fn.readdir(path))
    local dictindex = create_index(parsed, "", "")
    vim.api.nvim_buf_set_lines(buf, 1, vim.api.nvim_buf_line_count(buf), false, {search})
    vim.fn.writefile({search}, "out")
    out(parsed, "", buf, 1)
    vim.cmd.redraw()
    do
      local _11_ = vim.fn.getchar()
      if (_11_ == 27) then
        return path
      elseif (_11_ == "\128kb") then
        if (search == "") then
          path = vim.fn.fnamemodify(path, ":h")
        else
          search = search:sub(0, -2)
        end
      elseif (nil ~= _11_) then
        local char = _11_
        search = (search .. vim.fn.nr2char(char))
      else
      end
    end
    if dictindex[search] then
      vim.pprint(1)
      path = (path .. "/" .. (dictindex[search]):gsub("\13$", ""))
      search = ""
    else
    end
  end
  return nil
end
local function Dff()
  local buf = vim.api.nvim_create_buf(false, true)
  local window = vim.api.nvim_get_current_win()
  vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe")
  vim.api.nvim_win_set_buf(window, buf)
  return vim.cmd.edit(mainloop(buf, vim.fn.fnamemodify(".", ":p:h")))
end
return Dff()
