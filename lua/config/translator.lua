function SwapLang()
  vim.g.translator_target_lang,vim.g.translator_source_lang=vim.g.translator_source_lang,vim.g.translator_target_lang
  vim.notify(vim.g.translator_source_lang..'>'..vim.g.translator_target_lang)
end
vim.g.translator_source_lang='en'
vim.g.translator_target_lang='sv'
vim.keymap.set('x','þ',':Translate<CR>',{noremap=true,silent=true})  --alt_gr-t
vim.keymap.set('x','Þ',':TranslateR<CR>',{noremap=true,silent=true}) --alt_gr-T
