local function command(cmd,bin,opt)
  vim.api.nvim_create_user_command(cmd,bin,opt or {})
end
local fn=vim.fn
function RangerF(path)
  local currentPath=fn.expand(path,nil,nil)
  if string.find(currentPath,'term:') then
      currentPath=fn.getcwd()
  end
  local file='/tmp/chosenfile'
  local ranger_command="printf '\\e[?1000h';ranger --cmd 'set show_hidden=true' --cmd 'set preview_images=true'"
  vim.cmd('enew')
  local JobArgs={}
  local buf=fn.bufnr()
  function JobArgs.on_exit(_,_,_)
      if fn.filereadable(file)==1 then
        vim.cmd('Bclose! '..buf)
        local f=fn.readfile(file)[1]
        vim.cmd('edit '..f)
        fn.delete(file)
      else
        vim.cmd('bdelete! '..buf)
      end
  end
  fn.termopen(ranger_command..' --choosefiles='..file..' "'..currentPath..'"',JobArgs)
  vim.cmd('startinsert')
end
command('Ranger','lua RangerF("%")')
command('RangerG','lua RangerF(<args>)',{nargs=1})
