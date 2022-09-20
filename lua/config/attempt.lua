local attempt=require'attempt'
attempt.setup{ext_options={'lua','js','py','fnl','cpp','c','norg',''}}
vim.keymap.set('n','<leader>an',attempt.new_select,{silent=true,noremap=true})--newattempt,selectingextension
vim.keymap.set('n','<leader>ai',attempt.new_input_ext,{silent=true,noremap=true})--newattempt,inputingextension
vim.keymap.set('n','<leader>ar',attempt.run,{silent=true,noremap=true})--runattempt
vim.keymap.set('n','<leader>ad',attempt.delete_buf,{silent=true,noremap=true})--deleteattemptfromcurrentbuffer
vim.keymap.set('n','<leader>ac',attempt.rename_buf,{silent=true,noremap=true})--renameattemptfromcurrentbuffer
vim.keymap.set('n','<leader>al',':Telescope attempt attempt\r',{silent=true,noremap=true})--searchthroughattempts
