(fn callback []
  (vim.cmd.mksession {1 "/tmp/session.vim" :bang true})
  )
(vim.api.nvim_create_autocmd "VimLeave" {:callback callback})
