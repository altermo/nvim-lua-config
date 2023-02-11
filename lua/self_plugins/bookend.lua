local M = {}
M["locked-files"] = {b = "/home/user/.config/nvim/fennel/later/bookend.fnl"}
local function get_list(key)
  local tbl_17_auto = {}
  local i_18_auto = #tbl_17_auto
  for _, v in ipairs(vim.api.nvim_list_bufs()) do
    local val_19_auto
    if vim.api.nvim_buf_is_loaded(v) then
      local filepath = vim.fn.fnamemodify(vim.fn.bufname(v), ":p")
      local filename = vim.fn.fnamemodify(filepath, ":t")
      if (vim.fn.filereadable(filepath) == 1) then
        if key then
          if (key == filename:sub(1, 1)) then
            val_19_auto = filepath
          else
            val_19_auto = nil
          end
        else
          val_19_auto = filepath
        end
      else
        val_19_auto = nil
      end
    else
      val_19_auto = nil
    end
    if (nil ~= val_19_auto) then
      i_18_auto = (i_18_auto + 1)
      do end (tbl_17_auto)[i_18_auto] = val_19_auto
    else
    end
  end
  return tbl_17_auto
end
local function open_file(file)
  return vim.cmd.edit(file)
end
local function lock_file(key)
  if (#get_list(key) > 1) then
    local function _6_(_241)
      M["locked-files"][key] = _241
      return nil
    end
    return vim.ui.select(get_list(key), {}, _6_)
  else
    M["locked-files"][key] = get_list(key)[1]
    return nil
  end
end
local function unlock_file(key)
  M["locked-files"][key] = nil
  return nil
end
local function goto_file(key)
  local dict = get_list(key)
  if dict then
    if (#dict == 1) then
      return open_file(dict[1])
    else
      if (M["locked-files"])[key] then
        return open_file((M["locked-files"])[key])
      else
        return vim.ui.select(dict, {}, open_file)
      end
    end
  else
    return nil
  end
end
local function select()
  local function _11_(file)
    if vim.tbl_contains(vim.tbl_values(M["locked-files"]), file) then
      return (">>" .. file)
    else
      return file
    end
  end
  local function _13_(choice)
    return open_file(choice)
  end
  return vim.ui.select(get_list(), {format_item = _11_}, _13_)
end
M.run = function()
  local _14_ = vim.fn.getcharstr()
  if (_14_ == "\9") then
    return lock_file(vim.fn.getcharstr())
  elseif (_14_ == "\128kB") then
    return unlock_file(vim.fn.getcharstr())
  elseif (_14_ == "\13") then
    return select()
  elseif (nil ~= _14_) then
    local char = _14_
    return goto_file(char)
  else
    return nil
  end
end
return M
