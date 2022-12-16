local vf = vim.fn
local cmd = vim.cmd
local function Ranger(path)
  cmd.enew()
  local realpath = vf.fnamemodify(path, ":p")
  local file = "/tmp/chosenfile"
  local ranger_command = "sleep 0.01;printf '\\e[?1000h';ranger --cmd 'set show_hidden=true' --cmd 'set preview_images=true'"
  local jobargs = {}
  local buf = vf.bufnr()
  jobargs.on_exit = function(...)
    if (vf.filereadable(file) == 1) then
      cmd.enew()
      cmd.bdelete({bang = true, buf})
      cmd.edit(vf.readfile(file)[1])
      return vf.delete(file)
    else
      return cmd.bdelete({bang = true, buf})
    end
  end
  while ((vf.filereadable(realpath) == 0) and (vf.isdirectory(realpath) == 0)) do
    realpath = vf.fnamemodify(realpath, ":h")
  end
  if (vf.isdirectory(realpath) == 1) then
    vf.termopen((ranger_command .. " '" .. realpath .. "' --choosefiles=" .. file), jobargs)
  else
    vf.termopen((ranger_command .. " --cmd 'select_file " .. realpath .. "' --choosefiles=" .. file), jobargs)
  end
  return cmd.startinsert()
end
local function RunRanger(_3_)
  local _arg_4_ = _3_
  local path = _arg_4_["args"]
  if (path == "") then
    return Ranger(vf.expand("%"))
  else
    return Ranger(vf.expand(path))
  end
end
local function setup()
  return vim.api.nvim_create_user_command("Ranger", RunRanger, {nargs = "?"})
end
return setup()
