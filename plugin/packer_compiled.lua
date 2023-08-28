-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

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
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/user/.cache/nvim/packer_hererocks/2.1.1692716794/share/lua/5.1/?.lua;/home/user/.cache/nvim/packer_hererocks/2.1.1692716794/share/lua/5.1/?/init.lua;/home/user/.cache/nvim/packer_hererocks/2.1.1692716794/lib/luarocks/rocks-5.1/?.lua;/home/user/.cache/nvim/packer_hererocks/2.1.1692716794/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/user/.cache/nvim/packer_hererocks/2.1.1692716794/lib/lua/5.1/?.so"
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
  ["accelerated-jk.nvim"] = {
    config = { "\27LJ\2\nÂ\1\0\0\5\0\t\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\0\0'\2\3\0B\0\2\0029\0\4\0\18\1\0\0'\3\5\0'\4\6\0B\1\3\1\18\1\0\0'\3\a\0'\4\b\0B\1\3\1K\0\1\0004<cmd>lua require\"accelerated-jk\".command(\"gk\")\r\6k4<cmd>lua require\"accelerated-jk\".command(\"gj\")\r\6j\bxno\17utils.keymap\nsetup\19accelerated-jk\frequire\0" },
    keys = { { "n", "j" }, { "n", "k" }, { "x", "j" }, { "x", "j" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/accelerated-jk.nvim",
    url = "https://github.com/xiyaowong/accelerated-jk.nvim"
  },
  ["asyncrun.vim"] = {
    commands = { "AsyncRun", "AsyncStop" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/asyncrun.vim",
    url = "https://github.com/skywind3000/asyncrun.vim"
  },
  ["attempt.nvim"] = {
    config = { 'require("config.attempt")' },
    keys = { { "n", "\\a" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/attempt.nvim",
    url = "https://github.com/m-demare/attempt.nvim"
  },
  ["calvera-dark.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/calvera-dark.nvim",
    url = "https://github.com/hoprr/calvera-dark.nvim"
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
  ["close-buffers.nvim"] = {
    commands = { "BDelete", "BWipeout" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/close-buffers.nvim",
    url = "https://github.com/kazhala/close-buffers.nvim"
  },
  ["cmp-async-path"] = {
    after_files = { "/home/user/.local/share/nvim/site/pack/packer/opt/cmp-async-path/after/plugin/cmp_async_path.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/cmp-async-path",
    url = "https://github.com/FelipeLema/cmp-async-path"
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
  ["codeium.nvim"] = {
    config = { 'require"codeium".setup{}' },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/codeium.nvim",
    url = "https://github.com/jcdickinson/codeium.nvim"
  },
  ["codeium.vim"] = {
    config = { "\27LJ\2\n&\0\0\5\2\1\0\5-\0\0\0006\2\0\0-\4\1\0B\2\2\0C\0\0\0\0¿\1¿\vunpack&\3\1\3\0\1\1\0064\1\3\0G\2\1\0?\2\0\0003\2\0\0002\0\0ÄL\2\2\0\0\3ÄÄ¿ô\4Œ\2\1\0\t\0\17\0,6\0\0\0'\2\1\0B\0\2\0029\0\2\0003\1\3\0\18\2\0\0'\4\4\0\18\5\1\0006\a\5\0009\a\6\a9\a\a\aB\5\2\0025\6\b\0B\2\4\1\18\2\0\0'\4\t\0\18\5\1\0006\a\5\0009\a\6\a9\a\n\a)\b\1\0B\5\3\0025\6\v\0B\2\4\1\18\2\0\0'\4\f\0\18\5\1\0006\a\5\0009\a\6\a9\a\n\a)\bˇˇB\5\3\0025\6\r\0B\2\4\1\18\2\0\0'\4\14\0\18\5\1\0006\a\5\0009\a\6\a9\a\15\aB\5\2\0025\6\16\0B\2\4\1K\0\1\0\1\0\1\texpr\2\21codeium#Complete\n<A-'>\1\0\1\texpr\2\n<A-(>\1\0\1\texpr\2\29codeium#CycleCompletions\n<A-)>\1\0\1\texpr\2\19codeium#Accept\afn\bvim\v<A-cr>\0\bino\17utils.keymap\frequire\0" },
    keys = { { "i", "<A-'>" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/codeium.vim",
    url = "https://github.com/Exafunction/codeium.vim"
  },
  ["codewindow.nvim"] = {
    commands = { "CodeWindow" },
    config = { "\27LJ\2\nè\1\0\0\6\0\b\0\r6\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\0016\1\3\0009\1\4\0019\1\5\1'\3\6\0009\4\a\0004\5\0\0B\1\4\1K\0\1\0\19toggle_minimap\15CodeWindow\29nvim_create_user_command\bapi\bvim\nsetup\15codewindow\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/codewindow.nvim",
    url = "https://github.com/gorbit99/codewindow.nvim"
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
  ["compiler-explorer.nvim"] = {
    commands = { "CECompile" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/compiler-explorer.nvim",
    url = "https://github.com/krady21/compiler-explorer.nvim"
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
    keys = { { "n", "<C-a>" }, { "n", "<C-x>" }, { "x", "<C-a>" }, { "x", "<C-x>" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/dial.nvim",
    url = "https://github.com/monaqa/dial.nvim"
  },
  ["diffview.nvim"] = {
    commands = { "DiffviewOpen", "DiffviewFileHistory", "DiffviewClose", "DiffviewFocusFiles", "DiffviewToggleFiles", "DiffviewRefresh", "DiffviewLog" },
    config = { 'require"diffview".setup{\n  use_icons = false\n}' },
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
  ["easyread.nvim"] = {
    config = { 'require"easyread".setup{\n  fileTypes = { "markdown", "text" }\n}' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/easyread.nvim",
    url = "https://github.com/JellyApple102/easyread.nvim"
  },
  ["flash.nvim"] = {
    config = { 'require("config.flash")' },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/flash.nvim",
    url = "https://github.com/folke/flash.nvim"
  },
  ["github-nvim-theme"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/github-nvim-theme",
    url = "https://github.com/projekt0n/github-nvim-theme"
  },
  ["guess-indent.nvim"] = {
    config = { 'require"guess-indent".setup{}' },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/guess-indent.nvim",
    url = "https://github.com/nmac427/guess-indent.nvim"
  },
  ["inc-rename.nvim"] = {
    commands = { "IncRename" },
    config = { "\27LJ\2\n†\1\0\0\5\0\b\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\0\0'\2\3\0B\0\2\0029\0\4\0'\2\5\0'\3\6\0005\4\a\0B\0\4\1K\0\1\0\1\0\1\fnoremap\2(:IncRename <C-r>=expand(\"<cword>\")\r\agr\bnno\17utils.keymap\nsetup\15inc_rename\frequire\0" },
    keys = { { "n", "gr" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/inc-rename.nvim",
    url = "https://github.com/smjonas/inc-rename.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\nÃ\1\0\0\4\0\n\0\0156\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\4\0'\2\5\0B\0\2\0029\1\6\0005\3\a\0B\1\2\0016\1\0\0009\1\b\0019\1\t\1B\1\1\1K\0\1\0\27IndentBlanklineRefresh\bcmd\1\0\1\25show_current_context\2\nsetup\21indent_blankline\frequire\1\2\0\0\14dashboard&indent_blankline_filetype_exclude\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["instant.nvim"] = {
    config = { "\27LJ\2\n7\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\tUser\21instant_username\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/instant.nvim",
    url = "https://github.com/jbyuki/instant.nvim"
  },
  ["lista.nvim"] = {
    commands = { "Lista" },
    config = { "\27LJ\2\nñ\1\0\0\3\0\6\1\0156\0\0\0009\0\1\0009\0\2\0\t\0\0\0X\0\tÄ6\0\0\0009\0\1\0+\1\0\0=\1\2\0006\0\0\0009\0\3\0009\0\4\0'\2\5\0B\0\2\1K\0\1\0//usr/share/nvim/runtime/plugin/rplugin.vim\vsource\bcmd\26loaded_remote_plugins\6g\bvim\2\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/lista.nvim",
    url = "https://github.com/lambdalisue/lista.nvim"
  },
  ["live-command.nvim"] = {
    commands = { "G", "V", "Norm" },
    config = { 'require"live-command".setup{\n  commands = {\n    G = {\n      cmd = "g"\n    },\n    Norm = {\n      cmd = "norm!"\n    },\n    V = {\n      cmd = "v"\n    }\n  }\n}' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/live-command.nvim",
    url = "https://github.com/smjonas/live-command.nvim"
  },
  ["lualine.nvim"] = {
    config = { 'require"lualine".setup{}' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["markdown-preview.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  ["marks.nvim"] = {
    config = { 'require"marks".setup{}' },
    keys = { { "n", "m" }, { "n", "dm" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/marks.nvim",
    url = "https://github.com/chentoast/marks.nvim"
  },
  ["mason.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["mini.nvim"] = {
    config = { 'require("config.mini")' },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/mini.nvim",
    url = "https://github.com/echasnovski/mini.nvim"
  },
  ["muren.nvim"] = {
    commands = { "MurenToggle", "MurenOpen", "MurenClose", "MurenFresh", "MurenUnique" },
    config = { 'require"muren".setup{}' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/muren.nvim",
    url = "https://github.com/acksld/muren.nvim"
  },
  ["neodev.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/neodev.nvim",
    url = "https://github.com/folke/neodev.nvim"
  },
  neorg = {
    config = { 'require"neorg".setup{\n  load = {\n    ["core.concealer"] = {},\n    ["core.defaults"] = {},\n    ["core.export"] = {},\n    ["core.export.markdown"] = {}\n  }\n}' },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/neorg",
    url = "https://github.com/nvim-neorg/neorg"
  },
  neoterm = {
    commands = { "T", "Tnew", "Topen", "Texec" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/neoterm",
    url = "https://github.com/kassio/neoterm"
  },
  ["nightfox.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/nightfox.nvim",
    url = "https://github.com/edeneast/nightfox.nvim"
  },
  ["nvim-cmp"] = {
    after = { "cmp-cmdline-history", "cmp-spell", "cmp-nvim-lsp", "cmp-calc", "cmp-async-path", "codeium.nvim", "cmp-nvim-lsp-signature-help", "cmp-cmdline", "cmp-buffer", "cmp-rg" },
    config = { 'require("config.cmp-nvim")' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-genghis"] = {
    commands = { "NewFromSelection", "Duplicate", "Rename", "Trash", "Move", "CopyFilename", "CopyFilepath", "Chmodx", "New" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/nvim-genghis",
    url = "https://github.com/chrisgrieser/nvim-genghis"
  },
  ["nvim-lightbulb"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/nvim-lightbulb",
    url = "https://github.com/kosayoda/nvim-lightbulb"
  },
  ["nvim-lspconfig"] = {
    commands = { "LspStart" },
    config = { 'require("config.lsp")' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-luapad"] = {
    commands = { "Luapad" },
    config = { 'require("config.luapad")' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/nvim-luapad",
    url = "https://github.com/rafcamlet/nvim-luapad"
  },
  ["nvim-notify"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-spectre"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/nvim-spectre",
    url = "https://github.com/nvim-pack/nvim-spectre"
  },
  ["nvim-treesitter"] = {
    config = { 'require("config.treesitter")' },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-endwise"] = {
    config = { 'vim.cmd"TSEnable endwise"' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-endwise",
    url = "https://github.com/rrethy/nvim-treesitter-endwise"
  },
  ["nvim-ts-autotag"] = {
    config = { 'vim.cmd"TSEnable autotag"' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["obsidian.nvim"] = {
    after_files = { "/home/user/.local/share/nvim/site/pack/packer/opt/obsidian.nvim/after/plugin/cmp_obsidian.lua", "/home/user/.local/share/nvim/site/pack/packer/opt/obsidian.nvim/after/plugin/cmp_obsidian_new.lua" },
    config = { 'require"obsidian".setup{}' },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/obsidian.nvim",
    url = "https://github.com/epwalsh/obsidian.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["pantran.nvim"] = {
    commands = { "Pantran" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/pantran.nvim",
    url = "https://github.com/potamides/pantran.nvim"
  },
  pinkmare = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/pinkmare",
    url = "https://github.com/matsuuu/pinkmare"
  },
  ["plenary.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["pretty-fold.nvim"] = {
    config = { 'require"pretty-fold".setup{}' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/pretty-fold.nvim",
    url = "https://github.com/anuvyklack/pretty-fold.nvim"
  },
  pyro = {
    commands = { "Pyro" },
    config = { "\27LJ\2\nñ\1\0\0\3\0\6\1\0156\0\0\0009\0\1\0009\0\2\0\t\0\0\0X\0\tÄ6\0\0\0009\0\1\0+\1\0\0=\1\2\0006\0\0\0009\0\3\0009\0\4\0'\2\5\0B\0\2\1K\0\1\0//usr/share/nvim/runtime/plugin/rplugin.vim\vsource\bcmd\26loaded_remote_plugins\6g\bvim\2\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/pyro",
    url = "https://github.com/rraks/pyro"
  },
  ["rainbow-delimiters.nvim"] = {
    config = { "\27LJ\2\nv\0\0\3\0\b\0\v6\0\0\0009\0\1\0005\1\4\0005\2\3\0=\2\5\1=\1\2\0006\0\0\0009\0\6\0'\2\a\0B\0\2\1K\0\1\0\21TSEnable rainbow\bcmd\14blacklist\1\0\0\1\2\0\0\bzig\23rainbow_delimiters\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/rainbow-delimiters.nvim",
    url = "https://gitlab.com/HiPhish/rainbow-delimiters.nvim"
  },
  ["sibling-swap.nvim"] = {
    config = { "\27LJ\2\nº\1\0\0\6\0\n\0\0196\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0019\2\4\0005\4\5\0B\2\2\1\18\2\1\0'\4\6\0009\5\a\0B\2\3\1\18\2\1\0'\4\b\0009\5\t\0B\2\3\1K\0\1\0\19swap_with_left\a<a\20swap_with_right\a>a\1\0\1\24use_default_keymaps\1\nsetup\bnno\17utils.keymap\17sibling-swap\frequire\0" },
    keys = { { "n", ">a" }, { "n", "<a" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/sibling-swap.nvim",
    url = "https://github.com/wansmer/sibling-swap.nvim"
  },
  ["ssr.nvim"] = {
    config = { 'require"ssr".setup{}' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/ssr.nvim",
    url = "https://github.com/cshuaimin/ssr.nvim"
  },
  ["starry.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/starry.nvim",
    url = "https://github.com/ray-x/starry.nvim"
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
  ["syntax-tree-surfer"] = {
    config = { 'require("config.minimove-treesurfer")' },
    keys = { { "n", "vx" }, { "n", "vn" }, { "n", "<A-j>" }, { "n", "<A-k>" }, { "n", "<A-S-k>" }, { "n", "<A-S-j>" }, { "n", "gF" }, { "n", "gX" }, { "x", "<C-j>" }, { "x", "<C-k>" }, { "x", "<C-h>" }, { "x", "<C-l>" }, { "x", "<C-S-h>" }, { "x", "<C-S-j>" }, { "x", "<C-S-k>" }, { "x", "<C-S-l>" }, { "x", "<A-k>" }, { "x", "<A-j>" }, { "x", "gX" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/syntax-tree-surfer",
    url = "https://github.com/ziontee113/syntax-tree-surfer"
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
  ["telescope-live-grep-args.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/telescope-live-grep-args.nvim",
    url = "https://github.com/nvim-telescope/telescope-live-grep-args.nvim"
  },
  ["telescope-project.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/telescope-project.nvim",
    url = "https://github.com/nvim-telescope/telescope-project.nvim"
  },
  ["telescope-symbols.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/telescope-symbols.nvim",
    url = "https://github.com/nvim-telescope/telescope-symbols.nvim"
  },
  ["telescope-tabs"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/telescope-tabs",
    url = "https://github.com/lukaspietzschmann/telescope-tabs"
  },
  ["telescope-ui-select.nvim"] = {
    loaded = true,
    needs_bufread = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/telescope-ui-select.nvim",
    url = "https://github.com/nvim-telescope/telescope-ui-select.nvim"
  },
  ["telescope.nvim"] = {
    commands = { "Telescope" },
    config = { "\27LJ\2\nZ\0\0\4\0\5\0\n6\0\0\0'\2\1\0B\0\2\0029\1\2\0'\3\3\0B\1\2\0019\1\4\0004\3\0\0B\1\2\1K\0\1\0\nsetup\bfzf\19load_extension\14telescope\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
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
  ["twilight.nvim"] = {
    commands = { "Twilight" },
    config = { 'require"twilight".setup{}' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/twilight.nvim",
    url = "https://github.com/folke/twilight.nvim"
  },
  ["ultimate-autopair.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/ultimate-autopair.nvim",
    url = "https://github.com/altermo/ultimate-autopair.nvim"
  },
  ["venn.nvim"] = {
    commands = { "VBox", "VBoxD", "VBoxH", "VBoxO", "VBoxDO", "VBoxHO", "VFill" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/venn.nvim",
    url = "https://github.com/jbyuki/venn.nvim"
  },
  ["vim-choosewin"] = {
    config = { "\27LJ\2\nÇ\1\0\0\4\0\b\0\f6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\3\0'\2\4\0B\0\2\0029\0\5\0'\2\6\0'\3\a\0B\0\3\1K\0\1\0\16:ChooseWin\r\v<C-w> \bnno\17utils.keymap\frequire\29choosewin_overlay_enable\6g\bvim\0" },
    keys = { { "", "<C-w><space>" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-choosewin",
    url = "https://github.com/t9md/vim-choosewin"
  },
  ["vim-ditto"] = {
    commands = { "Ditto", "DittoSent", "DittoPar", "DittoFile", "DittoOn", "DittoOff", "DittoUpdate", "DittoSentOn", "DittoParOn", "DittoFileOn", "NoDitto", "ToggleDitto" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-ditto",
    url = "https://github.com/dbmrq/vim-ditto"
  },
  ["vim-exchange"] = {
    keys = { { "n", "cx" }, { "x", "X" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-exchange",
    url = "https://github.com/tommcdo/vim-exchange"
  },
  ["vim-ghost"] = {
    commands = { "GhostStart" },
    config = { "\27LJ\2\nñ\1\0\0\3\0\6\1\0156\0\0\0009\0\1\0009\0\2\0\t\0\0\0X\0\tÄ6\0\0\0009\0\1\0+\1\0\0=\1\2\0006\0\0\0009\0\3\0009\0\4\0'\2\5\0B\0\2\1K\0\1\0//usr/share/nvim/runtime/plugin/rplugin.vim\vsource\bcmd\26loaded_remote_plugins\6g\bvim\2\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-ghost",
    url = "https://github.com/raghur/vim-ghost"
  },
  ["vim-gruvbox8"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/vim-gruvbox8",
    url = "https://github.com/lifepillar/vim-gruvbox8"
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
  ["vim-nightfly-colors"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/vim-nightfly-colors",
    url = "https://github.com/bluz71/vim-nightfly-colors"
  },
  ["vim-table-mode"] = {
    commands = { "TableModeToggle" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-table-mode",
    url = "https://github.com/dhruvasagar/vim-table-mode"
  },
  ["vim-translator"] = {
    config = { 'require("config.translator")' },
    keys = { { "x", "√æ" }, { "x", "√û" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-translator",
    url = "https://github.com/voldikss/vim-translator"
  },
  ["vim-visual-multi"] = {
    keys = { { "n", "\\\\" }, { "n", "<C-n>" }, { "", "x" }, { "", "<C-n>" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-visual-multi",
    url = "https://github.com/mg979/vim-visual-multi"
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
    commands = { "Wordy", "NoWordy" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-wordy",
    url = "https://github.com/reedes/vim-wordy"
  },
  ["which-key.nvim"] = {
    commands = { "WhichKey" },
    config = { 'require("config.which-key")' },
    keys = { { "n", "<space>" }, { "n", "g" }, { "n", "<char-92>" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  },
  ["winshift.nvim"] = {
    config = { "\27LJ\2\n–\1\0\0\v\0\v\0\0266\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\3\0005\2\4\0B\0\2\4H\3\rÄ6\5\0\0'\a\5\0B\5\2\0029\5\6\5'\a\a\0\18\b\3\0'\t\b\0&\a\t\a'\b\t\0\18\t\4\0'\n\n\0&\b\n\bB\5\3\1F\3\3\3R\3Ò\127K\0\1\0\6\r\15:WinShift \6>\n<C-S-\bnno\17utils.keymap\1\0\4\6j\tdown\6h\tleft\6k\aup\6l\nright\npairs\nsetup\rwinshift\frequire\0" },
    keys = { { "n", "<C-S-h>" }, { "n", "<C-S-j>" }, { "n", "<C-S-k>" }, { "n", "<C-S-l>" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/winshift.nvim",
    url = "https://github.com/sindrets/winshift.nvim"
  },
  ["yanky.nvim"] = {
    config = { 'require("config.yanky")' },
    keys = { { "n", "p" }, { "n", "P" }, { "n", "<A-p>" }, { "n", "<A-P>" }, { "x", "p" }, { "x", "P" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/yanky.nvim",
    url = "https://github.com/gbprod/yanky.nvim"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^genghis"] = "nvim-genghis",
  ["^luapad"] = "nvim-luapad",
  ["^mason"] = "mason.nvim",
  ["^neodev"] = "neodev.nvim",
  ["^notify"] = "nvim-notify",
  ["^nvim%-lightbulb"] = "nvim-lightbulb",
  ["^plenary"] = "plenary.nvim",
  ["^spectre"] = "nvim-spectre",
  ["^ssr"] = "ssr.nvim",
  ["^syntax%-tree%-surfer"] = "syntax-tree-surfer",
  ["^telescope"] = "telescope.nvim",
  ["^twilight"] = "twilight.nvim"
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

-- Setup for: nvim-notify
time([[Setup for nvim-notify]], true)
vim.notify=function (...) require"notify"(...) end
time([[Setup for nvim-notify]], false)
-- Setup for: telescope-ui-select.nvim
time([[Setup for telescope-ui-select.nvim]], true)
try_loadstring("\27LJ\2\np\2\0\4\0\a\0\f6\0\0\0'\2\1\0B\0\2\0029\1\2\0'\3\3\0B\1\2\0016\1\4\0009\1\5\0019\1\6\1G\3\0\0A\1\0\1K\0\1\0\vselect\aui\bvim\14ui-select\19load_extension\14telescope\frequire*\1\0\2\0\4\0\0056\0\0\0009\0\1\0003\1\3\0=\1\2\0K\0\1\0\0\vselect\aui\bvim\0", "setup", "telescope-ui-select.nvim")
time([[Setup for telescope-ui-select.nvim]], false)
time([[packadd for telescope-ui-select.nvim]], true)
vim.cmd [[packadd telescope-ui-select.nvim]]
time([[packadd for telescope-ui-select.nvim]], false)
-- Setup for: dirbuf.nvim
time([[Setup for dirbuf.nvim]], true)
try_loadstring("\27LJ\2\nî\1\0\0\4\0\5\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0005\3\4\0B\0\3\1K\0\1\0\1\0\1\fcommandEif isdirectory(expand('%')) && !&modified|execute 'Dirbuf'|endif\rBufEnter\24nvim_create_autocmd\bapi\bvim\0", "setup", "dirbuf.nvim")
time([[Setup for dirbuf.nvim]], false)
-- Setup for: codeium.vim
time([[Setup for codeium.vim]], true)
try_loadstring("\27LJ\2\nY\0\0\2\0\4\0\t6\0\0\0009\0\1\0+\1\1\0=\1\2\0006\0\0\0009\0\1\0+\1\2\0=\1\3\0K\0\1\0\19codeium_manual\29codeium_disable_bindings\6g\bvim\0", "setup", "codeium.vim")
time([[Setup for codeium.vim]], false)
-- Setup for: pyro
time([[Setup for pyro]], true)
try_loadstring("\27LJ\2\nC\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\22/home/user/.macro\20pyro_macro_path\6g\bvim\0", "setup", "pyro")
time([[Setup for pyro]], false)
-- Setup for: vim-visual-multi
time([[Setup for vim-visual-multi]], true)
vim.cmd"let g:VM_maps={}"
time([[Setup for vim-visual-multi]], false)
-- Setup for: dashboard-nvim
time([[Setup for dashboard-nvim]], true)
try_loadstring("\27LJ\2\n‡\1\0\0\3\0\n\2\0316\0\0\0009\0\1\0009\0\2\0B\0\1\2\t\0\0\0X\0\24Ä6\0\0\0009\0\3\0009\0\4\0)\2\0\0B\0\2\2\t\0\1\0X\0\17Ä6\0\0\0009\0\3\0009\0\5\0B\0\1\2\a\0\6\0X\0\vÄ6\0\0\0009\0\3\0009\0\a\0)\2\0\0B\0\2\2\a\0\6\0X\0\4Ä6\0\0\0009\0\b\0'\2\t\0B\0\2\1K\0\1\0\14Dashboard\bcmd\22nvim_buf_get_name\5\26nvim_get_current_line\24nvim_buf_line_count\bapi\targc\afn\bvim\0\2a\1\0\5\0\a\0\t6\0\0\0009\0\1\0009\0\2\0005\2\3\0005\3\5\0003\4\4\0=\4\6\3B\0\3\1K\0\1\0\rcallback\1\0\0\0\1\2\0\0\rVimenter\24nvim_create_autocmd\bapi\bvim\0", "setup", "dashboard-nvim")
time([[Setup for dashboard-nvim]], false)
-- Config for: guess-indent.nvim
time([[Config for guess-indent.nvim]], true)
require"guess-indent".setup{}
time([[Config for guess-indent.nvim]], false)
-- Config for: flash.nvim
time([[Config for flash.nvim]], true)
require("config.flash")
time([[Config for flash.nvim]], false)
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
pcall(vim.api.nvim_create_user_command, 'ThesaurusQueryLookupCurrentWord', function(cmdargs)
          require('packer.load')({'thesaurus_query.vim'}, { cmd = 'ThesaurusQueryLookupCurrentWord', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'thesaurus_query.vim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('ThesaurusQueryLookupCurrentWord ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'BWipeout', function(cmdargs)
          require('packer.load')({'close-buffers.nvim'}, { cmd = 'BWipeout', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'close-buffers.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('BWipeout ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'MurenClose', function(cmdargs)
          require('packer.load')({'muren.nvim'}, { cmd = 'MurenClose', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'muren.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('MurenClose ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Duplicate', function(cmdargs)
          require('packer.load')({'nvim-genghis'}, { cmd = 'Duplicate', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'nvim-genghis'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Duplicate ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'NoDitto', function(cmdargs)
          require('packer.load')({'vim-ditto'}, { cmd = 'NoDitto', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-ditto'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('NoDitto ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'DiffviewLog', function(cmdargs)
          require('packer.load')({'diffview.nvim'}, { cmd = 'DiffviewLog', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'diffview.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('DiffviewLog ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Move', function(cmdargs)
          require('packer.load')({'nvim-genghis'}, { cmd = 'Move', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'nvim-genghis'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Move ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'V', function(cmdargs)
          require('packer.load')({'live-command.nvim'}, { cmd = 'V', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'live-command.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('V ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Pantran', function(cmdargs)
          require('packer.load')({'pantran.nvim'}, { cmd = 'Pantran', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'pantran.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Pantran ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'DiffviewOpen', function(cmdargs)
          require('packer.load')({'diffview.nvim'}, { cmd = 'DiffviewOpen', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'diffview.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('DiffviewOpen ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'CodeWindow', function(cmdargs)
          require('packer.load')({'codewindow.nvim'}, { cmd = 'CodeWindow', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'codewindow.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('CodeWindow ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'VBoxO', function(cmdargs)
          require('packer.load')({'venn.nvim'}, { cmd = 'VBoxO', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'venn.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('VBoxO ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Twilight', function(cmdargs)
          require('packer.load')({'twilight.nvim'}, { cmd = 'Twilight', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'twilight.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Twilight ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'DittoFileOn', function(cmdargs)
          require('packer.load')({'vim-ditto'}, { cmd = 'DittoFileOn', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-ditto'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('DittoFileOn ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'CopyFilepath', function(cmdargs)
          require('packer.load')({'nvim-genghis'}, { cmd = 'CopyFilepath', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'nvim-genghis'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('CopyFilepath ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'BDelete', function(cmdargs)
          require('packer.load')({'close-buffers.nvim'}, { cmd = 'BDelete', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'close-buffers.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('BDelete ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'MurenOpen', function(cmdargs)
          require('packer.load')({'muren.nvim'}, { cmd = 'MurenOpen', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'muren.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('MurenOpen ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'New', function(cmdargs)
          require('packer.load')({'nvim-genghis'}, { cmd = 'New', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'nvim-genghis'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('New ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'CECompile', function(cmdargs)
          require('packer.load')({'compiler-explorer.nvim'}, { cmd = 'CECompile', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'compiler-explorer.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('CECompile ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'DittoSent', function(cmdargs)
          require('packer.load')({'vim-ditto'}, { cmd = 'DittoSent', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-ditto'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('DittoSent ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Norm', function(cmdargs)
          require('packer.load')({'live-command.nvim'}, { cmd = 'Norm', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'live-command.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Norm ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'VFill', function(cmdargs)
          require('packer.load')({'venn.nvim'}, { cmd = 'VFill', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'venn.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('VFill ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'G', function(cmdargs)
          require('packer.load')({'live-command.nvim'}, { cmd = 'G', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'live-command.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('G ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'AsyncRun', function(cmdargs)
          require('packer.load')({'asyncrun.vim'}, { cmd = 'AsyncRun', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'asyncrun.vim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('AsyncRun ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'TableModeToggle', function(cmdargs)
          require('packer.load')({'vim-table-mode'}, { cmd = 'TableModeToggle', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-table-mode'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('TableModeToggle ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'WhichKey', function(cmdargs)
          require('packer.load')({'which-key.nvim'}, { cmd = 'WhichKey', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'which-key.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('WhichKey ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'DittoUpdate', function(cmdargs)
          require('packer.load')({'vim-ditto'}, { cmd = 'DittoUpdate', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-ditto'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('DittoUpdate ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Luapad', function(cmdargs)
          require('packer.load')({'nvim-luapad'}, { cmd = 'Luapad', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'nvim-luapad'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Luapad ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Pyro', function(cmdargs)
          require('packer.load')({'pyro'}, { cmd = 'Pyro', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'pyro'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Pyro ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'MurenFresh', function(cmdargs)
          require('packer.load')({'muren.nvim'}, { cmd = 'MurenFresh', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'muren.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('MurenFresh ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Switch', function(cmdargs)
          require('packer.load')({'switch.vim'}, { cmd = 'Switch', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'switch.vim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Switch ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'CopyFilename', function(cmdargs)
          require('packer.load')({'nvim-genghis'}, { cmd = 'CopyFilename', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'nvim-genghis'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('CopyFilename ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Wordy', function(cmdargs)
          require('packer.load')({'vim-wordy'}, { cmd = 'Wordy', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-wordy'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Wordy ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'DiffviewToggleFiles', function(cmdargs)
          require('packer.load')({'diffview.nvim'}, { cmd = 'DiffviewToggleFiles', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'diffview.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('DiffviewToggleFiles ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Capture', function(cmdargs)
          require('packer.load')({'capture.vim'}, { cmd = 'Capture', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'capture.vim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Capture ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'VBoxHO', function(cmdargs)
          require('packer.load')({'venn.nvim'}, { cmd = 'VBoxHO', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'venn.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('VBoxHO ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Dashboard', function(cmdargs)
          require('packer.load')({'dashboard-nvim'}, { cmd = 'Dashboard', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'dashboard-nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Dashboard ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'NewFromSelection', function(cmdargs)
          require('packer.load')({'nvim-genghis'}, { cmd = 'NewFromSelection', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'nvim-genghis'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('NewFromSelection ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'DittoOn', function(cmdargs)
          require('packer.load')({'vim-ditto'}, { cmd = 'DittoOn', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-ditto'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('DittoOn ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'GhostStart', function(cmdargs)
          require('packer.load')({'vim-ghost'}, { cmd = 'GhostStart', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-ghost'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('GhostStart ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'ThesaurusQueryReplace', function(cmdargs)
          require('packer.load')({'thesaurus_query.vim'}, { cmd = 'ThesaurusQueryReplace', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'thesaurus_query.vim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('ThesaurusQueryReplace ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Texec', function(cmdargs)
          require('packer.load')({'neoterm'}, { cmd = 'Texec', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'neoterm'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Texec ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Topen', function(cmdargs)
          require('packer.load')({'neoterm'}, { cmd = 'Topen', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'neoterm'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Topen ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Trash', function(cmdargs)
          require('packer.load')({'nvim-genghis'}, { cmd = 'Trash', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'nvim-genghis'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Trash ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'ThesaurusQueryReplaceCurrentWord', function(cmdargs)
          require('packer.load')({'thesaurus_query.vim'}, { cmd = 'ThesaurusQueryReplaceCurrentWord', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'thesaurus_query.vim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('ThesaurusQueryReplaceCurrentWord ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Tabularize', function(cmdargs)
          require('packer.load')({'tabular'}, { cmd = 'Tabularize', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'tabular'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Tabularize ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Telescope', function(cmdargs)
          require('packer.load')({'telescope.nvim'}, { cmd = 'Telescope', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'telescope.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Telescope ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'SwitchExtend', function(cmdargs)
          require('packer.load')({'switch.vim'}, { cmd = 'SwitchExtend', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'switch.vim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('SwitchExtend ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'SwitchReverse', function(cmdargs)
          require('packer.load')({'switch.vim'}, { cmd = 'SwitchReverse', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'switch.vim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('SwitchReverse ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'DittoParOn', function(cmdargs)
          require('packer.load')({'vim-ditto'}, { cmd = 'DittoParOn', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-ditto'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('DittoParOn ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'DiffviewFocusFiles', function(cmdargs)
          require('packer.load')({'diffview.nvim'}, { cmd = 'DiffviewFocusFiles', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'diffview.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('DiffviewFocusFiles ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'VBox', function(cmdargs)
          require('packer.load')({'venn.nvim'}, { cmd = 'VBox', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'venn.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('VBox ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'LspStart', function(cmdargs)
          require('packer.load')({'nvim-lspconfig'}, { cmd = 'LspStart', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'nvim-lspconfig'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('LspStart ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Chmodx', function(cmdargs)
          require('packer.load')({'nvim-genghis'}, { cmd = 'Chmodx', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'nvim-genghis'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Chmodx ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Lista', function(cmdargs)
          require('packer.load')({'lista.nvim'}, { cmd = 'Lista', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'lista.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Lista ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Tnew', function(cmdargs)
          require('packer.load')({'neoterm'}, { cmd = 'Tnew', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'neoterm'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Tnew ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'MurenToggle', function(cmdargs)
          require('packer.load')({'muren.nvim'}, { cmd = 'MurenToggle', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'muren.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('MurenToggle ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'MundoToggle', function(cmdargs)
          require('packer.load')({'vim-mundo'}, { cmd = 'MundoToggle', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-mundo'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('MundoToggle ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'DiffviewClose', function(cmdargs)
          require('packer.load')({'diffview.nvim'}, { cmd = 'DiffviewClose', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'diffview.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('DiffviewClose ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Ditto', function(cmdargs)
          require('packer.load')({'vim-ditto'}, { cmd = 'Ditto', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-ditto'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Ditto ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'DittoPar', function(cmdargs)
          require('packer.load')({'vim-ditto'}, { cmd = 'DittoPar', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-ditto'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('DittoPar ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'VBoxDO', function(cmdargs)
          require('packer.load')({'venn.nvim'}, { cmd = 'VBoxDO', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'venn.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('VBoxDO ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'VBoxH', function(cmdargs)
          require('packer.load')({'venn.nvim'}, { cmd = 'VBoxH', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'venn.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('VBoxH ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'VBoxD', function(cmdargs)
          require('packer.load')({'venn.nvim'}, { cmd = 'VBoxD', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'venn.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('VBoxD ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'ToggleDitto', function(cmdargs)
          require('packer.load')({'vim-ditto'}, { cmd = 'ToggleDitto', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-ditto'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('ToggleDitto ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'DittoSentOn', function(cmdargs)
          require('packer.load')({'vim-ditto'}, { cmd = 'DittoSentOn', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-ditto'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('DittoSentOn ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'DittoOff', function(cmdargs)
          require('packer.load')({'vim-ditto'}, { cmd = 'DittoOff', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-ditto'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('DittoOff ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'DiffviewRefresh', function(cmdargs)
          require('packer.load')({'diffview.nvim'}, { cmd = 'DiffviewRefresh', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'diffview.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('DiffviewRefresh ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'IncRename', function(cmdargs)
          require('packer.load')({'inc-rename.nvim'}, { cmd = 'IncRename', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'inc-rename.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('IncRename ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'MurenUnique', function(cmdargs)
          require('packer.load')({'muren.nvim'}, { cmd = 'MurenUnique', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'muren.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('MurenUnique ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Rename', function(cmdargs)
          require('packer.load')({'nvim-genghis'}, { cmd = 'Rename', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'nvim-genghis'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Rename ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'CarbonNow', function(cmdargs)
          require('packer.load')({'carbon-now.nvim'}, { cmd = 'CarbonNow', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'carbon-now.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('CarbonNow ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Thesaurus', function(cmdargs)
          require('packer.load')({'thesaurus_query.vim'}, { cmd = 'Thesaurus', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'thesaurus_query.vim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Thesaurus ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Dirbuf', function(cmdargs)
          require('packer.load')({'dirbuf.nvim'}, { cmd = 'Dirbuf', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'dirbuf.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Dirbuf ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'AsyncStop', function(cmdargs)
          require('packer.load')({'asyncrun.vim'}, { cmd = 'AsyncStop', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'asyncrun.vim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('AsyncStop ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Colortils', function(cmdargs)
          require('packer.load')({'colortils.nvim'}, { cmd = 'Colortils', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'colortils.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Colortils ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'NoWordy', function(cmdargs)
          require('packer.load')({'vim-wordy'}, { cmd = 'NoWordy', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-wordy'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('NoWordy ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'DittoFile', function(cmdargs)
          require('packer.load')({'vim-ditto'}, { cmd = 'DittoFile', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-ditto'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('DittoFile ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'T', function(cmdargs)
          require('packer.load')({'neoterm'}, { cmd = 'T', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'neoterm'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('T ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'DashboardNewFile', function(cmdargs)
          require('packer.load')({'dashboard-nvim'}, { cmd = 'DashboardNewFile', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'dashboard-nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('DashboardNewFile ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'DiffviewFileHistory', function(cmdargs)
          require('packer.load')({'diffview.nvim'}, { cmd = 'DiffviewFileHistory', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'diffview.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('DiffviewFileHistory ', 'cmdline')
      end})
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[nnoremap <silent> \a <cmd>lua require("packer.load")({'attempt.nvim'}, { keys = "\\a", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> gr <cmd>lua require("packer.load")({'inc-rename.nvim'}, { keys = "gr", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> cx <cmd>lua require("packer.load")({'vim-exchange'}, { keys = "cx", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> j <cmd>lua require("packer.load")({'accelerated-jk.nvim'}, { keys = "j", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> p <cmd>lua require("packer.load")({'yanky.nvim'}, { keys = "p", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[inoremap <silent> <A-'> <cmd>lua require("packer.load")({'codeium.vim'}, { keys = "<lt>A-'>" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> >a <cmd>lua require("packer.load")({'sibling-swap.nvim'}, { keys = ">a", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> √û <cmd>lua require("packer.load")({'vim-translator'}, { keys = "√û", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> √æ <cmd>lua require("packer.load")({'vim-translator'}, { keys = "√æ", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> m <cmd>lua require("packer.load")({'marks.nvim'}, { keys = "m", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> x <cmd>lua require("packer.load")({'vim-visual-multi'}, { keys = "x", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <C-n> <cmd>lua require("packer.load")({'vim-visual-multi'}, { keys = "<lt>C-n>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> gX <cmd>lua require("packer.load")({'syntax-tree-surfer'}, { keys = "gX", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> gs <cmd>lua require("packer.load")({'switch.vim'}, { keys = "gs", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> \\ <cmd>lua require("packer.load")({'vim-visual-multi'}, { keys = "\\\\", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <char-92> <cmd>lua require("packer.load")({'which-key.nvim'}, { keys = "<lt>char-92>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <C-S-h> <cmd>lua require("packer.load")({'winshift.nvim'}, { keys = "<lt>C-S-h>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> vx <cmd>lua require("packer.load")({'syntax-tree-surfer'}, { keys = "vx", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> <C-x> <cmd>lua require("packer.load")({'dial.nvim'}, { keys = "<lt>C-x>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> <C-a> <cmd>lua require("packer.load")({'dial.nvim'}, { keys = "<lt>C-a>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> <A-j> <cmd>lua require("packer.load")({'syntax-tree-surfer'}, { keys = "<lt>A-j>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> X <cmd>lua require("packer.load")({'vim-exchange'}, { keys = "X", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <C-x> <cmd>lua require("packer.load")({'dial.nvim'}, { keys = "<lt>C-x>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <C-a> <cmd>lua require("packer.load")({'dial.nvim'}, { keys = "<lt>C-a>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> P <cmd>lua require("packer.load")({'yanky.nvim'}, { keys = "P", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <C-S-l> <cmd>lua require("packer.load")({'winshift.nvim'}, { keys = "<lt>C-S-l>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <C-S-k> <cmd>lua require("packer.load")({'winshift.nvim'}, { keys = "<lt>C-S-k>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <C-S-j> <cmd>lua require("packer.load")({'winshift.nvim'}, { keys = "<lt>C-S-j>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <A-S-j> <cmd>lua require("packer.load")({'syntax-tree-surfer'}, { keys = "<lt>A-S-j>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> g <cmd>lua require("packer.load")({'which-key.nvim'}, { keys = "g", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> P <cmd>lua require("packer.load")({'yanky.nvim'}, { keys = "P", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> p <cmd>lua require("packer.load")({'yanky.nvim'}, { keys = "p", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <A-P> <cmd>lua require("packer.load")({'yanky.nvim'}, { keys = "<lt>A-P>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <A-S-k> <cmd>lua require("packer.load")({'syntax-tree-surfer'}, { keys = "<lt>A-S-k>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <A-k> <cmd>lua require("packer.load")({'syntax-tree-surfer'}, { keys = "<lt>A-k>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> vn <cmd>lua require("packer.load")({'syntax-tree-surfer'}, { keys = "vn", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> <C-l> <cmd>lua require("packer.load")({'syntax-tree-surfer'}, { keys = "<lt>C-l>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <space> <cmd>lua require("packer.load")({'which-key.nvim'}, { keys = "<lt>space>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> <C-S-j> <cmd>lua require("packer.load")({'syntax-tree-surfer'}, { keys = "<lt>C-S-j>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> gF <cmd>lua require("packer.load")({'syntax-tree-surfer'}, { keys = "gF", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> dm <cmd>lua require("packer.load")({'marks.nvim'}, { keys = "dm", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <C-n> <cmd>lua require("packer.load")({'vim-visual-multi'}, { keys = "<lt>C-n>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> j <cmd>lua require("packer.load")({'accelerated-jk.nvim'}, { keys = "j", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> k <cmd>lua require("packer.load")({'accelerated-jk.nvim'}, { keys = "k", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> <C-S-k> <cmd>lua require("packer.load")({'syntax-tree-surfer'}, { keys = "<lt>C-S-k>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <a <cmd>lua require("packer.load")({'sibling-swap.nvim'}, { keys = "<lt>a", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> gX <cmd>lua require("packer.load")({'syntax-tree-surfer'}, { keys = "gX", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> j <cmd>lua require("packer.load")({'accelerated-jk.nvim'}, { keys = "j", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> <C-j> <cmd>lua require("packer.load")({'syntax-tree-surfer'}, { keys = "<lt>C-j>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> <C-k> <cmd>lua require("packer.load")({'syntax-tree-surfer'}, { keys = "<lt>C-k>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> <C-h> <cmd>lua require("packer.load")({'syntax-tree-surfer'}, { keys = "<lt>C-h>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> <C-S-h> <cmd>lua require("packer.load")({'syntax-tree-surfer'}, { keys = "<lt>C-S-h>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <A-p> <cmd>lua require("packer.load")({'yanky.nvim'}, { keys = "<lt>A-p>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <C-w><space> <cmd>lua require("packer.load")({'vim-choosewin'}, { keys = "<lt>C-w><lt>space>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <A-j> <cmd>lua require("packer.load")({'syntax-tree-surfer'}, { keys = "<lt>A-j>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> <C-S-l> <cmd>lua require("packer.load")({'syntax-tree-surfer'}, { keys = "<lt>C-S-l>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> <A-k> <cmd>lua require("packer.load")({'syntax-tree-surfer'}, { keys = "<lt>A-k>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> \ww <cmd>lua require("packer.load")({'vim-windowswap'}, { keys = "\\ww", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType text ++once lua require("packer.load")({'easyread.nvim'}, { ft = "text" }, _G.packer_plugins)]]
vim.cmd [[au FileType norg ++once lua require("packer.load")({'neorg'}, { ft = "norg" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'markdown-preview.nvim', 'obsidian.nvim', 'vim-markdown-toc', 'easyread.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType html ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "html" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'nvim-cmp', 'nvim-treesitter-endwise'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
vim.cmd [[au CmdlineEnter * ++once lua require("packer.load")({'nvim-cmp'}, { event = "CmdlineEnter *" }, _G.packer_plugins)]]
vim.cmd [[au User isfolded ++once lua require("packer.load")({'pretty-fold.nvim'}, { event = "User isfolded" }, _G.packer_plugins)]]
vim.cmd [[au TextYankPost * ++once lua require("packer.load")({'yanky.nvim'}, { event = "TextYankPost *" }, _G.packer_plugins)]]
vim.cmd [[au User autotag ++once lua require("packer.load")({'nvim-ts-autotag'}, { event = "User autotag" }, _G.packer_plugins)]]
vim.cmd [[au User s1 ++once lua require("packer.load")({'lualine.nvim', 'indent-blankline.nvim', 'due.nvim', 'rainbow-delimiters.nvim', 'nvim-lspconfig'}, { event = "User s1" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/user/.local/share/nvim/site/pack/packer/opt/neorg/ftdetect/norg.lua]], true)
vim.cmd [[source /home/user/.local/share/nvim/site/pack/packer/opt/neorg/ftdetect/norg.lua]]
time([[Sourcing ftdetect script at: /home/user/.local/share/nvim/site/pack/packer/opt/neorg/ftdetect/norg.lua]], false)
time([[Sourcing ftdetect script at: /home/user/.local/share/nvim/site/pack/packer/opt/vim-markdown-toc/ftdetect/markdown.vim]], true)
vim.cmd [[source /home/user/.local/share/nvim/site/pack/packer/opt/vim-markdown-toc/ftdetect/markdown.vim]]
time([[Sourcing ftdetect script at: /home/user/.local/share/nvim/site/pack/packer/opt/vim-markdown-toc/ftdetect/markdown.vim]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
