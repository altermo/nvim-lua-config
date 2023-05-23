function _G.SwapLang()
  vim.g.translator_target_lang,vim.g.translator_source_lang=vim.g.translator_source_lang,vim.g.translator_target_lang
  vim.notify(vim.g.translator_source_lang..'>'..vim.g.translator_target_lang)
end
vim.g.translator_source_lang='en'
vim.g.translator_target_lang='sv'
local xno=require'utils.keymap'.xno
xno('þ',':Translate<CR>')  --alt_gr-t
xno('Þ',':TranslateR<CR>') --alt_gr-T
