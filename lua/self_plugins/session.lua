local function callback()
  return vim.cmd.mksession({"/tmp/session.vim", bang = true})
end
return vim.api.nvim_create_autocmd("VimLeave", {callback = callback})
