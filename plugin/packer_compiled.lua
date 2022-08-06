-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/user/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/user/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/user/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/user/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/user/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  FastFold = {
    commands = { "FastFoldUpdate" },
    config = { "\27LJ\2\ni\0\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\2\fnoremap\2\vnowait\2\27<Plug>(FastFoldUpdate)\6Z\6n\bset\vkeymap\bvim\0" },
    keys = { { "", "Z" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/FastFold",
    url = "https://github.com/Konfekt/FastFold"
  },
  ["FixCursorHold.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/FixCursorHold.nvim",
    url = "https://github.com/antoinemadec/FixCursorHold.nvim"
  },
  ["HighStr.nvim"] = {
    commands = { "HSHighlight", "HSRmHighlight" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/HighStr.nvim",
    url = "https://github.com/Pocco81/HighStr.nvim"
  },
  ["NeoWell.lua"] = {
    commands = { "NeoWellToggle", "NeoWellAppend", "NeoWellJump", "NeoWellEdit", "NeoWellOut", "NeoWellWipeOut" },
    config = { 'require"neo-well".setup{}' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/NeoWell.lua",
    url = "https://github.com/nyngwang/NeoWell.lua"
  },
  ["abbreinder.nvim"] = {
    config = { 'require"abbreinder".setup{}' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/abbreinder.nvim",
    url = "https://github.com/0styx0/abbreinder.nvim"
  },
  ["abbremand.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/abbremand.nvim",
    url = "https://github.com/0styx0/abbremand.nvim"
  },
  ["accelerated-jk.nvim"] = {
    config = { 'require"accelerated-jk".setup{}' },
    keys = { { "n", "j" }, { "n", "k" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/accelerated-jk.nvim",
    url = "https://github.com/xiyaowong/accelerated-jk.nvim"
  },
  ["aerojump.nvim"] = {
    commands = { "Aerojump" },
    config = { "\27LJ\2\n¹\1\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0™\1      if g:loaded_remote_plugins==1\n        unlet g:loaded_remote_plugins\n        source /usr/share/nvim/runtime/plugin/rplugin.vim\n      endif\n    \bcmd\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/aerojump.nvim",
    url = "https://github.com/ripxorip/aerojump.nvim"
  },
  ["animate.vim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/animate.vim",
    url = "https://github.com/camspiers/animate.vim"
  },
  ["ariake-vim-colors"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/ariake-vim-colors",
    url = "https://github.com/jim-at-jibba/ariake-vim-colors"
  },
  ["asyncrun.vim"] = {
    commands = { "AsyncRun", "AsyncStop" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/asyncrun.vim",
    url = "https://github.com/skywind3000/asyncrun.vim"
  },
  ["asynctasks.vim"] = {
    commands = { "AsyncTask", "AsyncTaskEdit", "AsyncTaskLast", "AsyncTaskList", "AsyncTaskMacro", "AsyncTaskProfile" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/asynctasks.vim",
    url = "https://github.com/skywind3000/asynctasks.vim"
  },
  ["attempt.nvim"] = {
    config = { 'require("config.attempt")' },
    keys = { { "n", "\\an" }, { "n", "\\ai" }, { "n", "\\ar" }, { "n", "\\ad" }, { "n", "\\ac" }, { "n", "\\al" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/attempt.nvim",
    url = "https://github.com/m-demare/attempt.nvim"
  },
  ["bex.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/bex.nvim",
    url = "https://github.com/bkoropoff/bex.nvim"
  },
  ["bufdelete.nvim"] = {
    commands = { "Bdelete", "Bwipeout" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/bufdelete.nvim",
    url = "https://github.com/famiu/bufdelete.nvim"
  },
  ["bullets.vim"] = {
    config = { "\27LJ\2\n¼\1\0\0\6\0\v\0\0176\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\0\0009\0\1\0)\1\0\0=\1\4\0006\0\0\0009\0\5\0009\0\6\0'\2\a\0'\3\b\0'\4\t\0005\5\n\0B\0\5\1K\0\1\0\1\0\2\fnoremap\2\vsilent\2\22:InsertNewBullet\r\6o\6n\bset\vkeymap\25bullets_set_mappings\1\2\0\0\6*\31bullets_enabled_file_types\6g\bvim\0" },
    keys = { { "n", "o" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/bullets.vim",
    url = "https://github.com/dkarter/bullets.vim"
  },
  ["calendar.vim"] = {
    commands = { "Calendar" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/calendar.vim",
    url = "https://github.com/itchyny/calendar.vim"
  },
  ["capture.vim"] = {
    commands = { "Capture" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/capture.vim",
    url = "https://github.com/tyru/capture.vim"
  },
  ["carbon-now.nvim"] = {
    commands = { "CarbonNow" },
    config = { "\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15carbon-now\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/carbon-now.nvim",
    url = "https://github.com/ellisonleao/carbon-now.nvim"
  },
  ["cder.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/cder.nvim",
    url = "https://github.com/zane-/cder.nvim"
  },
  ["centerpad.nvim"] = {
    commands = { "Centerpad" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/centerpad.nvim",
    url = "https://github.com/smithbm2316/centerpad.nvim"
  },
  ["clever-f.vim"] = {
    config = { "\27LJ\2\n¸\1\0\0\6\0\n\0\0176\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\0\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0005\5\t\0B\0\5\1K\0\1\0\1\0\2\fnoremap\2\vsilent\2\27<Plug>(clever-f-reset)\n<esc>\6n\bset\vkeymap\25clever_f_mark_direct\24clever_f_smart_case\6g\bvim\0" },
    keys = { { "", "f" }, { "", "t" }, { "", "F" }, { "", "T" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/clever-f.vim",
    url = "https://github.com/rhysd/clever-f.vim"
  },
  ["close-buffers.nvim"] = {
    commands = { "BDelete", "BWipeout" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/close-buffers.nvim",
    url = "https://github.com/kazhala/close-buffers.nvim"
  },
  ["cmd-parser.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/cmd-parser.nvim",
    url = "https://github.com/winston0410/cmd-parser.nvim"
  },
  ["cmp-buffer"] = {
    after_files = { "/home/user/.local/share/nvim/site/pack/packer/opt/cmp-buffer/after/plugin/cmp_buffer.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-calc"] = {
    after_files = { "/home/user/.local/share/nvim/site/pack/packer/opt/cmp-calc/after/plugin/cmp_calc.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/cmp-calc",
    url = "https://github.com/hrsh7th/cmp-calc"
  },
  ["cmp-cmdline"] = {
    after_files = { "/home/user/.local/share/nvim/site/pack/packer/opt/cmp-cmdline/after/plugin/cmp_cmdline.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-cmdline-history"] = {
    after_files = { "/home/user/.local/share/nvim/site/pack/packer/opt/cmp-cmdline-history/after/plugin/cmp_cmdline_history.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/cmp-cmdline-history",
    url = "https://github.com/dmitmel/cmp-cmdline-history"
  },
  ["cmp-fish"] = {
    after_files = { "/home/user/.local/share/nvim/site/pack/packer/opt/cmp-fish/after/plugin/cmp_fish.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/cmp-fish",
    url = "https://github.com/mtoohey31/cmp-fish"
  },
  ["cmp-fuzzy-buffer"] = {
    after_files = { "/home/user/.local/share/nvim/site/pack/packer/opt/cmp-fuzzy-buffer/after/plugin/cmp_fuzzy_buffer.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/cmp-fuzzy-buffer",
    url = "https://github.com/tzachar/cmp-fuzzy-buffer"
  },
  ["cmp-nvim-lsp"] = {
    after_files = { "/home/user/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp/after/plugin/cmp_nvim_lsp.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lsp-signature-help"] = {
    after_files = { "/home/user/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp-signature-help/after/plugin/cmp_nvim_lsp_signature_help.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp-signature-help",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp-signature-help"
  },
  ["cmp-nvim-lua"] = {
    after_files = { "/home/user/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua/after/plugin/cmp_nvim_lua.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-nvim-tags"] = {
    after_files = { "/home/user/.local/share/nvim/site/pack/packer/opt/cmp-nvim-tags/after/plugin/cmp_nvim_tags.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/cmp-nvim-tags",
    url = "https://github.com/quangnguyen30192/cmp-nvim-tags"
  },
  ["cmp-path"] = {
    after_files = { "/home/user/.local/share/nvim/site/pack/packer/opt/cmp-path/after/plugin/cmp_path.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-rg"] = {
    after_files = { "/home/user/.local/share/nvim/site/pack/packer/opt/cmp-rg/after/plugin/cmp-rg.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/cmp-rg",
    url = "https://github.com/lukas-reineke/cmp-rg"
  },
  ["cmp-snippy"] = {
    after_files = { "/home/user/.local/share/nvim/site/pack/packer/opt/cmp-snippy/after/plugin/cmp_snippy.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/cmp-snippy",
    url = "https://github.com/dcampos/cmp-snippy"
  },
  ["cmp-spell"] = {
    after_files = { "/home/user/.local/share/nvim/site/pack/packer/opt/cmp-spell/after/plugin/cmp-spell.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/cmp-spell",
    url = "https://github.com/f3fora/cmp-spell"
  },
  ["cmp-tabnine"] = {
    after_files = { "/home/user/.local/share/nvim/site/pack/packer/opt/cmp-tabnine/after/plugin/cmp-tabnine.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/cmp-tabnine",
    url = "https://github.com/tzachar/cmp-tabnine"
  },
  ["cmp-treesitter"] = {
    after_files = { "/home/user/.local/share/nvim/site/pack/packer/opt/cmp-treesitter/after/plugin/cmp_treesitter.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/cmp-treesitter",
    url = "https://github.com/ray-x/cmp-treesitter"
  },
  ["codi.vim"] = {
    commands = { "Codi", "CodiNew", "CodiExpand", "CodiSelect", "CodiUpdate" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/codi.vim",
    url = "https://github.com/metakirby5/codi.vim"
  },
  ["color-converter.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/color-converter.nvim",
    url = "https://github.com/ntbbloodbath/color-converter.nvim"
  },
  ["colortils.nvim"] = {
    commands = { "Colortils" },
    config = { 'require"colortils".setup{}' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/colortils.nvim",
    url = "https://github.com/nvim-colortils/colortils.nvim"
  },
  ["comment-box.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/comment-box.nvim",
    url = "https://github.com/ludopinelli/comment-box.nvim"
  },
  ["cybu.nvim"] = {
    config = { "\27LJ\2\nÈ\2\0\0\5\0\20\0'6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\0016\0\b\0009\0\t\0009\0\n\0'\2\v\0'\3\f\0'\4\r\0B\0\4\0016\0\b\0009\0\t\0009\0\n\0'\2\v\0'\3\14\0'\4\15\0B\0\4\0016\0\b\0009\0\t\0009\0\n\0'\2\v\0'\3\16\0'\4\17\0B\0\4\0016\0\b\0009\0\t\0009\0\n\0'\2\v\0'\3\18\0'\4\19\0B\0\4\1K\0\1\0\29<plug>(CybuLastusedNext)\a]B\29<plug>(CybuLastusedPrev)\a[B\21<Plug>(CybuNext)\a]b\21<Plug>(CybuPrev)\a[b\6n\bset\vkeymap\bvim\nstyle\1\0\0\rdevicons\1\0\0\1\0\1\fenabled\1\nsetup\tcybu\frequire\0" },
    keys = { { "n", "]b" }, { "n", "[b" }, { "n", "]B" }, { "n", "[B" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/cybu.nvim",
    url = "https://github.com/ghillb/cybu.nvim"
  },
  ["dashboard-nvim"] = {
    commands = { "Dashboard", "DashboardNewFile" },
    config = { 'require("config.dashboard")' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/dashboard-nvim",
    url = "https://github.com/glepnir/dashboard-nvim"
  },
  ["dial.nvim"] = {
    config = { 'require("config.dial")' },
    keys = { { "n", "<C-a>" }, { "n", "<C-x>" }, { "x", "<C-a>" }, { "x", "<C-x>" }, { "x", "g<C-a>" }, { "x", "g<C-x>" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/dial.nvim",
    url = "https://github.com/monaqa/dial.nvim"
  },
  ["diffview.nvim"] = {
    commands = { "DiffviewOpen", "DiffviewFileHistory", "DiffviewClose", "DiffviewFocusFiles", "DiffviewToggleFiles", "DiffviewRefresh", "DiffviewLog" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/diffview.nvim",
    url = "https://github.com/sindrets/diffview.nvim"
  },
  ["dirbuf.nvim"] = {
    commands = { "Dirbuf" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/dirbuf.nvim",
    url = "https://github.com/elihunter173/dirbuf.nvim"
  },
  ["doom-one.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/doom-one.nvim",
    url = "https://github.com/NTBBloodbath/doom-one.nvim"
  },
  ["due.nvim"] = {
    config = { 'require"due_nvim".setup{\n  update_rate = 1000\n};require("due_nvim").async_update(0)' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/due.nvim",
    url = "https://github.com/nfrid/due.nvim"
  },
  ["emmet-vim"] = {
    keys = { { "i", "<C-y>" }, { "n", "<C-y>" }, { "v", "<C-y>" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/emmet-vim",
    url = "https://github.com/mattn/emmet-vim"
  },
  ["everblush.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/everblush.nvim",
    url = "https://github.com/everblush/everblush.nvim"
  },
  falcon = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/falcon",
    url = "https://github.com/fenetikm/falcon"
  },
  ["fennel-nvim"] = {
    commands = { "Fnl", "FnlFile", "FnlDo" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/fennel-nvim",
    url = "https://github.com/Javyre/fennel-nvim"
  },
  ["filetype.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/filetype.nvim",
    url = "https://github.com/nathom/filetype.nvim"
  },
  ["fold-preview.nvim"] = {
    config = { 'require"fold-preview".setup{}' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/fold-preview.nvim",
    url = "https://github.com/anuvyklack/fold-preview.nvim"
  },
  ["fuzzy.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/fuzzy.nvim",
    url = "https://github.com/tzachar/fuzzy.nvim"
  },
  ["fwatch.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/fwatch.nvim",
    url = "https://github.com/rktjmp/fwatch.nvim"
  },
  ["fzf-folds.vim"] = {
    commands = { "Folds" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/fzf-folds.vim",
    url = "https://github.com/roosta/fzf-folds.vim"
  },
  ["gruvbox-baby"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/gruvbox-baby",
    url = "https://github.com/luisiacc/gruvbox-baby"
  },
  ["gruvbox.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/gruvbox.nvim",
    url = "https://github.com/ellisonleao/gruvbox.nvim"
  },
  harpoon = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/harpoon",
    url = "https://github.com/ThePrimeagen/harpoon"
  },
  ["hlargs.nvim"] = {
    config = { 'require"hlargs".setup{}' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/hlargs.nvim",
    url = "https://github.com/m-demare/hlargs.nvim"
  },
  ["hologram.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/hologram.nvim",
    url = "https://github.com/edluffy/hologram.nvim"
  },
  ["hop.nvim"] = {
    config = { 'require"hop".setup{}' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/hop.nvim",
    url = "https://github.com/phaazon/hop.nvim"
  },
  ["howdoi.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/howdoi.nvim",
    url = "https://github.com/zane-/howdoi.nvim"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["instant.nvim"] = {
    config = { "\27LJ\2\n7\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\tUsEr\21instant_username\6g\bvim\0" },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/instant.nvim",
    url = "https://github.com/jbyuki/instant.nvim"
  },
  ["jobsplit.nvim"] = {
    commands = { "Jobsplit" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/jobsplit.nvim",
    url = "https://gitlab.com/Groctel/jobsplit.nvim"
  },
  ["jumpwire.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/jumpwire.nvim",
    url = "https://github.com/micmine/jumpwire.nvim"
  },
  ["jumpy.vim"] = {
    keys = { { "", "[[" }, { "", "<char-93><char-93>" } },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/jumpy.vim",
    url = "https://github.com/arp242/jumpy.vim"
  },
  ["jupyter-nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/jupyter-nvim",
    url = "https://github.com/ahmedkhalf/jupyter-nvim"
  },
  ["keymap-amend.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/keymap-amend.nvim",
    url = "https://github.com/anuvyklack/keymap-amend.nvim"
  },
  ["killersheep.nvim"] = {
    commands = { "KillKillKill" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/killersheep.nvim",
    url = "https://github.com/seandewar/killersheep.nvim"
  },
  kimbox = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/kimbox",
    url = "https://github.com/lmburns/kimbox"
  },
  ["lazylist.vim"] = {
    commands = { "LazyList" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/lazylist.vim",
    url = "https://github.com/kabbamine/lazylist.vim"
  },
  ["lens.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/lens.vim",
    url = "https://github.com/camspiers/lens.vim"
  },
  ["limelight.vim"] = {
    commands = { "Limelight" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/limelight.vim",
    url = "https://github.com/junegunn/limelight.vim"
  },
  ["linediff.vim"] = {
    commands = { "Linediff", "LinediffReset" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/linediff.vim",
    url = "https://github.com/andrewradev/linediff.vim"
  },
  ["lista.nvim"] = {
    commands = { "Lista" },
    config = { "\27LJ\2\n¹\1\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0™\1      if g:loaded_remote_plugins==1\n        unlet g:loaded_remote_plugins\n        source /usr/share/nvim/runtime/plugin/rplugin.vim\n      endif\n    \bcmd\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/lista.nvim",
    url = "https://github.com/lambdalisue/lista.nvim"
  },
  ["lsp-colors.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/lsp-colors.nvim",
    url = "https://github.com/folke/lsp-colors.nvim"
  },
  ["lspkind.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/lspkind.nvim",
    url = "https://github.com/onsails/lspkind.nvim"
  },
  ["lspsaga.nvim"] = {
    config = { "\27LJ\2\nf\0\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\2\fnoremap\2\vsilent\2\24:Lspsaga hover_doc\r\6K\6n\bset\vkeymap\bvim\0" },
    keys = { { "n", "K" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/lspsaga.nvim",
    url = "https://github.com/kkharji/lspsaga.nvim"
  },
  ["lualine.nvim"] = {
    config = { 'require"lualine".setup{\n  options = {\n    theme = "powerline"\n  }\n}' },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["markdown-preview.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  ["matchparen.nvim"] = {
    config = { 'require"matchparen".setup{}' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/matchparen.nvim",
    url = "https://github.com/monkoose/matchparen.nvim"
  },
  ["meadow-nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/meadow-nvim",
    url = "https://github.com/kuznetsss/meadow-nvim"
  },
  ["mini.nvim"] = {
    config = { 'require("config.mini")' },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/mini.nvim",
    url = "https://github.com/echasnovski/mini.nvim"
  },
  ["minimal.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/minimal.nvim",
    url = "https://github.com/yazeed1s/minimal.nvim"
  },
  ["minimap.vim"] = {
    commands = { "MinimapToggle" },
    config = { "\27LJ\2\nb\0\0\2\0\4\0\t6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0K\0\1\0\29minimap_highlight_search\28minimap_highlight_range\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/minimap.vim",
    url = "https://github.com/wfxr/minimap.vim"
  },
  ["mkdir.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/mkdir.nvim",
    url = "https://github.com/jghauser/mkdir.nvim"
  },
  ["mkdnflow.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/mkdnflow.nvim",
    url = "https://github.com/jakewvincent/mkdnflow.nvim"
  },
  ["naz.vim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/naz.vim",
    url = "https://github.com/1995parham/naz.vim"
  },
  ["neo-tree.nvim"] = {
    commands = { "Neotree" },
    config = { 'require("config.neotree")' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/neo-tree.nvim",
    url = "https://github.com/nvim-neo-tree/neo-tree.nvim"
  },
  neoformat = {
    commands = { "Neoformat" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/neoformat",
    url = "https://github.com/sbdchd/neoformat"
  },
  neogen = {
    config = { 'require"neogen".setup{\n  snippet_engine = "snippy"\n}' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/neogen",
    url = "https://github.com/danymat/neogen"
  },
  neogit = {
    commands = { "Neogit" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/neogit",
    url = "https://github.com/timuntersberger/neogit"
  },
  neon = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/neon",
    url = "https://github.com/rafamadriz/neon"
  },
  ["neononame.lua"] = {
    commands = { "NeoNoName" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/neononame.lua",
    url = "https://github.com/nyngwang/neononame.lua"
  },
  neorg = {
    config = { 'require"neorg".setup{\n  load = {\n    ["core.defaults"] = {},\n    ["core.export"] = {},\n    ["core.export.markdown"] = {},\n    ["core.norg.concealer"] = {}\n  }\n}' },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/neorg",
    url = "https://github.com/nvim-neorg/neorg"
  },
  ["neorg-telescope"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/neorg-telescope",
    url = "https://github.com/nvim-neorg/neorg-telescope"
  },
  ["neoscroll.nvim"] = {
    config = { 'require"neoscroll".setup{}' },
    keys = { { "", "<C-u>" }, { "", "<C-d>" }, { "", "<C-b>" }, { "", "<C-f>" }, { "", "<C-y>" }, { "", "<C-e>" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/neoscroll.nvim",
    url = "https://github.com/karb94/neoscroll.nvim"
  },
  neoterm = {
    commands = { "T", "Tnew", "Topen", "Texec" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/neoterm",
    url = "https://github.com/kassio/neoterm"
  },
  nerdcommenter = {
    config = { "\27LJ\2\n¼\1\0\0\5\0\n\0\0196\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\3\0009\0\4\0'\2\5\0'\3\6\0'\4\a\0B\0\4\0016\0\0\0009\0\3\0009\0\4\0'\2\b\0'\3\6\0'\4\t\0B\0\4\1K\0\1\0\30<Plug>NERDCommenterToggle\6n!<Plug>NERDCommenterToggle gv\agc\6x\bset\vkeymap\30NERDCreateDefaultMappings\6g\bvim\0" },
    keys = { { "x", "gc" }, { "n", "gc" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/nerdcommenter",
    url = "https://github.com/preservim/nerdcommenter"
  },
  ["nightfox.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/nightfox.nvim",
    url = "https://github.com/edeneast/nightfox.nvim"
  },
  ["nord.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/nord.nvim",
    url = "https://github.com/shaunsingh/nord.nvim"
  },
  ["notif.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/notif.nvim",
    url = "https://github.com/ahmedkhalf/notif.nvim"
  },
  ["notmuch-vim"] = {
    commands = { "NotMuch" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/notmuch-vim",
    url = "https://github.com/felipec/notmuch-vim"
  },
  nrrwrgn = {
    commands = { "NR", "NRV", "NRP", "NRM", "NRS", "NRL", "NRN", "NW", "WR", "NUD" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/nrrwrgn",
    url = "https://github.com/chrisbra/nrrwrgn"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["numb.nvim"] = {
    config = { 'require"numb".setup{}' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/numb.nvim",
    url = "https://github.com/nacro90/numb.nvim"
  },
  ["nvim-animator"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/nvim-animator",
    url = "https://github.com/rrethy/nvim-animator"
  },
  ["nvim-autopairs"] = {
    config = { 'require("config.autopairs")' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    after = { "cmp-buffer", "cmp-calc", "nvim-snippy", "cmp-cmdline", "cmp-cmdline-history", "cmp-fish", "cmp-fuzzy-buffer", "cmp-nvim-lsp", "cmp-nvim-lsp-signature-help", "cmp-nvim-lua", "cmp-nvim-tags", "cmp-path", "cmp-rg", "cmp-snippy", "cmp-spell", "cmp-tabnine", "cmp-treesitter" },
    config = { 'require("config.cmp-nvim")' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-comment-frame"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/nvim-comment-frame",
    url = "https://github.com/s1n7ax/nvim-comment-frame"
  },
  ["nvim-conv"] = {
    commands = { "ConvBin", "ConvDec", "ConvHex", "ConvOct", "ConvFarenheit", "ConvCelsius", "ConvStr", "ConvBytes", "ConvMetricImperial", "ConvDataTransRate", "ConvColor", "ConvSetPrecision" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/nvim-conv",
    url = "https://github.com/simonefranza/nvim-conv"
  },
  ["nvim-expand-expr"] = {
    config = { "\27LJ\2\n_\0\0\5\0\6\0\b6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0B\0\4\1K\0\1\0(:lua require\"expand_expr\".expand()\r\agE\6n\bset\vkeymap\bvim\0" },
    keys = { { "n", "gE" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/nvim-expand-expr",
    url = "https://github.com/allendang/nvim-expand-expr"
  },
  ["nvim-gomove"] = {
    config = { 'require"gomove".setup{\n  map_defaults = false\n}' },
    keys = { { "n", "<Plug>GoNDLineDown" }, { "n", "<Plug>GoNDLineUp" }, { "n", "<Plug>GoNMLineDown" }, { "n", "<Plug>GoNMLineUp" }, { "x", "<Plug>GoVDLineDown" }, { "x", "<Plug>GoVDLineUp" }, { "x", "<Plug>GoVMLineDown" }, { "x", "<Plug>GoVMLineUp" }, { "x", "<Plug>GoVSDDown" }, { "x", "<Plug>GoVSDLeft" }, { "x", "<Plug>GoVSDRight" }, { "x", "<Plug>GoVSDUp" }, { "x", "<Plug>GoVSMDown" }, { "x", "<Plug>GoVSMLeft" }, { "x", "<Plug>GoVSMRight" }, { "x", "<Plug>GoVSMUp" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/nvim-gomove",
    url = "https://github.com/booperlv/nvim-gomove"
  },
  ["nvim-hlslens"] = {
    config = { 'require("config.hlslens")' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/nvim-hlslens",
    url = "https://github.com/kevinhwang91/nvim-hlslens"
  },
  ["nvim-lastplace"] = {
    config = { 'require"nvim-lastplace".setup{}' },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/nvim-lastplace",
    url = "https://github.com/ethanholz/nvim-lastplace"
  },
  ["nvim-lazy-inner-block"] = {
    config = { 'require"nvim-lazy-inner-block".setup{}' },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/nvim-lazy-inner-block",
    url = "https://github.com/s1n7ax/nvim-lazy-inner-block"
  },
  ["nvim-lsp-installer"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    config = { 'require("config.lsp");vim.cmd"doautocmd BufReadPost"' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-notify"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-peekup"] = {
    keys = { { "n", "<char-34><char-34>" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/nvim-peekup",
    url = "https://github.com/gennaro-tedesco/nvim-peekup"
  },
  ["nvim-pqf"] = {
    config = { 'require"pqf".setup{}' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/nvim-pqf",
    url = "https://gitlab.com/yorickpeterse/nvim-pqf"
  },
  ["nvim-quick-switcher"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/nvim-quick-switcher",
    url = "https://github.com/everduin94/nvim-quick-switcher"
  },
  ["nvim-snippy"] = {
    config = { 'require("config.snippy")' },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/nvim-snippy",
    url = "https://github.com/dcampos/nvim-snippy"
  },
  ["nvim-spectre"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/nvim-spectre",
    url = "https://github.com/nvim-pack/nvim-spectre"
  },
  ["nvim-surround"] = {
    config = { 'require"nvim-surround".setup{}' },
    keys = { { "i", "<C-g>s" }, { "i", "<C-g>S" }, { "n", "ys" }, { "n", "yS" }, { "x", "S" }, { "x", "gS" }, { "n", "cs" }, { "n", "ds" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/nvim-surround",
    url = "https://github.com/kylechui/nvim-surround"
  },
  ["nvim-terminal.lua"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/nvim-terminal.lua",
    url = "https://github.com/norcalli/nvim-terminal.lua"
  },
  ["nvim-tetris"] = {
    commands = { "Tetris" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/nvim-tetris",
    url = "https://github.com/alec-gibson/nvim-tetris"
  },
  ["nvim-treehopper"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/nvim-treehopper",
    url = "https://github.com/mfussenegger/nvim-treehopper"
  },
  ["nvim-treesitter"] = {
    config = { 'require("config.treesitter")' },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-endwise"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/nvim-treesitter-endwise",
    url = "https://github.com/rrethy/nvim-treesitter-endwise"
  },
  ["nvim-treesitter-pairs"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-pairs",
    url = "https://github.com/theHamsta/nvim-treesitter-pairs"
  },
  ["nvim-treesitter-refactor"] = {
    config = { 'vim.cmd"TSEnable refactor.smart_rename"' },
    keys = { { "n", "gR" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-refactor",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-refactor"
  },
  ["nvim-trevj.lua"] = {
    config = { "\27LJ\2\ne\0\0\5\0\6\0\b6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0B\0\4\1K\0\1\0.:lua require(\"trevj\").format_at_cursor()\r\agS\6n\bset\vkeymap\bvim\0" },
    keys = { { "n", "gS" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/nvim-trevj.lua",
    url = "https://github.com/acksld/nvim-trevj.lua"
  },
  ["nvim-ts-autotag"] = {
    config = { 'vim.cmd"TSEnable autotag"' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-ts-rainbow"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-window"] = {
    config = { "\27LJ\2\n|\0\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\2\fnoremap\2\vsilent\2(:lua require(\"nvim-window\").pick()\r\f<C-w>g \6n\bset\vkeymap\bvim\0" },
    keys = { { "", "<C-w>g " } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/nvim-window",
    url = "https://gitlab.com/yorickpeterse/nvim-window"
  },
  ["nvim-window-picker"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/nvim-window-picker",
    url = "https://github.com/s1n7ax/nvim-window-picker"
  },
  ["nvim-yati"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/nvim-yati",
    url = "https://github.com/yioneko/nvim-yati"
  },
  nvimesweeper = {
    commands = { "Nvimesweeper" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/nvimesweeper",
    url = "https://github.com/seandewar/nvimesweeper"
  },
  oak = {
    after_files = { "/home/user/.local/share/nvim/site/pack/packer/opt/oak/after/plugin/oak.vim" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/oak",
    url = "https://github.com/vigoux/oak"
  },
  ["oceanic-next"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/oceanic-next",
    url = "https://github.com/mhartington/oceanic-next"
  },
  ["onedark.nvim"] = {
    config = { 'vim.cmd"colorschem onedark"' },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/onedark.nvim",
    url = "https://github.com/mjlbach/onedark.nvim"
  },
  ["onenord.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/onenord.nvim",
    url = "https://github.com/rmehri01/onenord.nvim"
  },
  ["open-browser.vim"] = {
    config = { "\27LJ\2\nª\1\0\0\6\0\t\0\0176\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\a\0'\3\4\0'\4\5\0005\5\b\0B\0\5\1K\0\1\0\1\0\2\fnoremap\2\vsilent\2\6x\1\0\2\fnoremap\2\vsilent\2%<Plug>(openbrowser-smart-search)\agx\6n\bset\vkeymap\bvim\0" },
    keys = { { "x", "gx" }, { "n", "gx" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/open-browser.vim",
    url = "https://github.com/tyru/open-browser.vim"
  },
  ["overlength.vim"] = {
    config = { "\27LJ\2\nV\0\0\3\0\4\0\0066\0\0\0009\0\1\0009\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\3\0\0\tterm\14dashboard!overlength#disable_filetypes\afn\bvim\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/overlength.vim",
    url = "https://github.com/tjdevries/overlength.vim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["peepsight.nvim"] = {
    commands = { "Peepsight", "PeepsightEnable", "PeepsightDisable" },
    config = { 'require"peepsight".setup{ "function_definition" }' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/peepsight.nvim",
    url = "https://github.com/koenverburg/peepsight.nvim"
  },
  penvim = {
    config = { 'require"penvim".setup{\n  project_env = {\n    enable = false\n  },\n  rooter = {\n    enable = false\n  }\n}' },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/penvim",
    url = "https://github.com/shaeinst/penvim"
  },
  pinkmare = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/pinkmare",
    url = "https://github.com/matsuuu/pinkmare"
  },
  ["plantuml-previewer.vim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/plantuml-previewer.vim",
    url = "https://github.com/weirongxu/plantuml-previewer.vim"
  },
  ["plantuml-syntax"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/plantuml-syntax",
    url = "https://github.com/aklt/plantuml-syntax"
  },
  playground = {
    commands = { "TSPlaygroundToggle" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["pounce.nvim"] = {
    commands = { "Pounce" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/pounce.nvim",
    url = "https://github.com/rlane/pounce.nvim"
  },
  ["presence.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/presence.nvim",
    url = "https://github.com/andweeb/presence.nvim"
  },
  ["pretty-fold.nvim"] = {
    config = { 'require"pretty-fold".setup{}' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/pretty-fold.nvim",
    url = "https://github.com/anuvyklack/pretty-fold.nvim"
  },
  ["project-templates.nvim"] = {
    commands = { "LoadTemplate", "DeleteTemplate", "SaveAsTemplate" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/project-templates.nvim",
    url = "https://github.com/pianocomposer321/project-templates.nvim"
  },
  pyro = {
    commands = { "Pyro" },
    config = { "\27LJ\2\n¹\1\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0™\1      if g:loaded_remote_plugins==1\n        unlet g:loaded_remote_plugins\n        source /usr/share/nvim/runtime/plugin/rplugin.vim\n      endif\n    \bcmd\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/pyro",
    url = "https://github.com/rraks/pyro"
  },
  ["range-highlight.nvim"] = {
    config = { 'require"range-highlight".setup{}' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/range-highlight.nvim",
    url = "https://github.com/winston0410/range-highlight.nvim"
  },
  ["reach.nvim"] = {
    commands = { "ReachOpen" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/reach.nvim",
    url = "https://github.com/toppair/reach.nvim"
  },
  ["refactoring.nvim"] = {
    config = { "\27LJ\2\nÉ\4\0\0\6\0\r\0\0256\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\a\0'\4\b\0005\5\t\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\n\0'\4\v\0005\5\f\0B\0\5\1K\0\1\0\1\0\2\fnoremap\2\vsilent\2Ö\1<Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>,{noremap=true,silent=true})\nvim.api.nvim_set_keymap('x','<leader>ri',[[<Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>\15<leader>rv\1\0\2\fnoremap\2\vsilent\2R<Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>\15<leader>rf\1\0\2\fnoremap\2\vsilent\2J<Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>\15<leader>re\6x\20nvim_set_keymap\bapi\bvim\0" },
    keys = { { "x", "\\re" }, { "x", "\\rf" }, { "x", "\\rv" }, { "x", "\\ri" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/refactoring.nvim",
    url = "https://github.com/ThePrimeagen/refactoring.nvim"
  },
  rnvimr = {
    commands = { "RnvimrToggle", "RnvimrResize", "RnvimrStartBackground" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/rnvimr",
    url = "https://github.com/kevinhwang91/rnvimr"
  },
  ["samwise.nvim"] = {
    commands = { "SamwiseMoveBack", "SamwiseMoveFwd", "SamwiseToggleBuffer", "SamwiseToggleHighlight" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/samwise.nvim",
    url = "https://github.com/rexagod/samwise.nvim"
  },
  ["scratch.vim"] = {
    commands = { "Scratch", "ScratchInsert", "ScratchPreview", "ScratchSelection" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/scratch.vim",
    url = "https://github.com/mtth/scratch.vim"
  },
  ["sideways.vim"] = {
    config = { "\27LJ\2\nš\2\0\0\6\0\16\0!6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\a\0'\4\b\0005\5\t\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\n\0'\4\v\0005\5\f\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\r\0'\4\14\0005\5\15\0B\0\5\1K\0\1\0\1\0\1\vsilent\2\23:SidewaysJumpLeft\r\a<A\1\0\1\vsilent\2\24:SidewaysJumpRight\r\a>A\1\0\1\vsilent\2\19:SidewaysLeft\r\a<a\1\0\1\vsilent\2\20:SidewaysRight\r\a>a\6n\bset\vkeymap\bvim\0" },
    keys = { { "n", ">a" }, { "n", "<a" }, { "n", ">A" }, { "n", "<A" } },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/sideways.vim",
    url = "https://github.com/AndrewRadev/sideways.vim"
  },
  ["simplebuffer.vim"] = {
    commands = { "SimpleBuffer", "SimpleBufferClose", "SimpleBufferToggle" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/simplebuffer.vim",
    url = "https://github.com/codcodog/simplebuffer.vim"
  },
  sniprun = {
    commands = { "SnipRun", "SnipInfo", "SnipClose", "SnipReset", "SnipTerminate", "SnipReplMemoryClean" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/sniprun",
    url = "https://github.com/michaelb/sniprun"
  },
  ["sort.nvim"] = {
    commands = { "Sort" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/sort.nvim",
    url = "https://github.com/sqve/sort.nvim"
  },
  spacecamp = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/spacecamp",
    url = "https://github.com/jaredgorski/spacecamp"
  },
  ["spellsitter.nvim"] = {
    config = { 'require"spellsitter".setup{}' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/spellsitter.nvim",
    url = "https://github.com/lewis6991/spellsitter.nvim"
  },
  ["splitjoin.vim"] = {
    keys = { { "", "gJ" } },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/splitjoin.vim",
    url = "https://github.com/andrewradev/splitjoin.vim"
  },
  ["stabilize.nvim"] = {
    config = { 'require"stabilize".setup{}' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/stabilize.nvim",
    url = "https://github.com/luukvbaal/stabilize.nvim"
  },
  ["stickybuf.nvim"] = {
    commands = { "PinBuffer", "PinBuftype", "PinFiletype", "UnpinBuffer" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/stickybuf.nvim",
    url = "https://github.com/stevearc/stickybuf.nvim"
  },
  ["structlog.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/structlog.nvim",
    url = "https://github.com/tastyep/structlog.nvim"
  },
  ["switch.vim"] = {
    commands = { "Switch", "SwitchExtend", "SwitchReverse" },
    keys = { { "", "gs" } },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/switch.vim",
    url = "https://github.com/andrewradev/switch.vim"
  },
  ["symbols-outline.nvim"] = {
    commands = { "SymbolsOutline", "SymbolsOutlineOpen", "SymbolsOutlineClose" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/symbols-outline.nvim",
    url = "https://github.com/simrat39/symbols-outline.nvim"
  },
  ["synonyms.vim"] = {
    commands = { "Synonyms", "SynonymsSelection" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/synonyms.vim",
    url = "https://github.com/sanhajio/synonyms.vim"
  },
  ["syntax-tree-surfer"] = {
    config = { 'require("config.gomove-treesurfer")' },
    keys = { { "n", "vx" }, { "n", "vn" }, { "n", "<A-j>" }, { "n", "<A-k>" }, { "n", "<A-S-k>" }, { "n", "<A-S-j>" }, { "n", "<C-S-o>" }, { "n", "gFu" }, { "n", "gFe" }, { "n", "gFo" }, { "n", "gFv" }, { "n", "gFs" }, { "n", "gFi" }, { "n", "gFa" }, { "n", "<A-i>" }, { "n", "<A-o>" }, { "x", "<C-j>" }, { "x", "<C-k>" }, { "x", "<C-h>" }, { "x", "<C-l>" }, { "x", "<C-S-h>" }, { "x", "<C-S-j>" }, { "x", "<C-S-k>" }, { "x", "<C-S-l>" }, { "x", "<A-k>" }, { "x", "<A-j>" }, { "x", "<A-S-k>" }, { "x", "<A-S-j>" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/syntax-tree-surfer",
    url = "https://github.com/ziontee113/syntax-tree-surfer"
  },
  ["tabout.nvim"] = {
    config = { 'require"tabout".setup{\n  act_as_tab = false,\n  backwards_tabkey = "<A-S-tab>",\n  tabkey = "<A-tab>"\n}' },
    keys = { { "i", "<A-tab>" }, { "i", "<A-S-tab>" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/tabout.nvim",
    url = "https://github.com/abecodes/tabout.nvim"
  },
  tabular = {
    after_files = { "/home/user/.local/share/nvim/site/pack/packer/opt/tabular/after/plugin/TabularMaps.vim" },
    commands = { "Tabularize" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/tabular",
    url = "https://github.com/godlygeek/tabular"
  },
  tagbar = {
    commands = { "TagbarToggle" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/tagbar",
    url = "https://github.com/majutsushi/tagbar"
  },
  ["telekasten.nvim"] = {
    commands = { "Telekasten" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/telekasten.nvim",
    url = "https://github.com/renerocksai/telekasten.nvim"
  },
  ["telescope-asynctasks.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/telescope-asynctasks.nvim",
    url = "https://github.com/GustavoKatel/telescope-asynctasks.nvim"
  },
  ["telescope-cc.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/telescope-cc.nvim",
    url = "https://github.com/olacin/telescope-cc.nvim"
  },
  ["telescope-changed-files"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/telescope-changed-files",
    url = "https://github.com/axkirillov/telescope-changed-files"
  },
  ["telescope-file-browser.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/telescope-file-browser.nvim",
    url = "https://github.com/nvim-telescope/telescope-file-browser.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope-github.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/telescope-github.nvim",
    url = "https://github.com/nvim-telescope/telescope-github.nvim"
  },
  ["telescope-gitmoji.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/telescope-gitmoji.nvim",
    url = "https://github.com/olacin/telescope-gitmoji.nvim"
  },
  ["telescope-hop.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/telescope-hop.nvim",
    url = "https://github.com/nvim-telescope/telescope-hop.nvim"
  },
  ["telescope-live-grep-args.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/telescope-live-grep-args.nvim",
    url = "https://github.com/nvim-telescope/telescope-live-grep-args.nvim"
  },
  ["telescope-packer.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/telescope-packer.nvim",
    url = "https://github.com/nvim-telescope/telescope-packer.nvim"
  },
  ["telescope-project.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/telescope-project.nvim",
    url = "https://github.com/nvim-telescope/telescope-project.nvim"
  },
  ["telescope-rs.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/telescope-rs.nvim",
    url = "https://github.com/nvim-telescope/telescope-rs.nvim"
  },
  ["telescope-symbols.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/telescope-symbols.nvim",
    url = "https://github.com/nvim-telescope/telescope-symbols.nvim"
  },
  ["telescope-tele-tabby.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/telescope-tele-tabby.nvim",
    url = "https://github.com/tc72/telescope-tele-tabby.nvim"
  },
  ["telescope-ui-select.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/telescope-ui-select.nvim",
    url = "https://github.com/nvim-telescope/telescope-ui-select.nvim"
  },
  ["telescope-vim-bookmarks.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/telescope-vim-bookmarks.nvim",
    url = "https://github.com/tom-anders/telescope-vim-bookmarks.nvim"
  },
  ["telescope.nvim"] = {
    commands = { "Telescope" },
    config = { "\27LJ\2\n4\2\0\3\1\2\0\a-\0\0\0009\0\0\0009\0\1\0009\0\1\0G\2\0\0A\0\0\1K\0\1\0\0À\bhop\15extensions»\1\1\0\b\0\15\0\0226\0\0\0'\2\1\0B\0\2\0029\1\2\0'\3\3\0B\1\2\0019\1\2\0'\3\4\0B\1\2\0019\1\5\0005\3\r\0005\4\v\0005\5\t\0005\6\a\0003\a\6\0=\a\b\6=\6\n\5=\5\f\4=\4\14\3B\1\2\0012\0\0€K\0\1\0\rdefaults\1\0\0\rmappings\1\0\0\6i\1\0\0\n<C-h>\1\0\0\0\nsetup\14ui-select\bfzf\19load_extension\14telescope\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["text-case.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/text-case.nvim",
    url = "https://github.com/johmsalas/text-case.nvim"
  },
  ["textobj-word-column.vim"] = {
    keys = { { "o", "ic" }, { "o", "ac" }, { "x", "ic" }, { "x", "ac" }, { "o", "iC" }, { "o", "aC" }, { "x", "iC" }, { "x", "aC" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/textobj-word-column.vim",
    url = "https://github.com/coderifous/textobj-word-column.vim"
  },
  ["thesaurus_query.vim"] = {
    commands = { "Thesaurus", "ThesaurusQueryReplaceCurrentWord", "ThesaurusQueryLookupCurrentWord", "ThesaurusQueryReplace" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/thesaurus_query.vim",
    url = "https://github.com/ron89/thesaurus_query.vim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ["translate-shell.vim"] = {
    after_files = { "/home/user/.local/share/nvim/site/pack/packer/opt/translate-shell.vim/after/plugin/fzf.vim" },
    commands = { "Trans", "TransSelectDirection", "TransInteractive", "TransTerm", "TransOpenHistoryWindow", "TransChangeDefaultDirection", "FZFTransSelectDirection", "FZFTransInteractive", "FZFTransChangeDefaultDirection" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/translate-shell.vim",
    url = "https://github.com/echuraev/translate-shell.vim"
  },
  ["truezen.nvim"] = {
    commands = { "TZMinimalist", "TZFocus", "TZAtaraxis" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/truezen.nvim",
    url = "https://github.com/pocco81/truezen.nvim"
  },
  ["twilight.nvim"] = {
    commands = { "Twilight" },
    config = { 'require"twilight".setup{}' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/twilight.nvim",
    url = "https://github.com/folke/twilight.nvim"
  },
  undotree = {
    config = { 'require"undotree".setup{\n  keymaps = {},\n  window = {\n    winblend = 30\n  }\n}' },
    loaded = false,
    needs_bufread = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/undotree",
    url = "https://github.com/jiaoshijie/undotree"
  },
  ["urlview.vim"] = {
    commands = { "Urlview" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/urlview.vim",
    url = "https://github.com/strboul/urlview.vim"
  },
  ["venn.nvim"] = {
    commands = { "VBox", "VBoxD", "VBoxH", "VBoxO", "VBoxDO", "VBoxHO", "VFill" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/venn.nvim",
    url = "https://github.com/jbyuki/venn.nvim"
  },
  vim = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/vim",
    url = "https://github.com/challenger-deep-theme/vim"
  },
  ["vim-abolish"] = {
    commands = { "Abolish", "Subvert" },
    keys = { { "n", "cr" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-abolish",
    url = "https://github.com/tpope/vim-abolish"
  },
  ["vim-accordion"] = {
    commands = { "Accordion", "AccordionAll", "AccordionDiff", "AccordionStop", "AccordionZoomIn", "AccordionZoomOut", "AccordionOnce", "AccordionClear" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-accordion",
    url = "https://github.com/mattboehm/vim-accordion"
  },
  ["vim-after-object"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-after-object",
    url = "https://github.com/junegunn/vim-after-object"
  },
  ["vim-bookmarks"] = {
    keys = { { "", "mg" }, { "", "mjj" }, { "", "mkk" }, { "", "mx" }, { "", "mc" }, { "", "mp" }, { "", "mn" }, { "", "mi" }, { "", "mm" }, { "", "ma" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-bookmarks",
    url = "https://github.com/mattesgroeger/vim-bookmarks"
  },
  ["vim-buffest"] = {
    commands = { "Regsplit", "Regvsplit", "Regtabedit", "Regedit", "Regpedit", "Qflistsplit", "Qflistvsplit", "Qflisttabedit", "Qflistedit", "Loclistsplit", "Loclistvsplit", "Loclisttabedit", "Loclistedit" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-buffest",
    url = "https://github.com/rbong/vim-buffest"
  },
  ["vim-characterize"] = {
    keys = { { "n", "ga" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-characterize",
    url = "https://github.com/tpope/vim-characterize"
  },
  ["vim-choosewin"] = {
    config = { "\27LJ\2\n…\1\0\0\6\0\t\0\r6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\3\0009\0\4\0'\2\5\0'\3\6\0'\4\a\0005\5\b\0B\0\5\1K\0\1\0\1\0\1\vsilent\2\16:ChooseWin\r\v<C-w> \6n\bset\vkeymap\29choosewin_overlay_enable\6g\bvim\0" },
    keys = { { "", "<C-w> " } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-choosewin",
    url = "https://github.com/t9md/vim-choosewin"
  },
  ["vim-codespell"] = {
    commands = { "Codespell" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-codespell",
    url = "https://github.com/shinglyu/vim-codespell"
  },
  ["vim-colortemplate"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-colortemplate",
    url = "https://github.com/lifepillar/vim-colortemplate"
  },
  ["vim-convert-color-to"] = {
    commands = { "ConvertColorTo" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-convert-color-to",
    url = "https://github.com/amadeus/vim-convert-color-to"
  },
  ["vim-dadbod"] = {
    commands = { "DB" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-dadbod",
    url = "https://github.com/tpope/vim-dadbod"
  },
  ["vim-dirdiff"] = {
    commands = { "DirDiff" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-dirdiff",
    url = "https://github.com/will133/vim-dirdiff"
  },
  ["vim-ditto"] = {
    commands = { "Ditto", "DittoSent", "DittoPar", "DittoFile", "DittoOn", "DittoOff", "DittoUpdate", "DittoSentOn", "DittoParOn", "DittoFileOn", "NoDitto", "ToggleDitto" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-ditto",
    url = "https://github.com/dbmrq/vim-ditto"
  },
  ["vim-easy-align"] = {
    commands = { "EasyAlign", "LiveEasyAlign" },
    config = { "\27LJ\2\nŸ\1\0\0\6\0\t\0\0176\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\a\0'\3\4\0'\4\5\0005\5\b\0B\0\5\1K\0\1\0\1\0\2\fnoremap\2\vsilent\2\6x\1\0\2\fnoremap\2\vsilent\2\26<Plug>(LiveEasyAlign)\agb\6n\bset\vkeymap\bvim\0" },
    keys = { { "x", "gb" }, { "n", "gb" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-easy-align",
    url = "https://github.com/junegunn/vim-easy-align"
  },
  ["vim-eunuch"] = {
    commands = { "Cfind", "Chmod", "Clocate", "Copy", "Delete", "Duplicate", "Lfind", "Llocate", "Mkdir", "Move", "Remove", "Rename", "SudoEeit", "SudoWrite", "Unlink", "W", "Wall" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-eunuch",
    url = "https://github.com/tpope/vim-eunuch"
  },
  ["vim-exchange"] = {
    keys = { { "n", "cx" }, { "x", "X" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-exchange",
    url = "https://github.com/tommcdo/vim-exchange"
  },
  ["vim-express"] = {
    commands = { "MapExpress", "MapSubpress" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-express",
    url = "https://github.com/tommcdo/vim-express"
  },
  ["vim-fetch"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/vim-fetch",
    url = "https://github.com/wsdjeg/vim-fetch"
  },
  ["vim-floaterm"] = {
    commands = { "FloatermToggle" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-floaterm",
    url = "https://github.com/voldikss/vim-floaterm"
  },
  ["vim-flog"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-flog",
    url = "https://github.com/rbong/vim-flog"
  },
  ["vim-foolish-move"] = {
    config = { "\27LJ\2\nú\3\0\0\6\0\19\0)6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\a\0'\4\b\0005\5\t\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\n\0'\4\v\0005\5\f\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\r\0'\4\14\0005\5\15\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\16\0'\4\17\0005\5\18\0B\0\5\1K\0\1\0\1\0\2\fnoremap\2\vsilent\2$:<C-u>call foolish_move#stop()\r\ag\27\1\0\2\fnoremap\2\vsilent\2,:<C-u>call foolish_move#flick(\"right\")\r\vg<A-l>\1\0\2\fnoremap\2\vsilent\2):<C-u>call foolish_move#flick(\"up\")\r\vg<A-k>\1\0\2\fnoremap\2\vsilent\2+:<C-u>call foolish_move#flick(\"down\")\r\vg<A-j>\1\0\2\fnoremap\2\vsilent\2+:<C-u>call foolish_move#flick(\"left\")\r\vg<A-h>\6n\bset\vkeymap\bvim\0" },
    keys = { { "n", "g<A-h>" }, { "n", "g<A-j>" }, { "n", "g<A-k>" }, { "n", "g<A-l>" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-foolish-move",
    url = "https://github.com/hrsh7th/vim-foolish-move"
  },
  ["vim-fugitive"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-game_engine"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/vim-game_engine",
    url = "https://github.com/rbtnn/vim-game_engine"
  },
  ["vim-ghost"] = {
    commands = { "GhostStart" },
    config = { "\27LJ\2\n¹\1\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0™\1      if g:loaded_remote_plugins==1\n        unlet g:loaded_remote_plugins\n        source /usr/share/nvim/runtime/plugin/rplugin.vim\n      endif\n    \bcmd\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-ghost",
    url = "https://github.com/raghur/vim-ghost"
  },
  ["vim-grammarous"] = {
    commands = { "GrammarousCheck", "GrammarousReset" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-grammarous",
    url = "https://github.com/rhysd/vim-grammarous"
  },
  ["vim-hexokinase"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-hexokinase",
    url = "https://github.com/rrethy/vim-hexokinase"
  },
  ["vim-highlighter"] = {
    keys = { { "", "M<CR>" }, { "", "M<BS>" }, { "", "M<C-l>" }, { "", "M<Tab>" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-highlighter",
    url = "https://github.com/azabiong/vim-highlighter"
  },
  ["vim-hp"] = {
    commands = { "HpGenerateContents", "HpRefresh", "HpLeftRight" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-hp",
    url = "https://github.com/dokwork/vim-hp"
  },
  ["vim-im-select"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-im-select",
    url = "https://github.com/brglng/vim-im-select"
  },
  ["vim-indent-object"] = {
    keys = { { "o", "ii" }, { "o", "ai" }, { "x", "ii" }, { "x", "ai" }, { "o", "iI" }, { "o", "aI" }, { "x", "iI" }, { "x", "aI" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-indent-object",
    url = "https://github.com/michaeljsmith/vim-indent-object"
  },
  ["vim-indentwise"] = {
    keys = { { "n", "[-" }, { "n", "[+" }, { "n", "[=" }, { "n", "[_" }, { "n", "[%" }, { "n", "]-" }, { "n", "]+" }, { "n", "]=" }, { "n", "]_" }, { "n", "]%" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-indentwise",
    url = "https://github.com/jeetsukumaran/vim-indentwise"
  },
  ["vim-libmodal"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/vim-libmodal",
    url = "https://github.com/Iron-E/vim-libmodal"
  },
  ["vim-lion"] = {
    keys = { { "x", "gl" }, { "n", "gl" }, { "x", "gL" }, { "n", "gL" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-lion",
    url = "https://github.com/tommcdo/vim-lion"
  },
  ["vim-magnum"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/vim-magnum",
    url = "https://github.com/glts/vim-magnum"
  },
  ["vim-mario"] = {
    commands = { "Mario" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-mario",
    url = "https://github.com/rbtnn/vim-mario"
  },
  ["vim-markdown-toc"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-markdown-toc",
    url = "https://github.com/mzlogin/vim-markdown-toc"
  },
  ["vim-mundo"] = {
    commands = { "MundoToggle" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-mundo",
    url = "https://github.com/simnalamburt/vim-mundo"
  },
  ["vim-pad"] = {
    commands = { "Pad" },
    config = { "\27LJ\2\n9\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\20/home/user/.pad\fpad#dir\6g\bvim\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-pad",
    url = "https://github.com/fmoralesc/vim-pad"
  },
  ["vim-plugin-ansiesc"] = {
    commands = { "AnsiEsc" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-plugin-ansiesc",
    url = "https://github.com/powerman/vim-plugin-ansiesc"
  },
  ["vim-puyo"] = {
    commands = { "Puyo" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-puyo",
    url = "https://github.com/rbtnn/vim-puyo"
  },
  ["vim-radical"] = {
    keys = { { "n", "gA" }, { "n", "crx" }, { "n", "cro" }, { "n", "crd" }, { "n", "crb" }, { "x", "gA" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-radical",
    url = "https://github.com/glts/vim-radical"
  },
  ["vim-rt-format"] = {
    commands = { "RTFormatEnable" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-rt-format",
    url = "https://github.com/skywind3000/vim-rt-format"
  },
  ["vim-slumlord"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-slumlord",
    url = "https://github.com/scrooloose/vim-slumlord"
  },
  ["vim-smalls"] = {
    commands = { "Smalls", "SmallsExcursion" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-smalls",
    url = "https://github.com/t9md/vim-smalls"
  },
  ["vim-sneak"] = {
    keys = { { "n", "s" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-sneak",
    url = "https://github.com/justinmk/vim-sneak"
  },
  ["vim-snippets"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/vim-snippets",
    url = "https://github.com/honza/vim-snippets"
  },
  ["vim-split-line"] = {
    config = { "\27LJ\2\nb\0\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\2\fnoremap\2\vsilent\2\16:SplitLine\r\n<A-s>\6n\bset\vkeymap\bvim\0" },
    keys = { { "n", "<A-s>" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-split-line",
    url = "https://github.com/drzel/vim-split-line"
  },
  ["vim-table-mode"] = {
    commands = { "TableModeToggle" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-table-mode",
    url = "https://github.com/dhruvasagar/vim-table-mode"
  },
  ["vim-tabmode"] = {
    commands = { "TabmodeEnter" },
    keys = { { "n", "\\<tab>" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-tabmode",
    url = "https://github.com/iron-e/vim-tabmode"
  },
  ["vim-textobj-blanklines"] = {
    keys = { { "o", "i<space>" }, { "o", "a<space>" }, { "x", "i<space>" }, { "x", "a<space>" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-textobj-blanklines",
    url = "https://github.com/deathlyfrantic/vim-textobj-blanklines"
  },
  ["vim-textobj-user"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/vim-textobj-user",
    url = "https://github.com/kana/vim-textobj-user"
  },
  ["vim-textobj-variable-segment"] = {
    keys = { { "o", "iv" }, { "o", "av" }, { "x", "iv" }, { "x", "av" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-textobj-variable-segment",
    url = "https://github.com/Julian/vim-textobj-variable-segment"
  },
  ["vim-tranquille"] = {
    keys = { { "", "g/" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-tranquille",
    url = "https://github.com/rrethy/vim-tranquille"
  },
  ["vim-translator"] = {
    commands = { "Translate", "TranslateW", "TranslateR", "TranslateX", "TranslateH", "TranslateL" },
    config = { 'require("config.translator")' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-translator",
    url = "https://github.com/voldikss/vim-translator"
  },
  ["vim-visual-increment"] = {
    keys = { { "x", "g<C-a>" }, { "x", "g<C-x>" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-visual-increment",
    url = "https://github.com/triglav/vim-visual-increment"
  },
  ["vim-windowswap"] = {
    keys = { { "", "\\ww" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-windowswap",
    url = "https://github.com/wesQ3/vim-windowswap"
  },
  ["vim-wordy"] = {
    commands = { "Wordy" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-wordy",
    url = "https://github.com/reedes/vim-wordy"
  },
  ["vim-you-keep-using-that-word"] = {
    keys = { { "o", "w" }, { "o", "W" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-you-keep-using-that-word",
    url = "https://github.com/ap/vim-you-keep-using-that-word"
  },
  ["visual-split.vim"] = {
    commands = { "VSSplit", "VSSplitAbove", "VSSplitBelow", "VSResize" },
    keys = { { "n", "<C-W>gr" }, { "n", "<C-W>gss" }, { "n", "<C-W>gsa" }, { "n", "<C-W>gsb" }, { "x", "<C-W>gr" }, { "x", "<C-W>gss" }, { "x", "<C-W>gsa" }, { "x", "<C-W>gsb" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/visual-split.vim",
    url = "https://github.com/wellle/visual-split.vim"
  },
  wheel = {
    after_files = { "/home/user/.local/share/nvim/site/pack/packer/opt/wheel/after/plugin/wheel.vim" },
    commands = { "Wheel" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/wheel",
    url = "https://github.com/chimay/wheel"
  },
  ["which-key.nvim"] = {
    config = { 'require("config.which-key")' },
    keys = { { "n", "<space>" }, { "n", "g" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  },
  ["winshift.nvim"] = {
    config = { "\27LJ\2\nè\1\0\0\f\0\14\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\3\0005\2\4\0B\0\2\4H\3\14€6\5\5\0009\5\6\0059\5\a\5'\a\b\0'\b\t\0\18\t\3\0'\n\n\0&\b\n\b'\t\v\0\18\n\4\0'\v\f\0&\t\v\t5\n\r\0B\5\5\1F\3\3\3R\3ð\127K\0\1\0\1\0\2\fnoremap\2\vsilent\2\6\r\15:WinShift \6>\n<C-S-\6n\bset\vkeymap\bvim\1\0\4\6j\tdown\6l\nright\6k\aup\6h\tleft\npairs\nsetup\rwinshift\frequire\0" },
    keys = { { "n", "<C-S-h>" }, { "n", "<C-S-j>" }, { "n", "<C-S-k>" }, { "n", "<C-S-l>" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/winshift.nvim",
    url = "https://github.com/sindrets/winshift.nvim"
  },
  ["workspace.vim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/workspace.vim",
    url = "https://github.com/dosimple/workspace.vim"
  },
  ["yanky.nvim"] = {
    config = { 'require("config.yanky")' },
    keys = { { "n", "p" }, { "n", "P" }, { "n", "<A-p>" }, { "n", "<A-P>" }, { "n", "<C-p>" }, { "n", "<C-n>" }, { "x", "p" }, { "x", "P" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/yanky.nvim",
    url = "https://github.com/gbprod/yanky.nvim"
  },
  ["zen-mode.nvim"] = {
    commands = { "ZenMode" },
    config = { 'require"zen-mode".setup{}' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/zen-mode.nvim",
    url = "https://github.com/folke/zen-mode.nvim"
  },
  ["zoxide.vim"] = {
    commands = { "Z", "Zi" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/zoxide.vim",
    url = "https://github.com/nanotee/zoxide.vim"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^bex"] = "bex.nvim",
  ["^cmp_tabnine"] = "cmp-tabnine",
  ["^comment%-box"] = "comment-box.nvim",
  ["^fennel%-nvim"] = "fennel-nvim",
  ["^fwatch"] = "fwatch.nvim",
  ["^harpoon"] = "harpoon",
  ["^hologram"] = "hologram.nvim",
  ["^hop"] = "hop.nvim",
  ["^jumpwire"] = "jumpwire.nvim",
  ["^neogen"] = "neogen",
  ["^neoscroll"] = "neoscroll.nvim",
  ["^notify"] = "nvim-notify",
  ["^nvim%-comment%-frame"] = "nvim-comment-frame",
  ["^nvim%-lsp%-installer"] = "nvim-lsp-installer",
  ["^nvim%-quick%-switcher"] = "nvim-quick-switcher",
  ["^plenary"] = "plenary.nvim",
  ["^presence"] = "presence.nvim",
  ["^spectre"] = "nvim-spectre",
  ["^structlog"] = "structlog.nvim",
  ["^textcase"] = "text-case.nvim",
  ["^tsht"] = "nvim-treehopper",
  ["^twilight"] = "twilight.nvim",
  ["^value_animator"] = "nvim-animator",
  ["^window%-picker"] = "nvim-window-picker"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
      to_load[#to_load + 1] = plugin_name
    end
  end

  if #to_load > 0 then
    require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
    local loaded_mod = package.loaded[module_name]
    if loaded_mod then
      return function(modname) return loaded_mod end
    end
  end
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Setup for: vim-highlighter
time([[Setup for vim-highlighter]], true)
try_loadstring("\27LJ\2\nˆ\1\0\0\2\0\n\0\0176\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\1\0'\1\a\0=\1\6\0006\0\0\0009\0\1\0'\1\t\0=\1\b\0K\0\1\0\vM<tab>\vHiFind\vM<C-L>\fHiClear\nM<BS>\fHiErase\nM<CR>\nHiSet\6g\bvim\0", "setup", "vim-highlighter")
time([[Setup for vim-highlighter]], false)
-- Setup for: scratch.vim
time([[Setup for scratch.vim]], true)
try_loadstring("\27LJ\2\n5\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0\24scratch_no_mappings\6g\bvim\0", "setup", "scratch.vim")
time([[Setup for scratch.vim]], false)
-- Setup for: dirbuf.nvim
time([[Setup for dirbuf.nvim]], true)
try_loadstring("\27LJ\2\n”\1\0\0\4\0\5\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0005\3\4\0B\0\3\1K\0\1\0\1\0\1\fcommandEif isdirectory(expand('%')) && !&modified|execute 'Dirbuf'|endif\rBufEnter\24nvim_create_autocmd\bapi\bvim\0", "setup", "dirbuf.nvim")
time([[Setup for dirbuf.nvim]], false)
-- Setup for: vim-flog
time([[Setup for vim-flog]], true)
try_loadstring("\27LJ\2\n¹\2\0\1\a\0\6\0\v6\1\0\0009\1\1\0019\1\2\1\18\3\0\0'\4\3\0\18\5\0\0'\6\4\0&\4\6\0045\5\5\0B\1\4\1K\0\1\0\1\0\4\tbang\2\rcomplete\tfile\nrange\2\nnargs\6*Z\",l1=<line1>,l2=<line2>,bang=<q-bang>,args=<q-args>,mods=\"<mods>\"},_G.packer_plugins)mlua require\"packer.load\"({\"vim-fugitive\"},{},_G.packer_plugins)\nrequire\"packer.load\"({\"vim-flog\"},{cmd=\"\29nvim_create_user_command\bapi\bvimK\1\0\4\0\4\0\v3\0\0\0\18\1\0\0'\3\1\0B\1\2\1\18\1\0\0'\3\2\0B\1\2\1\18\1\0\0'\3\3\0B\1\2\1K\0\1\0\fFloggit\14Flogsplit\tFlog\0\0", "setup", "vim-flog")
time([[Setup for vim-flog]], false)
-- Setup for: pyro
time([[Setup for pyro]], true)
try_loadstring("\27LJ\2\nC\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\22/home/user/.macro\20pyro_macro_path\6g\bvim\0", "setup", "pyro")
time([[Setup for pyro]], false)
-- Setup for: dashboard-nvim
time([[Setup for dashboard-nvim]], true)
try_loadstring("\27LJ\2\n{\0\0\3\0\a\2\0186\0\0\0009\0\1\0009\0\2\0B\0\1\2\t\0\0\0X\0\v€6\0\0\0009\0\1\0009\0\3\0'\2\4\0B\0\2\2\t\0\1\0X\0\4€6\0\0\0009\0\5\0'\2\6\0B\0\2\1K\0\1\0\14Dashboard\bcmd\6$\14line2byte\targc\afn\bvim\0þÿÿÿ\31]\1\0\5\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0005\3\5\0003\4\4\0=\4\6\3B\0\3\1K\0\1\0\rcallback\1\0\0\0\rVimenter\24nvim_create_autocmd\bapi\bvim\0", "setup", "dashboard-nvim")
time([[Setup for dashboard-nvim]], false)
-- Setup for: splitjoin.vim
time([[Setup for splitjoin.vim]], true)
try_loadstring("\27LJ\2\n?\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\n<nul>\28splitjoin_split_mapping\6g\bvim\0", "setup", "splitjoin.vim")
time([[Setup for splitjoin.vim]], false)
-- Setup for: nvim-notify
time([[Setup for nvim-notify]], true)
vim.notify=function (...) require"notify"(...) end
time([[Setup for nvim-notify]], false)
-- Setup for: vim-hexokinase
time([[Setup for vim-hexokinase]], true)
try_loadstring("\27LJ\2\nL\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\2\0\0\19backgroundfull\28Hexokinase_highlighters\6g\bvim\0", "setup", "vim-hexokinase")
time([[Setup for vim-hexokinase]], false)
-- Setup for: vim-visual-increment
time([[Setup for vim-visual-increment]], true)
try_loadstring("\27LJ\2\n¾\1\0\0\6\0\n\0\0176\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\a\0'\4\b\0005\5\t\0B\0\5\1K\0\1\0\1\0\2\fnoremap\2\vsilent\2\26<Plug>VisualDecrement\vg<C-x>\1\0\2\fnoremap\2\vsilent\2\26<Plug>VisualIncrement\vg<C-a>\6x\bset\vkeymap\bvim\0", "setup", "vim-visual-increment")
time([[Setup for vim-visual-increment]], false)
-- Config for: nvim-lazy-inner-block
time([[Config for nvim-lazy-inner-block]], true)
require"nvim-lazy-inner-block".setup{}
time([[Config for nvim-lazy-inner-block]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
require"lualine".setup{
  options = {
    theme = "powerline"
  }
}
time([[Config for lualine.nvim]], false)
-- Config for: penvim
time([[Config for penvim]], true)
require"penvim".setup{
  project_env = {
    enable = false
  },
  rooter = {
    enable = false
  }
}
time([[Config for penvim]], false)
-- Config for: onedark.nvim
time([[Config for onedark.nvim]], true)
vim.cmd"colorschem onedark"
time([[Config for onedark.nvim]], false)
-- Config for: nvim-lastplace
time([[Config for nvim-lastplace]], true)
require"nvim-lastplace".setup{}
time([[Config for nvim-lastplace]], false)
-- Config for: instant.nvim
time([[Config for instant.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\tUsEr\21instant_username\6g\bvim\0", "config", "instant.nvim")
time([[Config for instant.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
require("config.treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: mini.nvim
time([[Config for mini.nvim]], true)
require("config.mini")
time([[Config for mini.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DiffviewLog lua require("packer.load")({'diffview.nvim'}, { cmd = "DiffviewLog", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file AnsiEsc lua require("packer.load")({'vim-plugin-ansiesc'}, { cmd = "AnsiEsc", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file ConvDec lua require("packer.load")({'nvim-conv'}, { cmd = "ConvDec", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Codi lua require("packer.load")({'codi.vim'}, { cmd = "Codi", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file CodiNew lua require("packer.load")({'codi.vim'}, { cmd = "CodiNew", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Puyo lua require("packer.load")({'vim-puyo'}, { cmd = "Puyo", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file RnvimrToggle lua require("packer.load")({'rnvimr'}, { cmd = "RnvimrToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file CodiUpdate lua require("packer.load")({'codi.vim'}, { cmd = "CodiUpdate", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file RnvimrStartBackground lua require("packer.load")({'rnvimr'}, { cmd = "RnvimrStartBackground", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file ConvMetricImperial lua require("packer.load")({'nvim-conv'}, { cmd = "ConvMetricImperial", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file ConvDataTransRate lua require("packer.load")({'nvim-conv'}, { cmd = "ConvDataTransRate", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file ConvColor lua require("packer.load")({'nvim-conv'}, { cmd = "ConvColor", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SamwiseMoveBack lua require("packer.load")({'samwise.nvim'}, { cmd = "SamwiseMoveBack", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SamwiseMoveFwd lua require("packer.load")({'samwise.nvim'}, { cmd = "SamwiseMoveFwd", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Colortils lua require("packer.load")({'colortils.nvim'}, { cmd = "Colortils", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SamwiseToggleHighlight lua require("packer.load")({'samwise.nvim'}, { cmd = "SamwiseToggleHighlight", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Regvsplit lua require("packer.load")({'vim-buffest'}, { cmd = "Regvsplit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Regtabedit lua require("packer.load")({'vim-buffest'}, { cmd = "Regtabedit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Regedit lua require("packer.load")({'vim-buffest'}, { cmd = "Regedit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Regpedit lua require("packer.load")({'vim-buffest'}, { cmd = "Regpedit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Qflistsplit lua require("packer.load")({'vim-buffest'}, { cmd = "Qflistsplit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Qflistvsplit lua require("packer.load")({'vim-buffest'}, { cmd = "Qflistvsplit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Qflisttabedit lua require("packer.load")({'vim-buffest'}, { cmd = "Qflisttabedit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Qflistedit lua require("packer.load")({'vim-buffest'}, { cmd = "Qflistedit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Loclistsplit lua require("packer.load")({'vim-buffest'}, { cmd = "Loclistsplit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Translate lua require("packer.load")({'vim-translator'}, { cmd = "Translate", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Loclisttabedit lua require("packer.load")({'vim-buffest'}, { cmd = "Loclisttabedit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Loclistedit lua require("packer.load")({'vim-buffest'}, { cmd = "Loclistedit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TranslateX lua require("packer.load")({'vim-translator'}, { cmd = "TranslateX", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TranslateH lua require("packer.load")({'vim-translator'}, { cmd = "TranslateH", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TranslateL lua require("packer.load")({'vim-translator'}, { cmd = "TranslateL", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SimpleBuffer lua require("packer.load")({'simplebuffer.vim'}, { cmd = "SimpleBuffer", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SimpleBufferClose lua require("packer.load")({'simplebuffer.vim'}, { cmd = "SimpleBufferClose", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SimpleBufferToggle lua require("packer.load")({'simplebuffer.vim'}, { cmd = "SimpleBufferToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Codespell lua require("packer.load")({'vim-codespell'}, { cmd = "Codespell", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SnipRun lua require("packer.load")({'sniprun'}, { cmd = "SnipRun", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SnipInfo lua require("packer.load")({'sniprun'}, { cmd = "SnipInfo", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SnipClose lua require("packer.load")({'sniprun'}, { cmd = "SnipClose", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SnipReset lua require("packer.load")({'sniprun'}, { cmd = "SnipReset", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SnipTerminate lua require("packer.load")({'sniprun'}, { cmd = "SnipTerminate", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SnipReplMemoryClean lua require("packer.load")({'sniprun'}, { cmd = "SnipReplMemoryClean", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Pad lua require("packer.load")({'vim-pad'}, { cmd = "Pad", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file ConvertColorTo lua require("packer.load")({'vim-convert-color-to'}, { cmd = "ConvertColorTo", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file ReachOpen lua require("packer.load")({'reach.nvim'}, { cmd = "ReachOpen", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file VSSplit lua require("packer.load")({'visual-split.vim'}, { cmd = "VSSplit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file VSSplitAbove lua require("packer.load")({'visual-split.vim'}, { cmd = "VSSplitAbove", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DB lua require("packer.load")({'vim-dadbod'}, { cmd = "DB", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file VSResize lua require("packer.load")({'visual-split.vim'}, { cmd = "VSResize", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file LazyList lua require("packer.load")({'lazylist.vim'}, { cmd = "LazyList", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file RnvimrResize lua require("packer.load")({'rnvimr'}, { cmd = "RnvimrResize", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DirDiff lua require("packer.load")({'vim-dirdiff'}, { cmd = "DirDiff", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file CodiSelect lua require("packer.load")({'codi.vim'}, { cmd = "CodiSelect", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Sort lua require("packer.load")({'sort.nvim'}, { cmd = "Sort", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Jobsplit lua require("packer.load")({'jobsplit.nvim'}, { cmd = "Jobsplit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Ditto lua require("packer.load")({'vim-ditto'}, { cmd = "Ditto", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DittoSent lua require("packer.load")({'vim-ditto'}, { cmd = "DittoSent", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DittoPar lua require("packer.load")({'vim-ditto'}, { cmd = "DittoPar", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DittoFile lua require("packer.load")({'vim-ditto'}, { cmd = "DittoFile", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DittoOn lua require("packer.load")({'vim-ditto'}, { cmd = "DittoOn", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DittoOff lua require("packer.load")({'vim-ditto'}, { cmd = "DittoOff", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DittoUpdate lua require("packer.load")({'vim-ditto'}, { cmd = "DittoUpdate", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DittoSentOn lua require("packer.load")({'vim-ditto'}, { cmd = "DittoSentOn", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DittoParOn lua require("packer.load")({'vim-ditto'}, { cmd = "DittoParOn", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DittoFileOn lua require("packer.load")({'vim-ditto'}, { cmd = "DittoFileOn", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NoDitto lua require("packer.load")({'vim-ditto'}, { cmd = "NoDitto", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file ToggleDitto lua require("packer.load")({'vim-ditto'}, { cmd = "ToggleDitto", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file UnpinBuffer lua require("packer.load")({'stickybuf.nvim'}, { cmd = "UnpinBuffer", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file VSSplitBelow lua require("packer.load")({'visual-split.vim'}, { cmd = "VSSplitBelow", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DeleteTemplate lua require("packer.load")({'project-templates.nvim'}, { cmd = "DeleteTemplate", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file EasyAlign lua require("packer.load")({'vim-easy-align'}, { cmd = "EasyAlign", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file FastFoldUpdate lua require("packer.load")({'FastFold'}, { cmd = "FastFoldUpdate", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file KillKillKill lua require("packer.load")({'killersheep.nvim'}, { cmd = "KillKillKill", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file LoadTemplate lua require("packer.load")({'project-templates.nvim'}, { cmd = "LoadTemplate", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Switch lua require("packer.load")({'switch.vim'}, { cmd = "Switch", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SwitchExtend lua require("packer.load")({'switch.vim'}, { cmd = "SwitchExtend", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file T lua require("packer.load")({'neoterm'}, { cmd = "T", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Cfind lua require("packer.load")({'vim-eunuch'}, { cmd = "Cfind", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Chmod lua require("packer.load")({'vim-eunuch'}, { cmd = "Chmod", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Clocate lua require("packer.load")({'vim-eunuch'}, { cmd = "Clocate", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file CarbonNow lua require("packer.load")({'carbon-now.nvim'}, { cmd = "CarbonNow", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SymbolsOutline lua require("packer.load")({'symbols-outline.nvim'}, { cmd = "SymbolsOutline", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SymbolsOutlineOpen lua require("packer.load")({'symbols-outline.nvim'}, { cmd = "SymbolsOutlineOpen", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SymbolsOutlineClose lua require("packer.load")({'symbols-outline.nvim'}, { cmd = "SymbolsOutlineClose", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file HSHighlight lua require("packer.load")({'HighStr.nvim'}, { cmd = "HSHighlight", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file HSRmHighlight lua require("packer.load")({'HighStr.nvim'}, { cmd = "HSRmHighlight", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Limelight lua require("packer.load")({'limelight.vim'}, { cmd = "Limelight", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Synonyms lua require("packer.load")({'synonyms.vim'}, { cmd = "Synonyms", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SynonymsSelection lua require("packer.load")({'synonyms.vim'}, { cmd = "SynonymsSelection", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NeoWellToggle lua require("packer.load")({'NeoWell.lua'}, { cmd = "NeoWellToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Linediff lua require("packer.load")({'linediff.vim'}, { cmd = "Linediff", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file LinediffReset lua require("packer.load")({'linediff.vim'}, { cmd = "LinediffReset", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NeoWellEdit lua require("packer.load")({'NeoWell.lua'}, { cmd = "NeoWellEdit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NeoWellOut lua require("packer.load")({'NeoWell.lua'}, { cmd = "NeoWellOut", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NeoWellWipeOut lua require("packer.load")({'NeoWell.lua'}, { cmd = "NeoWellWipeOut", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Lista lua require("packer.load")({'lista.nvim'}, { cmd = "Lista", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file RTFormatEnable lua require("packer.load")({'vim-rt-format'}, { cmd = "RTFormatEnable", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TSPlaygroundToggle lua require("packer.load")({'playground'}, { cmd = "TSPlaygroundToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file AsyncTaskMacro lua require("packer.load")({'asynctasks.vim'}, { cmd = "AsyncTaskMacro", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file FnlFile lua require("packer.load")({'fennel-nvim'}, { cmd = "FnlFile", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file FnlDo lua require("packer.load")({'fennel-nvim'}, { cmd = "FnlDo", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file ZenMode lua require("packer.load")({'zen-mode.nvim'}, { cmd = "ZenMode", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Thesaurus lua require("packer.load")({'thesaurus_query.vim'}, { cmd = "Thesaurus", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file ThesaurusQueryReplaceCurrentWord lua require("packer.load")({'thesaurus_query.vim'}, { cmd = "ThesaurusQueryReplaceCurrentWord", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file ThesaurusQueryLookupCurrentWord lua require("packer.load")({'thesaurus_query.vim'}, { cmd = "ThesaurusQueryLookupCurrentWord", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file ThesaurusQueryReplace lua require("packer.load")({'thesaurus_query.vim'}, { cmd = "ThesaurusQueryReplace", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NeoWellAppend lua require("packer.load")({'NeoWell.lua'}, { cmd = "NeoWellAppend", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NeoWellJump lua require("packer.load")({'NeoWell.lua'}, { cmd = "NeoWellJump", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Tetris lua require("packer.load")({'nvim-tetris'}, { cmd = "Tetris", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Aerojump lua require("packer.load")({'aerojump.nvim'}, { cmd = "Aerojump", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file AsyncTaskProfile lua require("packer.load")({'asynctasks.vim'}, { cmd = "AsyncTaskProfile", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Twilight lua require("packer.load")({'twilight.nvim'}, { cmd = "Twilight", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Scratch lua require("packer.load")({'scratch.vim'}, { cmd = "Scratch", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Trans lua require("packer.load")({'translate-shell.vim'}, { cmd = "Trans", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TransSelectDirection lua require("packer.load")({'translate-shell.vim'}, { cmd = "TransSelectDirection", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TransInteractive lua require("packer.load")({'translate-shell.vim'}, { cmd = "TransInteractive", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TransTerm lua require("packer.load")({'translate-shell.vim'}, { cmd = "TransTerm", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TransOpenHistoryWindow lua require("packer.load")({'translate-shell.vim'}, { cmd = "TransOpenHistoryWindow", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TransChangeDefaultDirection lua require("packer.load")({'translate-shell.vim'}, { cmd = "TransChangeDefaultDirection", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file FZFTransSelectDirection lua require("packer.load")({'translate-shell.vim'}, { cmd = "FZFTransSelectDirection", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file FZFTransInteractive lua require("packer.load")({'translate-shell.vim'}, { cmd = "FZFTransInteractive", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file FZFTransChangeDefaultDirection lua require("packer.load")({'translate-shell.vim'}, { cmd = "FZFTransChangeDefaultDirection", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file ScratchPreview lua require("packer.load")({'scratch.vim'}, { cmd = "ScratchPreview", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file MapSubpress lua require("packer.load")({'vim-express'}, { cmd = "MapSubpress", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Calendar lua require("packer.load")({'calendar.vim'}, { cmd = "Calendar", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file AsyncTask lua require("packer.load")({'asynctasks.vim'}, { cmd = "AsyncTask", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file AsyncTaskEdit lua require("packer.load")({'asynctasks.vim'}, { cmd = "AsyncTaskEdit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Copy lua require("packer.load")({'vim-eunuch'}, { cmd = "Copy", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Delete lua require("packer.load")({'vim-eunuch'}, { cmd = "Delete", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Duplicate lua require("packer.load")({'vim-eunuch'}, { cmd = "Duplicate", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Lfind lua require("packer.load")({'vim-eunuch'}, { cmd = "Lfind", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file MinimapToggle lua require("packer.load")({'minimap.vim'}, { cmd = "MinimapToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Mkdir lua require("packer.load")({'vim-eunuch'}, { cmd = "Mkdir", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Move lua require("packer.load")({'vim-eunuch'}, { cmd = "Move", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Remove lua require("packer.load")({'vim-eunuch'}, { cmd = "Remove", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Rename lua require("packer.load")({'vim-eunuch'}, { cmd = "Rename", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SudoEeit lua require("packer.load")({'vim-eunuch'}, { cmd = "SudoEeit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SudoWrite lua require("packer.load")({'vim-eunuch'}, { cmd = "SudoWrite", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Unlink lua require("packer.load")({'vim-eunuch'}, { cmd = "Unlink", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file W lua require("packer.load")({'vim-eunuch'}, { cmd = "W", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Wall lua require("packer.load")({'vim-eunuch'}, { cmd = "Wall", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TZAtaraxis lua require("packer.load")({'truezen.nvim'}, { cmd = "TZAtaraxis", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TagbarToggle lua require("packer.load")({'tagbar'}, { cmd = "TagbarToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file FloatermToggle lua require("packer.load")({'vim-floaterm'}, { cmd = "FloatermToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file VBox lua require("packer.load")({'venn.nvim'}, { cmd = "VBox", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file VBoxD lua require("packer.load")({'venn.nvim'}, { cmd = "VBoxD", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file VBoxH lua require("packer.load")({'venn.nvim'}, { cmd = "VBoxH", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Bdelete lua require("packer.load")({'bufdelete.nvim'}, { cmd = "Bdelete", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Bwipeout lua require("packer.load")({'bufdelete.nvim'}, { cmd = "Bwipeout", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file MapExpress lua require("packer.load")({'vim-express'}, { cmd = "MapExpress", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Neoformat lua require("packer.load")({'neoformat'}, { cmd = "Neoformat", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file VBoxO lua require("packer.load")({'venn.nvim'}, { cmd = "VBoxO", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file AccordionStop lua require("packer.load")({'vim-accordion'}, { cmd = "AccordionStop", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file VBoxDO lua require("packer.load")({'venn.nvim'}, { cmd = "VBoxDO", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file VBoxHO lua require("packer.load")({'venn.nvim'}, { cmd = "VBoxHO", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file VFill lua require("packer.load")({'venn.nvim'}, { cmd = "VFill", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Abolish lua require("packer.load")({'vim-abolish'}, { cmd = "Abolish", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Subvert lua require("packer.load")({'vim-abolish'}, { cmd = "Subvert", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Neogit lua require("packer.load")({'neogit'}, { cmd = "Neogit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Neotree lua require("packer.load")({'neo-tree.nvim'}, { cmd = "Neotree", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Capture lua require("packer.load")({'capture.vim'}, { cmd = "Capture", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Nvimesweeper lua require("packer.load")({'nvimesweeper'}, { cmd = "Nvimesweeper", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Accordion lua require("packer.load")({'vim-accordion'}, { cmd = "Accordion", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file AccordionAll lua require("packer.load")({'vim-accordion'}, { cmd = "AccordionAll", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file AccordionDiff lua require("packer.load")({'vim-accordion'}, { cmd = "AccordionDiff", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NeoNoName lua require("packer.load")({'neononame.lua'}, { cmd = "NeoNoName", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file AccordionZoomIn lua require("packer.load")({'vim-accordion'}, { cmd = "AccordionZoomIn", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file AccordionZoomOut lua require("packer.load")({'vim-accordion'}, { cmd = "AccordionZoomOut", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file AccordionOnce lua require("packer.load")({'vim-accordion'}, { cmd = "AccordionOnce", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file AccordionClear lua require("packer.load")({'vim-accordion'}, { cmd = "AccordionClear", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TZFocus lua require("packer.load")({'truezen.nvim'}, { cmd = "TZFocus", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TZMinimalist lua require("packer.load")({'truezen.nvim'}, { cmd = "TZMinimalist", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Centerpad lua require("packer.load")({'centerpad.nvim'}, { cmd = "Centerpad", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Folds lua require("packer.load")({'fzf-folds.vim'}, { cmd = "Folds", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file LiveEasyAlign lua require("packer.load")({'vim-easy-align'}, { cmd = "LiveEasyAlign", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Urlview lua require("packer.load")({'urlview.vim'}, { cmd = "Urlview", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TableModeToggle lua require("packer.load")({'vim-table-mode'}, { cmd = "TableModeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file ScratchSelection lua require("packer.load")({'scratch.vim'}, { cmd = "ScratchSelection", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GhostStart lua require("packer.load")({'vim-ghost'}, { cmd = "GhostStart", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file ScratchInsert lua require("packer.load")({'scratch.vim'}, { cmd = "ScratchInsert", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file BDelete lua require("packer.load")({'close-buffers.nvim'}, { cmd = "BDelete", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file BWipeout lua require("packer.load")({'close-buffers.nvim'}, { cmd = "BWipeout", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GrammarousCheck lua require("packer.load")({'vim-grammarous'}, { cmd = "GrammarousCheck", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GrammarousReset lua require("packer.load")({'vim-grammarous'}, { cmd = "GrammarousReset", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file AsyncTaskList lua require("packer.load")({'asynctasks.vim'}, { cmd = "AsyncTaskList", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Tnew lua require("packer.load")({'neoterm'}, { cmd = "Tnew", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Topen lua require("packer.load")({'neoterm'}, { cmd = "Topen", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Texec lua require("packer.load")({'neoterm'}, { cmd = "Texec", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file AsyncTaskLast lua require("packer.load")({'asynctasks.vim'}, { cmd = "AsyncTaskLast", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file AsyncStop lua require("packer.load")({'asyncrun.vim'}, { cmd = "AsyncStop", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file AsyncRun lua require("packer.load")({'asyncrun.vim'}, { cmd = "AsyncRun", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Peepsight lua require("packer.load")({'peepsight.nvim'}, { cmd = "Peepsight", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file PeepsightEnable lua require("packer.load")({'peepsight.nvim'}, { cmd = "PeepsightEnable", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file PeepsightDisable lua require("packer.load")({'peepsight.nvim'}, { cmd = "PeepsightDisable", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Telescope lua require("packer.load")({'telescope.nvim'}, { cmd = "Telescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Zi lua require("packer.load")({'zoxide.vim'}, { cmd = "Zi", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Z lua require("packer.load")({'zoxide.vim'}, { cmd = "Z", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file HpGenerateContents lua require("packer.load")({'vim-hp'}, { cmd = "HpGenerateContents", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file HpRefresh lua require("packer.load")({'vim-hp'}, { cmd = "HpRefresh", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file HpLeftRight lua require("packer.load")({'vim-hp'}, { cmd = "HpLeftRight", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file ConvOct lua require("packer.load")({'nvim-conv'}, { cmd = "ConvOct", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Dirbuf lua require("packer.load")({'dirbuf.nvim'}, { cmd = "Dirbuf", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file ConvSetPrecision lua require("packer.load")({'nvim-conv'}, { cmd = "ConvSetPrecision", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file ConvBytes lua require("packer.load")({'nvim-conv'}, { cmd = "ConvBytes", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file ConvStr lua require("packer.load")({'nvim-conv'}, { cmd = "ConvStr", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NotMuch lua require("packer.load")({'notmuch-vim'}, { cmd = "NotMuch", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file ConvCelsius lua require("packer.load")({'nvim-conv'}, { cmd = "ConvCelsius", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file ConvFarenheit lua require("packer.load")({'nvim-conv'}, { cmd = "ConvFarenheit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Fnl lua require("packer.load")({'fennel-nvim'}, { cmd = "Fnl", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NR lua require("packer.load")({'nrrwrgn'}, { cmd = "NR", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NRV lua require("packer.load")({'nrrwrgn'}, { cmd = "NRV", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NRP lua require("packer.load")({'nrrwrgn'}, { cmd = "NRP", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NRM lua require("packer.load")({'nrrwrgn'}, { cmd = "NRM", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NRS lua require("packer.load")({'nrrwrgn'}, { cmd = "NRS", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NRL lua require("packer.load")({'nrrwrgn'}, { cmd = "NRL", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NRN lua require("packer.load")({'nrrwrgn'}, { cmd = "NRN", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NW lua require("packer.load")({'nrrwrgn'}, { cmd = "NW", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file WR lua require("packer.load")({'nrrwrgn'}, { cmd = "WR", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NUD lua require("packer.load")({'nrrwrgn'}, { cmd = "NUD", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file ConvHex lua require("packer.load")({'nvim-conv'}, { cmd = "ConvHex", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file ConvBin lua require("packer.load")({'nvim-conv'}, { cmd = "ConvBin", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Pounce lua require("packer.load")({'pounce.nvim'}, { cmd = "Pounce", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Smalls lua require("packer.load")({'vim-smalls'}, { cmd = "Smalls", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SmallsExcursion lua require("packer.load")({'vim-smalls'}, { cmd = "SmallsExcursion", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Regsplit lua require("packer.load")({'vim-buffest'}, { cmd = "Regsplit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Loclistvsplit lua require("packer.load")({'vim-buffest'}, { cmd = "Loclistvsplit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SamwiseToggleBuffer lua require("packer.load")({'samwise.nvim'}, { cmd = "SamwiseToggleBuffer", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Telekasten lua require("packer.load")({'telekasten.nvim'}, { cmd = "Telekasten", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SwitchReverse lua require("packer.load")({'switch.vim'}, { cmd = "SwitchReverse", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file CodiExpand lua require("packer.load")({'codi.vim'}, { cmd = "CodiExpand", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Wordy lua require("packer.load")({'vim-wordy'}, { cmd = "Wordy", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TabmodeEnter lua require("packer.load")({'vim-tabmode'}, { cmd = "TabmodeEnter", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Dashboard lua require("packer.load")({'dashboard-nvim'}, { cmd = "Dashboard", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DashboardNewFile lua require("packer.load")({'dashboard-nvim'}, { cmd = "DashboardNewFile", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SaveAsTemplate lua require("packer.load")({'project-templates.nvim'}, { cmd = "SaveAsTemplate", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TranslateR lua require("packer.load")({'vim-translator'}, { cmd = "TranslateR", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TranslateW lua require("packer.load")({'vim-translator'}, { cmd = "TranslateW", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Mario lua require("packer.load")({'vim-mario'}, { cmd = "Mario", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Pyro lua require("packer.load")({'pyro'}, { cmd = "Pyro", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Wheel lua require("packer.load")({'wheel'}, { cmd = "Wheel", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file PinBuffer lua require("packer.load")({'stickybuf.nvim'}, { cmd = "PinBuffer", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file PinBuftype lua require("packer.load")({'stickybuf.nvim'}, { cmd = "PinBuftype", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file PinFiletype lua require("packer.load")({'stickybuf.nvim'}, { cmd = "PinFiletype", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Llocate lua require("packer.load")({'vim-eunuch'}, { cmd = "Llocate", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file MundoToggle lua require("packer.load")({'vim-mundo'}, { cmd = "MundoToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Tabularize lua require("packer.load")({'tabular'}, { cmd = "Tabularize", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DiffviewOpen lua require("packer.load")({'diffview.nvim'}, { cmd = "DiffviewOpen", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DiffviewFileHistory lua require("packer.load")({'diffview.nvim'}, { cmd = "DiffviewFileHistory", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DiffviewClose lua require("packer.load")({'diffview.nvim'}, { cmd = "DiffviewClose", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DiffviewFocusFiles lua require("packer.load")({'diffview.nvim'}, { cmd = "DiffviewFocusFiles", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DiffviewToggleFiles lua require("packer.load")({'diffview.nvim'}, { cmd = "DiffviewToggleFiles", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DiffviewRefresh lua require("packer.load")({'diffview.nvim'}, { cmd = "DiffviewRefresh", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[xnoremap <silent> S <cmd>lua require("packer.load")({'nvim-surround'}, { keys = "S", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[onoremap <silent> a<space> <cmd>lua require("packer.load")({'vim-textobj-blanklines'}, { keys = "a<lt>space>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> <Plug>GoVSMDown <cmd>lua require("packer.load")({'nvim-gomove'}, { keys = "<lt>Plug>GoVSMDown", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> <C-h> <cmd>lua require("packer.load")({'syntax-tree-surfer'}, { keys = "<lt>C-h>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> p <cmd>lua require("packer.load")({'yanky.nvim'}, { keys = "p", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <A-k> <cmd>lua require("packer.load")({'syntax-tree-surfer'}, { keys = "<lt>A-k>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> \al <cmd>lua require("packer.load")({'attempt.nvim'}, { keys = "\\al", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <Plug>GoNMLineUp <cmd>lua require("packer.load")({'nvim-gomove'}, { keys = "<lt>Plug>GoNMLineUp", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> <A-k> <cmd>lua require("packer.load")({'syntax-tree-surfer'}, { keys = "<lt>A-k>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> M<BS> <cmd>lua require("packer.load")({'vim-highlighter'}, { keys = "M<lt>BS>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> yS <cmd>lua require("packer.load")({'nvim-surround'}, { keys = "yS", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> av <cmd>lua require("packer.load")({'vim-textobj-variable-segment'}, { keys = "av", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> ac <cmd>lua require("packer.load")({'textobj-word-column.vim'}, { keys = "ac", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> g<C-x> <cmd>lua require("packer.load")({'dial.nvim'}, { keys = "g<lt>C-x>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> \ww <cmd>lua require("packer.load")({'vim-windowswap'}, { keys = "\\ww", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> gx <cmd>lua require("packer.load")({'open-browser.vim'}, { keys = "gx", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> gFe <cmd>lua require("packer.load")({'syntax-tree-surfer'}, { keys = "gFe", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> \ac <cmd>lua require("packer.load")({'attempt.nvim'}, { keys = "\\ac", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> ]_ <cmd>lua require("packer.load")({'vim-indentwise'}, { keys = "]_", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> gFi <cmd>lua require("packer.load")({'syntax-tree-surfer'}, { keys = "gFi", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> crb <cmd>lua require("packer.load")({'vim-radical'}, { keys = "crb", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[onoremap <silent> W <cmd>lua require("packer.load")({'vim-you-keep-using-that-word'}, { keys = "W", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> P <cmd>lua require("packer.load")({'yanky.nvim'}, { keys = "P", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> gFv <cmd>lua require("packer.load")({'syntax-tree-surfer'}, { keys = "gFv", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> <C-W>gr <cmd>lua require("packer.load")({'visual-split.vim'}, { keys = "<lt>C-W>gr", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> gFu <cmd>lua require("packer.load")({'syntax-tree-surfer'}, { keys = "gFu", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> g<C-a> <cmd>lua require("packer.load")({'dial.nvim'}, { keys = "g<lt>C-a>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> iI <cmd>lua require("packer.load")({'vim-indent-object'}, { keys = "iI", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> gJ <cmd>lua require("packer.load")({'splitjoin.vim'}, { keys = "gJ", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> g<A-l> <cmd>lua require("packer.load")({'vim-foolish-move'}, { keys = "g<lt>A-l>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> gA <cmd>lua require("packer.load")({'vim-radical'}, { keys = "gA", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> ]+ <cmd>lua require("packer.load")({'vim-indentwise'}, { keys = "]+", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> [= <cmd>lua require("packer.load")({'vim-indentwise'}, { keys = "[=", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> ys <cmd>lua require("packer.load")({'nvim-surround'}, { keys = "ys", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> gA <cmd>lua require("packer.load")({'vim-radical'}, { keys = "gA", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[onoremap <silent> iv <cmd>lua require("packer.load")({'vim-textobj-variable-segment'}, { keys = "iv", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> <A-S-j> <cmd>lua require("packer.load")({'syntax-tree-surfer'}, { keys = "<lt>A-S-j>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> [B <cmd>lua require("packer.load")({'cybu.nvim'}, { keys = "[B", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> Z <cmd>lua require("packer.load")({'FastFold'}, { keys = "Z", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> <C-a> <cmd>lua require("packer.load")({'dial.nvim'}, { keys = "<lt>C-a>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> mm <cmd>lua require("packer.load")({'vim-bookmarks'}, { keys = "mm", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> \ad <cmd>lua require("packer.load")({'attempt.nvim'}, { keys = "\\ad", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> mp <cmd>lua require("packer.load")({'vim-bookmarks'}, { keys = "mp", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> g<A-h> <cmd>lua require("packer.load")({'vim-foolish-move'}, { keys = "g<lt>A-h>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> <C-j> <cmd>lua require("packer.load")({'syntax-tree-surfer'}, { keys = "<lt>C-j>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[onoremap <silent> ac <cmd>lua require("packer.load")({'textobj-word-column.vim'}, { keys = "ac", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> mjj <cmd>lua require("packer.load")({'vim-bookmarks'}, { keys = "mjj", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> cr <cmd>lua require("packer.load")({'vim-abolish'}, { keys = "cr", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> <Plug>GoVSDDown <cmd>lua require("packer.load")({'nvim-gomove'}, { keys = "<lt>Plug>GoVSDDown", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <char-34><char-34> <cmd>lua require("packer.load")({'nvim-peekup'}, { keys = "<lt>char-34><lt>char-34>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <C-W>gsb <cmd>lua require("packer.load")({'visual-split.vim'}, { keys = "<lt>C-W>gsb", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> gR <cmd>lua require("packer.load")({'nvim-treesitter-refactor'}, { keys = "gR", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> j <cmd>lua require("packer.load")({'accelerated-jk.nvim'}, { keys = "j", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <C-p> <cmd>lua require("packer.load")({'yanky.nvim'}, { keys = "<lt>C-p>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> <C-S-k> <cmd>lua require("packer.load")({'syntax-tree-surfer'}, { keys = "<lt>C-S-k>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[onoremap <silent> ii <cmd>lua require("packer.load")({'vim-indent-object'}, { keys = "ii", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> ]b <cmd>lua require("packer.load")({'cybu.nvim'}, { keys = "]b", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> [_ <cmd>lua require("packer.load")({'vim-indentwise'}, { keys = "[_", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> \ri <cmd>lua require("packer.load")({'refactoring.nvim'}, { keys = "\\ri", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> <Plug>GoVMLineUp <cmd>lua require("packer.load")({'nvim-gomove'}, { keys = "<lt>Plug>GoVMLineUp", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> <Plug>GoVDLineDown <cmd>lua require("packer.load")({'nvim-gomove'}, { keys = "<lt>Plug>GoVDLineDown", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> vx <cmd>lua require("packer.load")({'syntax-tree-surfer'}, { keys = "vx", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <C-b> <cmd>lua require("packer.load")({'neoscroll.nvim'}, { keys = "<lt>C-b>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> gl <cmd>lua require("packer.load")({'vim-lion'}, { keys = "gl", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> \an <cmd>lua require("packer.load")({'attempt.nvim'}, { keys = "\\an", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <C-W>gss <cmd>lua require("packer.load")({'visual-split.vim'}, { keys = "<lt>C-W>gss", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> g/ <cmd>lua require("packer.load")({'vim-tranquille'}, { keys = "g/", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[inoremap <silent> <C-g>s <cmd>lua require("packer.load")({'nvim-surround'}, { keys = "<lt>C-g>s" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> <A-S-k> <cmd>lua require("packer.load")({'syntax-tree-surfer'}, { keys = "<lt>A-S-k>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> <C-S-j> <cmd>lua require("packer.load")({'syntax-tree-surfer'}, { keys = "<lt>C-S-j>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> \ar <cmd>lua require("packer.load")({'attempt.nvim'}, { keys = "\\ar", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> ga <cmd>lua require("packer.load")({'vim-characterize'}, { keys = "ga", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> k <cmd>lua require("packer.load")({'accelerated-jk.nvim'}, { keys = "k", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> ma <cmd>lua require("packer.load")({'vim-bookmarks'}, { keys = "ma", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> <A-j> <cmd>lua require("packer.load")({'syntax-tree-surfer'}, { keys = "<lt>A-j>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> \ai <cmd>lua require("packer.load")({'attempt.nvim'}, { keys = "\\ai", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <C-S-o> <cmd>lua require("packer.load")({'syntax-tree-surfer'}, { keys = "<lt>C-S-o>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> g<C-x> <cmd>lua require("packer.load")({'vim-visual-increment'}, { keys = "g<lt>C-x>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> \rf <cmd>lua require("packer.load")({'refactoring.nvim'}, { keys = "\\rf", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <C-y> <cmd>lua require("packer.load")({'neoscroll.nvim'}, { keys = "<lt>C-y>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> <Plug>GoVSMLeft <cmd>lua require("packer.load")({'nvim-gomove'}, { keys = "<lt>Plug>GoVSMLeft", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> a<space> <cmd>lua require("packer.load")({'vim-textobj-blanklines'}, { keys = "a<lt>space>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> mn <cmd>lua require("packer.load")({'vim-bookmarks'}, { keys = "mn", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> o <cmd>lua require("packer.load")({'bullets.vim'}, { keys = "o", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> cro <cmd>lua require("packer.load")({'vim-radical'}, { keys = "cro", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <A-i> <cmd>lua require("packer.load")({'syntax-tree-surfer'}, { keys = "<lt>A-i>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> g<C-a> <cmd>lua require("packer.load")({'vim-visual-increment'}, { keys = "g<lt>C-a>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <C-n> <cmd>lua require("packer.load")({'yanky.nvim'}, { keys = "<lt>C-n>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> cx <cmd>lua require("packer.load")({'vim-exchange'}, { keys = "cx", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> gc <cmd>lua require("packer.load")({'nerdcommenter'}, { keys = "gc", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> K <cmd>lua require("packer.load")({'lspsaga.nvim'}, { keys = "K", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> s <cmd>lua require("packer.load")({'vim-sneak'}, { keys = "s", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <A-j> <cmd>lua require("packer.load")({'syntax-tree-surfer'}, { keys = "<lt>A-j>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> gFa <cmd>lua require("packer.load")({'syntax-tree-surfer'}, { keys = "gFa", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <A-o> <cmd>lua require("packer.load")({'syntax-tree-surfer'}, { keys = "<lt>A-o>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[onoremap <silent> i<space> <cmd>lua require("packer.load")({'vim-textobj-blanklines'}, { keys = "i<lt>space>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> gL <cmd>lua require("packer.load")({'vim-lion'}, { keys = "gL", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> F <cmd>lua require("packer.load")({'clever-f.vim'}, { keys = "F", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[onoremap <silent> ai <cmd>lua require("packer.load")({'vim-indent-object'}, { keys = "ai", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> gl <cmd>lua require("packer.load")({'vim-lion'}, { keys = "gl", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> ]% <cmd>lua require("packer.load")({'vim-indentwise'}, { keys = "]%", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <C-S-j> <cmd>lua require("packer.load")({'winshift.nvim'}, { keys = "<lt>C-S-j>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <C-w>  <cmd>lua require("packer.load")({'vim-choosewin'}, { keys = "<lt>C-w> ", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> ]- <cmd>lua require("packer.load")({'vim-indentwise'}, { keys = "]-", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> [% <cmd>lua require("packer.load")({'vim-indentwise'}, { keys = "[%", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> [+ <cmd>lua require("packer.load")({'vim-indentwise'}, { keys = "[+", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> <C-S-h> <cmd>lua require("packer.load")({'syntax-tree-surfer'}, { keys = "<lt>C-S-h>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> mkk <cmd>lua require("packer.load")({'vim-bookmarks'}, { keys = "mkk", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[onoremap <silent> w <cmd>lua require("packer.load")({'vim-you-keep-using-that-word'}, { keys = "w", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <char-93><char-93> <cmd>lua require("packer.load")({'jumpy.vim'}, { keys = "<lt>char-93><lt>char-93>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> gb <cmd>lua require("packer.load")({'vim-easy-align'}, { keys = "gb", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[onoremap <silent> aI <cmd>lua require("packer.load")({'vim-indent-object'}, { keys = "aI", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[onoremap <silent> iI <cmd>lua require("packer.load")({'vim-indent-object'}, { keys = "iI", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> ai <cmd>lua require("packer.load")({'vim-indent-object'}, { keys = "ai", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> ii <cmd>lua require("packer.load")({'vim-indent-object'}, { keys = "ii", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> gL <cmd>lua require("packer.load")({'vim-lion'}, { keys = "gL", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> aC <cmd>lua require("packer.load")({'textobj-word-column.vim'}, { keys = "aC", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> [[ <cmd>lua require("packer.load")({'jumpy.vim'}, { keys = "[[", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> crx <cmd>lua require("packer.load")({'vim-radical'}, { keys = "crx", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> <C-k> <cmd>lua require("packer.load")({'syntax-tree-surfer'}, { keys = "<lt>C-k>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> gc <cmd>lua require("packer.load")({'nerdcommenter'}, { keys = "gc", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[inoremap <silent> <A-tab> <cmd>lua require("packer.load")({'tabout.nvim'}, { keys = "<lt>A-tab>" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> <C-S-l> <cmd>lua require("packer.load")({'syntax-tree-surfer'}, { keys = "<lt>C-S-l>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[onoremap <silent> iC <cmd>lua require("packer.load")({'textobj-word-column.vim'}, { keys = "iC", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> p <cmd>lua require("packer.load")({'yanky.nvim'}, { keys = "p", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <C-w>g  <cmd>lua require("packer.load")({'nvim-window'}, { keys = "<lt>C-w>g ", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[onoremap <silent> ic <cmd>lua require("packer.load")({'textobj-word-column.vim'}, { keys = "ic", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <A-S-j> <cmd>lua require("packer.load")({'syntax-tree-surfer'}, { keys = "<lt>A-S-j>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> gs <cmd>lua require("packer.load")({'switch.vim'}, { keys = "gs", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> <Plug>GoVSMRight <cmd>lua require("packer.load")({'nvim-gomove'}, { keys = "<lt>Plug>GoVSMRight", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> <Plug>GoVSMUp <cmd>lua require("packer.load")({'nvim-gomove'}, { keys = "<lt>Plug>GoVSMUp", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <C-S-k> <cmd>lua require("packer.load")({'winshift.nvim'}, { keys = "<lt>C-S-k>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> <C-W>gsa <cmd>lua require("packer.load")({'visual-split.vim'}, { keys = "<lt>C-W>gsa", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <C-W>gsa <cmd>lua require("packer.load")({'visual-split.vim'}, { keys = "<lt>C-W>gsa", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> M<C-l> <cmd>lua require("packer.load")({'vim-highlighter'}, { keys = "M<lt>C-l>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> <C-x> <cmd>lua require("packer.load")({'dial.nvim'}, { keys = "<lt>C-x>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[inoremap <silent> <C-y> <cmd>lua require("packer.load")({'emmet-vim'}, { keys = "<lt>C-y>" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> \<tab> <cmd>lua require("packer.load")({'vim-tabmode'}, { keys = "\\<lt>tab>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> g <cmd>lua require("packer.load")({'which-key.nvim'}, { keys = "g", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <A-s> <cmd>lua require("packer.load")({'vim-split-line'}, { keys = "<lt>A-s>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> t <cmd>lua require("packer.load")({'clever-f.vim'}, { keys = "t", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> f <cmd>lua require("packer.load")({'clever-f.vim'}, { keys = "f", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> gx <cmd>lua require("packer.load")({'open-browser.vim'}, { keys = "gx", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> P <cmd>lua require("packer.load")({'yanky.nvim'}, { keys = "P", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> \rv <cmd>lua require("packer.load")({'refactoring.nvim'}, { keys = "\\rv", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <A-P> <cmd>lua require("packer.load")({'yanky.nvim'}, { keys = "<lt>A-P>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <C-W>gr <cmd>lua require("packer.load")({'visual-split.vim'}, { keys = "<lt>C-W>gr", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> >a <cmd>lua require("packer.load")({'sideways.vim'}, { keys = ">a", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> [b <cmd>lua require("packer.load")({'cybu.nvim'}, { keys = "[b", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> g<A-k> <cmd>lua require("packer.load")({'vim-foolish-move'}, { keys = "g<lt>A-k>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <C-e> <cmd>lua require("packer.load")({'neoscroll.nvim'}, { keys = "<lt>C-e>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> ]= <cmd>lua require("packer.load")({'vim-indentwise'}, { keys = "]=", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> ]B <cmd>lua require("packer.load")({'cybu.nvim'}, { keys = "]B", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <space> <cmd>lua require("packer.load")({'which-key.nvim'}, { keys = "<lt>space>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> gb <cmd>lua require("packer.load")({'vim-easy-align'}, { keys = "gb", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> aI <cmd>lua require("packer.load")({'vim-indent-object'}, { keys = "aI", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> ic <cmd>lua require("packer.load")({'textobj-word-column.vim'}, { keys = "ic", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> M<CR> <cmd>lua require("packer.load")({'vim-highlighter'}, { keys = "M<lt>CR>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> ds <cmd>lua require("packer.load")({'nvim-surround'}, { keys = "ds", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> <C-l> <cmd>lua require("packer.load")({'syntax-tree-surfer'}, { keys = "<lt>C-l>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> crd <cmd>lua require("packer.load")({'vim-radical'}, { keys = "crd", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <C-y> <cmd>lua require("packer.load")({'emmet-vim'}, { keys = "<lt>C-y>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> gFo <cmd>lua require("packer.load")({'syntax-tree-surfer'}, { keys = "gFo", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <C-u> <cmd>lua require("packer.load")({'neoscroll.nvim'}, { keys = "<lt>C-u>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> vn <cmd>lua require("packer.load")({'syntax-tree-surfer'}, { keys = "vn", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <Plug>GoNMLineDown <cmd>lua require("packer.load")({'nvim-gomove'}, { keys = "<lt>Plug>GoNMLineDown", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> mc <cmd>lua require("packer.load")({'vim-bookmarks'}, { keys = "mc", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> gFs <cmd>lua require("packer.load")({'syntax-tree-surfer'}, { keys = "gFs", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> <Plug>GoVSDUp <cmd>lua require("packer.load")({'nvim-gomove'}, { keys = "<lt>Plug>GoVSDUp", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> iC <cmd>lua require("packer.load")({'textobj-word-column.vim'}, { keys = "iC", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> mx <cmd>lua require("packer.load")({'vim-bookmarks'}, { keys = "mx", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <A-S-k> <cmd>lua require("packer.load")({'syntax-tree-surfer'}, { keys = "<lt>A-S-k>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <C-S-h> <cmd>lua require("packer.load")({'winshift.nvim'}, { keys = "<lt>C-S-h>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <Plug>GoNDLineDown <cmd>lua require("packer.load")({'nvim-gomove'}, { keys = "<lt>Plug>GoNDLineDown", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> gE <cmd>lua require("packer.load")({'nvim-expand-expr'}, { keys = "gE", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> \re <cmd>lua require("packer.load")({'refactoring.nvim'}, { keys = "\\re", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[onoremap <silent> av <cmd>lua require("packer.load")({'vim-textobj-variable-segment'}, { keys = "av", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> i<space> <cmd>lua require("packer.load")({'vim-textobj-blanklines'}, { keys = "i<lt>space>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> g<A-j> <cmd>lua require("packer.load")({'vim-foolish-move'}, { keys = "g<lt>A-j>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> cs <cmd>lua require("packer.load")({'nvim-surround'}, { keys = "cs", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> M<Tab> <cmd>lua require("packer.load")({'vim-highlighter'}, { keys = "M<lt>Tab>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[inoremap <silent> <A-S-tab> <cmd>lua require("packer.load")({'tabout.nvim'}, { keys = "<lt>A-S-tab>" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> iv <cmd>lua require("packer.load")({'vim-textobj-variable-segment'}, { keys = "iv", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> >A <cmd>lua require("packer.load")({'sideways.vim'}, { keys = ">A", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <a <cmd>lua require("packer.load")({'sideways.vim'}, { keys = "<lt>a", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> gS <cmd>lua require("packer.load")({'nvim-trevj.lua'}, { keys = "gS", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> [- <cmd>lua require("packer.load")({'vim-indentwise'}, { keys = "[-", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <A-p> <cmd>lua require("packer.load")({'yanky.nvim'}, { keys = "<lt>A-p>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> T <cmd>lua require("packer.load")({'clever-f.vim'}, { keys = "T", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <A <cmd>lua require("packer.load")({'sideways.vim'}, { keys = "<lt>A", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[onoremap <silent> aC <cmd>lua require("packer.load")({'textobj-word-column.vim'}, { keys = "aC", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> mg <cmd>lua require("packer.load")({'vim-bookmarks'}, { keys = "mg", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <Plug>GoNDLineUp <cmd>lua require("packer.load")({'nvim-gomove'}, { keys = "<lt>Plug>GoNDLineUp", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> <Plug>GoVSDLeft <cmd>lua require("packer.load")({'nvim-gomove'}, { keys = "<lt>Plug>GoVSDLeft", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> X <cmd>lua require("packer.load")({'vim-exchange'}, { keys = "X", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> <C-W>gsb <cmd>lua require("packer.load")({'visual-split.vim'}, { keys = "<lt>C-W>gsb", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <C-d> <cmd>lua require("packer.load")({'neoscroll.nvim'}, { keys = "<lt>C-d>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <C-a> <cmd>lua require("packer.load")({'dial.nvim'}, { keys = "<lt>C-a>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> <Plug>GoVDLineUp <cmd>lua require("packer.load")({'nvim-gomove'}, { keys = "<lt>Plug>GoVDLineUp", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> <Plug>GoVSDRight <cmd>lua require("packer.load")({'nvim-gomove'}, { keys = "<lt>Plug>GoVSDRight", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> gS <cmd>lua require("packer.load")({'nvim-surround'}, { keys = "gS", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> mi <cmd>lua require("packer.load")({'vim-bookmarks'}, { keys = "mi", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[vnoremap <silent> <C-y> <cmd>lua require("packer.load")({'emmet-vim'}, { keys = "<lt>C-y>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> <C-W>gss <cmd>lua require("packer.load")({'visual-split.vim'}, { keys = "<lt>C-W>gss", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> <Plug>GoVMLineDown <cmd>lua require("packer.load")({'nvim-gomove'}, { keys = "<lt>Plug>GoVMLineDown", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <C-x> <cmd>lua require("packer.load")({'dial.nvim'}, { keys = "<lt>C-x>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <C-f> <cmd>lua require("packer.load")({'neoscroll.nvim'}, { keys = "<lt>C-f>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <C-S-l> <cmd>lua require("packer.load")({'winshift.nvim'}, { keys = "<lt>C-S-l>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[inoremap <silent> <C-g>S <cmd>lua require("packer.load")({'nvim-surround'}, { keys = "<lt>C-g>S" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType puml ++once lua require("packer.load")({'open-browser.vim', 'plantuml-previewer.vim', 'plantuml-syntax', 'vim-slumlord'}, { ft = "puml" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'markdown-preview.nvim', 'mkdnflow.nvim', 'vim-markdown-toc'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType ipynb ++once lua require("packer.load")({'jupyter-nvim'}, { ft = "ipynb" }, _G.packer_plugins)]]
vim.cmd [[au FileType html ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "html" }, _G.packer_plugins)]]
vim.cmd [[au FileType norg ++once lua require("packer.load")({'neorg'}, { ft = "norg" }, _G.packer_plugins)]]
vim.cmd [[au FileType terminal ++once lua require("packer.load")({'nvim-terminal.lua'}, { ft = "terminal" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au TextYankPost * ++once lua require("packer.load")({'yanky.nvim'}, { event = "TextYankPost *" }, _G.packer_plugins)]]
vim.cmd [[au User autotag ++once lua require("packer.load")({'nvim-ts-autotag'}, { event = "User autotag" }, _G.packer_plugins)]]
vim.cmd [[au OptionSet spell ++once lua require("packer.load")({'spellsitter.nvim'}, { event = "OptionSet spell" }, _G.packer_plugins)]]
vim.cmd [[au User isfolded ++once lua require("packer.load")({'fold-preview.nvim', 'FastFold', 'pretty-fold.nvim'}, { event = "User isfolded" }, _G.packer_plugins)]]
vim.cmd [[au User qfopen ++once lua require("packer.load")({'nvim-pqf'}, { event = "User qfopen" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'nvim-autopairs', 'nvim-cmp'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
vim.cmd [[au User s1 ++once lua require("packer.load")({'hlargs.nvim', 'stabilize.nvim', 'lsp-colors.nvim', 'matchparen.nvim', 'mkdir.nvim', 'nightfox.nvim', 'falcon', 'due.nvim', 'nvim-lspconfig', 'FixCursorHold.nvim', 'abbreinder.nvim', 'nvim-treesitter-pairs', 'nvim-ts-context-commentstring', 'nvim-ts-rainbow', 'oak', 'vim-hexokinase', 'vim-im-select'}, { event = "User s1" }, _G.packer_plugins)]]
vim.cmd [[au CmdlineEnter * ++once lua require("packer.load")({'numb.nvim', 'nvim-hlslens', 'nvim-cmp', 'range-highlight.nvim'}, { event = "CmdlineEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
  -- Function lazy-loads
time([[Defining lazy-load function autocommands]], true)
vim.cmd[[au FuncUndefined lens#run ++once lua require("packer.load")({'lens.vim'}, {}, _G.packer_plugins)]]
vim.cmd[[au FuncUndefined overlength#toggle ++once lua require("packer.load")({'overlength.vim'}, {}, _G.packer_plugins)]]
time([[Defining lazy-load function autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/user/.local/share/nvim/site/pack/packer/opt/neorg/ftdetect/norg.vim]], true)
vim.cmd [[source /home/user/.local/share/nvim/site/pack/packer/opt/neorg/ftdetect/norg.vim]]
time([[Sourcing ftdetect script at: /home/user/.local/share/nvim/site/pack/packer/opt/neorg/ftdetect/norg.vim]], false)
time([[Sourcing ftdetect script at: /home/user/.local/share/nvim/site/pack/packer/opt/plantuml-syntax/ftdetect/plantuml.vim]], true)
vim.cmd [[source /home/user/.local/share/nvim/site/pack/packer/opt/plantuml-syntax/ftdetect/plantuml.vim]]
time([[Sourcing ftdetect script at: /home/user/.local/share/nvim/site/pack/packer/opt/plantuml-syntax/ftdetect/plantuml.vim]], false)
time([[Sourcing ftdetect script at: /home/user/.local/share/nvim/site/pack/packer/opt/vim-markdown-toc/ftdetect/markdown.vim]], true)
vim.cmd [[source /home/user/.local/share/nvim/site/pack/packer/opt/vim-markdown-toc/ftdetect/markdown.vim]]
time([[Sourcing ftdetect script at: /home/user/.local/share/nvim/site/pack/packer/opt/vim-markdown-toc/ftdetect/markdown.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
