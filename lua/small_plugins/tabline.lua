local vf = vim.fn
_G.MyTabLine = function()
  local curtab = vf.tabpagenr()
  local function _1_()
    local line = ""
    for i, _ in ipairs(vf.gettabinfo()) do
      local file = vf.bufname(vf.tabpagebuflist(i)[vf.tabpagewinnr(i)])
      local function _2_()
        if (file == "") then
          return "N"
        elseif file:match("^term://") then
          return ((file:match("ranger") and "R") or "T")
        elseif (#file > 20) then
          return (file:sub(1, 17) .. "...")
        else
          return file
        end
      end
      line = (line .. (((i == curtab) and "%#TabLineSel#") or "%#TabLine#") .. "\226\157\172" .. _2_() .. "\226\157\173")
    end
    return line
  end
  return (_1_() .. "%#TabLine#")
end
vim.o["tabline"] = "%!v:lua.MyTabLine()"
return nil
