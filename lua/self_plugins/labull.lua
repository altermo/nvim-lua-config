local function inchars(chars)
  local differ
  if chars:match("%u") then
    if chars:match("%U") then
      differ = error(("string:" .. chars .. " may not contain booth upper and lower case"))
    else
      differ = 65
    end
  else
    differ = 97
  end
  local tbl
  do
    local tbl_17_auto = {}
    local i_18_auto = #tbl_17_auto
    for c in chars:reverse():gmatch(".") do
      local val_19_auto = string.byte(c)
      if (nil ~= val_19_auto) then
        i_18_auto = (i_18_auto + 1)
        do end (tbl_17_auto)[i_18_auto] = val_19_auto
      else
      end
    end
    tbl = tbl_17_auto
  end
  tbl[1] = (1 + (tbl[1] or (differ - 1)))
  local i = 1
  while ((tbl[i] - differ) == 26) do
    tbl[i] = (tbl[i] - 26)
    i = (i + 1)
    do end (tbl)[i] = ((tbl[i] or (differ - 1)) + 1)
  end
  local _4_
  do
    local sum = ""
    for _, i0 in ipairs(tbl) do
      sum = (sum .. string.char(i0))
    end
    _4_ = sum
  end
  return _4_:reverse()
end
local function labull(inp)
  local function _5_()
    if inp:match("^%s*[+%-]+ .*:$") then
      return inp:gsub("^(%s*)([+%-]+) .*:$", "%1    %2 ")
    else
      return nil
    end
  end
  local function _7_()
    if inp:match("^%s*%d+[.)] ") then
      local function _6_(indent, number, _end)
        return (indent .. (tonumber(number) + 1) .. _end)
      end
      return inp:gsub("^(%s*)(%d+)([.)] ).*", _6_)
    else
      return nil
    end
  end
  local function _9_()
    if inp:match("^%s*%a+[.)] ") then
      local function _8_(indent, chars, _end)
        return (indent .. inchars(chars) .. _end)
      end
      return inp:gsub("^(%s*)(%a+)([.)] ).*", _8_)
    else
      return nil
    end
  end
  return (inp:match("^%s*[+%-]+ [[].[]] ") or _5_() or inp:match("^%s*[+%-]+ ") or _7_() or _9_())
end
local function main()
  local line = vim.fn.getline(".")
  local laline = labull(line)
  return ("o" .. ((laline and ("<esc>I" .. laline)) or ""))
end
return (require("utils.keymap")).nno("o", main, {expr = true})
