local vf = vim.fn
local function getword(x1, x2, y)
  return vf.strcharpart(vf.getline(y), (x1 - 1), ((x2 - x1) + 1))
end
local function wordcolumn(...)
  vf.execute("keepjumps silent normal! \27")
  local col1 = vf.virtcol("'<")
  local col2 = vf.virtcol("'>")
  local word = getword(col1, col2, ".")
  local beg = vf.line(".")
  local _end = vf.line(".")
  while ((beg > 1) and (getword(col1, col2, (beg - 1)) == word)) do
    beg = (beg - 1)
  end
  while ((_end < vf.line("$")) and (getword(col1, col2, (_end + 1)) == word)) do
    _end = (_end + 1)
  end
  vf.setcursorcharpos({beg, col1})
  vf.execute("keepjumps silent normal! \22")
  return vf.setcursorcharpos({_end, col2})
end
local function charcolumn(...)
  vf.execute("keepjumps silent normal! v")
  return wordcolumn()
end
local function getchar(x, y)
  return vf.strcharpart(vf.getline(y), (x - 1), 1)
end
local function wordrow(...)
  vf.execute("keepjumps silent normal! \27")
  local col1 = vf.virtcol("'<")
  local col2 = vf.virtcol("'>")
  local line = vf.line(".")
  local char = getchar(col1, line)
  while ((col1 > 1) and (getchar((col1 - 1), line) == char)) do
    col1 = (col1 - 1)
  end
  while ((col2 < #vf.getline(line)) and (getchar((col2 + 1), line) == char)) do
    col2 = (col2 + 1)
  end
  vf.setcursorcharpos({line, col1})
  vf.execute("keepjumps silent normal! \22")
  return vf.setcursorcharpos({line, col2})
end
local function charrow(...)
  vf.execute("keepjumps silent normal! v")
  return wordrow()
end
local k = require("utils.keymap")
k.ono("im", charcolumn)
k.xno("im", wordcolumn)
k.ono("ik", charrow)
return k.xno("ik", wordrow)
