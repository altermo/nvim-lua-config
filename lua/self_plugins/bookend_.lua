local M = {}
M["visited_files"] = {}
M.open_file = function(file)
  return vim.cmd.edit(file)
end
M.lock_file = function(key)
  local dict = M.visited_files[key]
  if (#dict > 1) then
    local function _1_(_241)
      dict["lock"] = _241
      return nil
    end
    return vim.ui.select(dict, {}, _1_)
  else
    dict["lock"] = dict[1]
    return nil
  end
end
M.unlock_file = function(key)
  M.visited_files[key]["lock"] = nil
  return nil
end
M.goto_file = function(key)
  local dict = M.visited_files[key]
  if dict then
    local _3_ = #dict
    if (_3_ == 0) then
      return nil
    elseif (_3_ == 1) then
      return M.open_file(dict[1])
    elseif true then
      local _ = _3_
      if dict.lock then
        return M.open_file(dict.lock)
      else
        return vim.ui.select(dict, {}, M.open_file)
      end
    else
      return nil
    end
  else
    return nil
  end
end
M.add_file = function()
  local filename = vim.fn.expand("%:t")
  local filepath = vim.fn.expand("%:p")
  if ((filename ~= "") and (vim.fn.match(filepath, "^[A-Za-z0-9]*://") == -1)) then
    local key = filename:sub(1, 1)
    local dict = M.visited_files[key]
    if (vim.fn.filereadable(filepath) == 1) then
      if not dict then
        M.visited_files[filename:sub(1, 1)] = {filepath}
        return nil
      else
        if not vim.tbl_contains(dict, filepath) then
          return table.insert(M.visited_files[key], filepath)
        else
          return nil
        end
      end
    else
      return nil
    end
  else
    return nil
  end
end
M.select = function()
  local locked_files
  do
    local tbl_17_auto = {}
    local i_18_auto = #tbl_17_auto
    for _, v in pairs(M.visited_files) do
      local val_19_auto = v.lock
      if (nil ~= val_19_auto) then
        i_18_auto = (i_18_auto + 1)
        do end (tbl_17_auto)[i_18_auto] = val_19_auto
      else
      end
    end
    locked_files = tbl_17_auto
  end
  local function _12_()
    local tbl_17_auto = {}
    local i_18_auto = #tbl_17_auto
    for _, v in pairs(M.visited_files) do
      local val_19_auto = v
      if (nil ~= val_19_auto) then
        i_18_auto = (i_18_auto + 1)
        do end (tbl_17_auto)[i_18_auto] = val_19_auto
      else
      end
    end
    return tbl_17_auto
  end
  local function _14_(file)
    if vim.tbl_contains(locked_files, file) then
      return (">>" .. file)
    else
      return file
    end
  end
  local function _16_(choice)
    return M.open_file(choice)
  end
  return vim.ui.select(vim.tbl_flatten(_12_()), {format_item = _14_}, _16_)
end
M.run = function()
  local _17_ = vim.fn.getcharstr()
  if (_17_ == "\9") then
    return M.lock_file(vim.fn.getcharstr())
  elseif (_17_ == "\128kB") then
    return M.unlock_file(vim.fn.getcharstr())
  elseif (_17_ == "\13") then
    return M.select()
  elseif (_17_ == "\128kb") then
    M["select_file"] = vim.list_slice(M.select_file, (#M.select_file - 10))
    return nil
  elseif (nil ~= _17_) then
    local char = _17_
    return M.goto_file(char)
  else
    return nil
  end
end
M.setup = function()
  return vim.api.nvim_create_autocmd("FileType", {pattern = "*", callback = M.add_file})
end
return M
