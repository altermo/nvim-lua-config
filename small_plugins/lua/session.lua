local M={}
function M.callback()
  vim.cmd.mksession({'/tmp/session.vim',bang=true})
end
function M.setup()
  vim.api.nvim_create_autocmd('VimLeave',{callback=M.callback})
end
return M
