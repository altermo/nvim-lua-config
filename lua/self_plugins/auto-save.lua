local function DoSave()
  if (vim.o.modified and not vim.o.readonly and (vim.o.buftype == "")) then
    vim.cmd("silent! update")
    return vim.cmd.echon(("'" .. (("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"))):sub(1, (vim.o.columns - 12)) .. "'"))
  else
    return nil
  end
end
local AutoSave = vim.api.nvim_create_augroup("AutoSave", {clear = true})
return vim.api.nvim_create_autocmd({"InsertLeave", "TextChanged"}, {callback = DoSave, group = AutoSave})
