local M = {}
M["bookmarks"] = {}
local function getfloatwinopt()
  local width = math.floor((vim.o.columns * 0.5))
  local height = math.floor((vim.o.lines * 0.5))
  return {relative = "win", width = width, height = height, col = math.floor(((vim.o.columns - width) / 2)), row = math.floor(((vim.o.lines - height) / 2)), style = "minimal"}
end
M.goto_file = function()
  local buf = vim.api.nvim_create_buf(true, true)
  local win = vim.api.nvim_open_win(buf, false, getfloatwinopt())
  local function _1_()
    local tbl_17_auto = {}
    local i_18_auto = #tbl_17_auto
    for k, v in pairs(M.bookmarks) do
      local val_19_auto = (k .. " : " .. v)
      if (nil ~= val_19_auto) then
        i_18_auto = (i_18_auto + 1)
        do end (tbl_17_auto)[i_18_auto] = val_19_auto
      else
      end
    end
    return tbl_17_auto
  end
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, _1_())
  vim.cmd.redraw()
  do
    local _3_ = vim.fn.getcharstr()
    if (_3_ == " ") then
      M.add_file(vim.fn.getcharstr())
    elseif (_3_ == "\128kb") then
      M.bookmarks[vim.fn.getcharstr()] = nil
    elseif (_3_ == "\27") then
    elseif (nil ~= _3_) then
      local char = _3_
      vim.cmd.edit(M.bookmarks[char])
    else
    end
  end
  vim.api.nvim_win_close(win, false)
  return vim.api.nvim_buf_delete(buf, {})
end
M.add_file = function(char)
  local file = vim.fn.expand("%:p")
  do end (M.bookmarks)[char] = file
  return nil
end
return M
