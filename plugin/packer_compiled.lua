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
    config = { "\27LJ\2\nY\0\0\4\0\5\0\b6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0'\3\4\0B\0\3\1K\0\1\0\27<Plug>(FastFoldUpdate)\6Z\bnno\17utils.keymap\frequire\0" },
    keys = { { "", "Z" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/FastFold",
    url = "https://github.com/Konfekt/FastFold"
  },
  ["HighStr.nvim"] = {
    commands = { "HSHighlight", "HSRmHighlight" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/HighStr.nvim",
    url = "https://github.com/Pocco81/HighStr.nvim"
  },
  ["accelerated-jk.nvim"] = {
    config = { "\27LJ\2\nÂ\1\0\0\5\0\t\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\0\0'\2\3\0B\0\2\0029\0\4\0\18\1\0\0'\3\5\0'\4\6\0B\1\3\1\18\1\0\0'\3\a\0'\4\b\0B\1\3\1K\0\1\0004<cmd>lua require\"accelerated-jk\".command(\"gk\")\r\6k4<cmd>lua require\"accelerated-jk\".command(\"gj\")\r\6j\bxno\17utils.keymap\nsetup\19accelerated-jk\frequire\0" },
    keys = { { "n", "j" }, { "n", "k" }, { "x", "j" }, { "x", "j" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/accelerated-jk.nvim",
    url = "https://github.com/xiyaowong/accelerated-jk.nvim"
  },
  ["animation.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/animation.nvim",
    url = "https://github.com/anuvyklack/animation.nvim"
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
  ["calendar.vim"] = {
    commands = { "Calendar" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/calendar.vim",
    url = "https://github.com/itchyny/calendar.vim"
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
  ["clever-f.vim"] = {
    config = { "\27LJ\2\n¨\1\0\0\4\0\t\0\0166\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\4\0'\2\5\0B\0\2\0029\0\6\0'\2\a\0'\3\b\0B\0\3\1K\0\1\0\27<Plug>(clever-f-reset)\n<esc>\bnno\17utils.keymap\frequire\25clever_f_mark_direct\24clever_f_smart_case\6g\bvim\0" },
    keys = { { "n", "f" }, { "n", "t" }, { "n", "F" }, { "n", "T" }, { "x", "f" }, { "x", "t" }, { "x", "F" }, { "x", "T" } },
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
  ["comment-box.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/comment-box.nvim",
    url = "https://github.com/ludopinelli/comment-box.nvim"
  },
  ["competitest.nvim"] = {
    commands = { "CompetiTest" },
    config = { 'require"competitest".setup{}' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/competitest.nvim",
    url = "https://github.com/xeluxee/competitest.nvim"
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
  ["emmet-vim"] = {
    keys = { { "i", "<C-y>" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/emmet-vim",
    url = "https://github.com/mattn/emmet-vim"
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
    config = { "\27LJ\2\nú\1\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0}      if g:loaded_fzf==1\n      unlet g:loaded_fzf\n      source /usr/share/vim/vimfiles/plugin/fzf.vim\n      endif\n      \bcmd\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/fzf-folds.vim",
    url = "https://github.com/roosta/fzf-folds.vim"
  },
  ["github-nvim-theme"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/github-nvim-theme",
    url = "https://github.com/projekt0n/github-nvim-theme"
  },
  ["grapple.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/grapple.nvim",
    url = "https://github.com/cbochs/grapple.nvim"
  },
  ["guess-indent.nvim"] = {
    config = { 'require"guess-indent".setup{}' },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/guess-indent.nvim",
    url = "https://github.com/nmac427/guess-indent.nvim"
  },
  ["haskell-tools.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/haskell-tools.nvim",
    url = "https://github.com/mrcjkb/haskell-tools.nvim"
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
  ["ido.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/ido.nvim",
    url = "https://github.com/ido-nvim/ido.nvim"
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
  ["killersheep.nvim"] = {
    commands = { "KillKillKill" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/killersheep.nvim",
    url = "https://github.com/seandewar/killersheep.nvim"
  },
  ["leap.nvim"] = {
    config = { "\27LJ\2\nñ\1\0\0\5\0\t\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0006\1\4\0009\1\5\1'\3\6\0'\4\a\0B\1\3\2=\1\3\0006\0\0\0'\2\1\0B\0\2\0029\0\2\0004\1\0\0=\1\b\0K\0\1\0\vlabels\5\31abcdefghijklmnopqrstuvwxyz\nsplit\bvim\16safe_labels\topts\tleap\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/leap.nvim",
    url = "https://github.com/ggandor/leap.nvim"
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
  ["matchparen.nvim"] = {
    config = { 'require"matchparen".setup{}' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/matchparen.nvim",
    url = "https://github.com/monkoose/matchparen.nvim"
  },
  middleclass = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/middleclass",
    url = "https://github.com/anuvyklack/middleclass"
  },
  ["mini.nvim"] = {
    config = { 'require("config.mini")' },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/mini.nvim",
    url = "https://github.com/echasnovski/mini.nvim"
  },
  ["mkdnflow.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/mkdnflow.nvim",
    url = "https://github.com/jakewvincent/mkdnflow.nvim"
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
  ["neo-tree.nvim"] = {
    commands = { "Neotree" },
    config = { 'require("config.neotree")' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/neo-tree.nvim",
    url = "https://github.com/nvim-neo-tree/neo-tree.nvim"
  },
  ["neodev.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/neodev.nvim",
    url = "https://github.com/folke/neodev.nvim"
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
    commands = { "Neogen" },
    config = { 'require"neogen".setup{\n  snippet_engine = "snippy"\n}' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/neogen",
    url = "https://github.com/danymat/neogen"
  },
  neogit = {
    commands = { "Neogit" },
    config = { 'require"neogit".setup{}' },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/neogit",
    url = "https://github.com/timuntersberger/neogit"
  },
  neorg = {
    config = { 'require"neorg".setup{\n  load = {\n    ["core.concealer"] = {},\n    ["core.defaults"] = {},\n    ["core.export"] = {},\n    ["core.export.markdown"] = {}\n  }\n}' },
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
  neoterm = {
    commands = { "T", "Tnew", "Topen", "Texec" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/neoterm",
    url = "https://github.com/kassio/neoterm"
  },
  ["nightfox.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/nightfox.nvim",
    url = "https://github.com/edeneast/nightfox.nvim"
  },
  ["notmuch-vim"] = {
    commands = { "NotMuch" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/notmuch-vim",
    url = "https://github.com/felipec/notmuch-vim"
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
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    after = { "nvim-snippy", "cmp-nvim-tags", "cmp-rg", "cmp-snippy", "cmp-treesitter", "cmp-calc", "cmp-cmdline", "cmp-cmdline-history", "cmp-spell", "cmp-buffer", "cmp-async-path", "codeium.nvim", "cmp-tabnine", "cmp-nvim-lsp", "cmp-nvim-lsp-signature-help" },
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
    config = { "\27LJ\2\ng\0\0\4\0\5\0\b6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0'\3\4\0B\0\3\1K\0\1\0(:lua require\"expand_expr\".expand()\r\agE\bnno\17utils.keymap\frequire\0" },
    keys = { { "n", "gE" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/nvim-expand-expr",
    url = "https://github.com/allendang/nvim-expand-expr"
  },
  ["nvim-genghis"] = {
    commands = { "NewFromSelection", "Duplicate", "Rename", "Trash", "Move", "CopyFilename", "CopyFilepath", "Chmodx", "New" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/nvim-genghis",
    url = "https://github.com/chrisgrieser/nvim-genghis"
  },
  ["nvim-lazy-inner-block"] = {
    config = { 'require"nvim-lazy-inner-block".setup{}' },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/nvim-lazy-inner-block",
    url = "https://github.com/s1n7ax/nvim-lazy-inner-block"
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
  ["nvim-nu"] = {
    config = { 'require"nu".setup{\n  use_lsp_features = false\n}' },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/nvim-nu",
    url = "https://github.com/lhkipp/nvim-nu"
  },
  ["nvim-peekup"] = {
    keys = { { "n", "<char-34><char-34>" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/nvim-peekup",
    url = "https://github.com/gennaro-tedesco/nvim-peekup"
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
    keys = { { "n", "ys" }, { "n", "yS" }, { "x", "S" }, { "x", "gS" }, { "n", "cs" }, { "n", "ds" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/nvim-surround",
    url = "https://github.com/kylechui/nvim-surround"
  },
  ["nvim-terminal.lua"] = {
    config = { 'require"terminal".setup{}' },
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
  ["nvim-window-picker"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/nvim-window-picker",
    url = "https://github.com/s1n7ax/nvim-window-picker"
  },
  nvimesweeper = {
    commands = { "Nvimesweeper" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/nvimesweeper",
    url = "https://github.com/seandewar/nvimesweeper"
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
  ["open-browser.vim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/open-browser.vim",
    url = "https://github.com/tyru/open-browser.vim"
  },
  orgmode = {
    config = { "\27LJ\2\n^\0\0\3\0\4\0\f6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\1\0B\0\2\0029\0\3\0004\2\0\0B\0\2\1K\0\1\0\nsetup\21setup_ts_grammar\forgmode\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/orgmode",
    url = "https://github.com/nvim-orgmode/orgmode"
  },
  ["overlength.nvim"] = {
    commands = { "OverlengthToggle" },
    config = { 'require"overlength".setup{\n  enabled = false,\n  textwidth_mode = 1\n}' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/overlength.nvim",
    url = "https://github.com/lcheylus/overlength.nvim"
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
  ["peepsight.nvim"] = {
    commands = { "Peepsight", "PeepsightEnable", "PeepsightDisable" },
    config = { 'require"peepsight".setup{ "function_definition" }' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/peepsight.nvim",
    url = "https://github.com/koenverburg/peepsight.nvim"
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
    config = { 'vim.cmd"TSEnable rainbow"' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/rainbow-delimiters.nvim",
    url = "https://gitlab.com/HiPhish/rainbow-delimiters.nvim"
  },
  ["range-highlight.nvim"] = {
    config = { 'require"range-highlight".setup{}' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/range-highlight.nvim",
    url = "https://github.com/winston0410/range-highlight.nvim"
  },
  ["refactoring.nvim"] = {
    commands = { "Refactor" },
    config = { "\27LJ\2\nÂ\3\0\0\5\0\r\0\0266\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\4\0\18\1\0\0'\3\5\0'\4\6\0B\1\3\1\18\1\0\0'\3\a\0'\4\b\0B\1\3\1\18\1\0\0'\3\t\0'\4\n\0B\1\3\1\18\1\0\0'\3\v\0'\4\f\0B\1\3\1K\0\1\0I<Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>\15<leader>riJ<Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>\15<leader>rvR<Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>\15<leader>rfJ<Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>\15<leader>re\bxno\17utils.keymap\nsetup\16refactoring\frequire\0" },
    keys = { { "x", "\\re" }, { "x", "\\rf" }, { "x", "\\rv" }, { "x", "\\ri" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/refactoring.nvim",
    url = "https://github.com/ThePrimeagen/refactoring.nvim"
  },
  ["rest.nvim"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/rest.nvim",
    url = "https://github.com/rest-nvim/rest.nvim"
  },
  ["scratch.vim"] = {
    commands = { "Scratch", "ScratchInsert", "ScratchPreview", "ScratchSelection" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/scratch.vim",
    url = "https://github.com/mtth/scratch.vim"
  },
  shadowvim = {
    loaded = false,
    needs_bufread = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/shadowvim",
    url = "https://github.com/mickael-menu/shadowvim"
  },
  ["shenzhen-solitaire.nvim"] = {
    commands = { "ShenzhenSolitaireNewGame" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/shenzhen-solitaire.nvim",
    url = "https://github.com/rktjmp/shenzhen-solitaire.nvim"
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
  ["sideways.vim"] = {
    config = { "\27LJ\2\ny\0\0\5\0\a\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0\18\1\0\0'\3\3\0'\4\4\0B\1\3\1\18\1\0\0'\3\5\0'\4\6\0B\1\3\1K\0\1\0\19:SidewaysLeft\r\a<A\20:SidewaysRight\r\a>A\bnno\17utils.keymap\frequire\0" },
    keys = { { "n", ">A" }, { "n", "<A" } },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/sideways.vim",
    url = "https://github.com/AndrewRadev/sideways.vim"
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
  ["stickybuf.nvim"] = {
    commands = { "PinBuffer", "PinBuftype", "PinFiletype", "Unpin" },
    config = { 'require"stickybuf".setup{}' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/stickybuf.nvim",
    url = "https://github.com/stevearc/stickybuf.nvim"
  },
  ["styler.nvim"] = {
    commands = { "Styler" },
    config = { 'require"styler".setup{\n  themes = {}\n}' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/styler.nvim",
    url = "https://github.com/folke/styler.nvim"
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
  ["tagalong.vim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/tagalong.vim",
    url = "https://github.com/andrewradev/tagalong.vim"
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
  ["telescope-alternate.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/telescope-alternate.nvim",
    url = "https://github.com/otavioschwanck/telescope-alternate.nvim"
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
  ["telescope-undo.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/telescope-undo.nvim",
    url = "https://github.com/debugloop/telescope-undo.nvim"
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
  ["text-case.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/text-case.nvim",
    url = "https://github.com/johmsalas/text-case.nvim"
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
  ["vim-characterize"] = {
    config = { "\27LJ\2\nX\0\0\4\0\5\0\b6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0'\3\4\0B\0\3\1K\0\1\0\25<Plug>(characterize)\aga\bnno\17utils.keymap\frequire\0" },
    keys = { { "n", "ga" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-characterize",
    url = "https://github.com/tpope/vim-characterize"
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
  ["vim-edgemotion"] = {
    config = { "\27LJ\2\nÆ\1\0\0\5\0\b\0\0206\0\0\0'\2\1\0B\0\2\0029\1\2\0'\3\3\0'\4\4\0B\1\3\0019\1\2\0'\3\5\0'\4\6\0B\1\3\0019\1\a\0'\3\3\0'\4\4\0B\1\3\0019\1\a\0'\3\5\0'\4\6\0B\1\3\1K\0\1\0\bxno\25<Plug>(edgemotion-k)\f<S-A-p>\25<Plug>(edgemotion-j)\f<S-A-n>\bnno\17utils.keymap\frequire\0" },
    keys = { { "x", "<S-A-p>" }, { "x", "<S-A-n>" }, { "n", "<S-A-p>" }, { "n", "<S-A-n>" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-edgemotion",
    url = "https://github.com/haya14busa/vim-edgemotion"
  },
  ["vim-exchange"] = {
    keys = { { "n", "cx" }, { "x", "X" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-exchange",
    url = "https://github.com/tommcdo/vim-exchange"
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
    commands = { "Flog", "Floggit", "Flogsplit" },
    load_after = {},
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-flog",
    url = "https://github.com/rbong/vim-flog"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-game_engine"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/vim-game_engine",
    url = "https://github.com/rbtnn/vim-game_engine"
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
  ["vim-hexokinase"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-hexokinase",
    url = "https://github.com/rrethy/vim-hexokinase"
  },
  ["vim-highlighter"] = {
    keys = { { "x", "M<CR>" }, { "x", "M<BS>" }, { "x", "M<C-l>" }, { "x", "M<Tab>" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-highlighter",
    url = "https://github.com/azabiong/vim-highlighter"
  },
  ["vim-indentwise"] = {
    keys = { { "n", "[-" }, { "n", "[+" }, { "n", "[=" }, { "n", "[_" }, { "n", "[%" }, { "n", "]-" }, { "n", "]+" }, { "n", "]=" }, { "n", "]_" }, { "n", "]%" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-indentwise",
    url = "https://github.com/jeetsukumaran/vim-indentwise"
  },
  ["vim-latex"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-latex",
    url = "https://github.com/vim-latex/vim-latex"
  },
  ["vim-libmodal"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/vim-libmodal",
    url = "https://github.com/Iron-E/vim-libmodal"
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
  ["vim-nightfly-colors"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/vim-nightfly-colors",
    url = "https://github.com/bluz71/vim-nightfly-colors"
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
  ["vim-redacted"] = {
    commands = { "Redact" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-redacted",
    url = "https://github.com/dbmrq/vim-redacted"
  },
  ["vim-slumlord"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-slumlord",
    url = "https://github.com/scrooloose/vim-slumlord"
  },
  ["vim-snippets"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/vim-snippets",
    url = "https://github.com/honza/vim-snippets"
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
    config = { "\27LJ\2\n]\0\0\4\0\5\0\b6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0'\3\4\0B\0\3\1K\0\1\0\30<Plug>(tranquille_search)\ag/\bnno\17utils.keymap\frequire\0" },
    keys = { { "", "g/" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-tranquille",
    url = "https://github.com/rrethy/vim-tranquille"
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
  ["visual-split.vim"] = {
    commands = { "VSSplit", "VSSplitAbove", "VSSplitBelow", "VSResize" },
    keys = { { "n", "<C-W>gr" }, { "n", "<C-W>gss" }, { "n", "<C-W>gsa" }, { "n", "<C-W>gsb" }, { "x", "<C-W>gr" }, { "x", "<C-W>gss" }, { "x", "<C-W>gsa" }, { "x", "<C-W>gsb" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/visual-split.vim",
    url = "https://github.com/wellle/visual-split.vim"
  },
  ["visual.nvim"] = {
    config = { 'require"visual".setup{}' },
    loaded = false,
    needs_bufread = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/visual.nvim",
    url = "https://github.com/00sapo/visual.nvim"
  },
  ["web-tools.nvim"] = {
    commands = { "BrowserOpen" },
    config = { 'require"web-tools".setup{}' },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/web-tools.nvim",
    url = "https://github.com/ray-x/web-tools.nvim"
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
  ["windows.nvim"] = {
    commands = { "WindowsToggleAutowidth" },
    config = { 'require"windows".setup{}' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/windows.nvim",
    url = "https://github.com/anuvyklack/windows.nvim"
  },
  ["winshift.nvim"] = {
    config = { "\27LJ\2\n–\1\0\0\v\0\v\0\0266\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\3\0005\2\4\0B\0\2\4H\3\rÄ6\5\0\0'\a\5\0B\5\2\0029\5\6\5'\a\a\0\18\b\3\0'\t\b\0&\a\t\a'\b\t\0\18\t\4\0'\n\n\0&\b\n\bB\5\3\1F\3\3\3R\3Ò\127K\0\1\0\6\r\15:WinShift \6>\n<C-S-\bnno\17utils.keymap\1\0\4\6j\tdown\6l\nright\6h\tleft\6k\aup\npairs\nsetup\rwinshift\frequire\0" },
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
    commands = { "Z" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/zoxide.vim",
    url = "https://github.com/nanotee/zoxide.vim"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^cmp_tabnine"] = "cmp-tabnine",
  ["^comment%-box"] = "comment-box.nvim",
  ["^fwatch"] = "fwatch.nvim",
  ["^genghis"] = "nvim-genghis",
  ["^grapple"] = "grapple.nvim",
  ["^hologram"] = "hologram.nvim",
  ["^hop"] = "hop.nvim",
  ["^ido"] = "ido.nvim",
  ["^leap"] = "leap.nvim",
  ["^luapad"] = "nvim-luapad",
  ["^mason"] = "mason.nvim",
  ["^neodev"] = "neodev.nvim",
  ["^neogen"] = "neogen",
  ["^notify"] = "nvim-notify",
  ["^nvim%-comment%-frame"] = "nvim-comment-frame",
  ["^nvim%-lightbulb"] = "nvim-lightbulb",
  ["^plenary"] = "plenary.nvim",
  ["^presence"] = "presence.nvim",
  ["^refactoring"] = "refactoring.nvim",
  ["^spectre"] = "nvim-spectre",
  ["^ssr"] = "ssr.nvim",
  ["^syntax%-tree%-surfer"] = "syntax-tree-surfer",
  ["^telescope"] = "telescope.nvim",
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

-- Setup for: vim-hexokinase
time([[Setup for vim-hexokinase]], true)
try_loadstring("\27LJ\2\nL\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\2\0\0\19backgroundfull\28Hexokinase_highlighters\6g\bvim\0", "setup", "vim-hexokinase")
time([[Setup for vim-hexokinase]], false)
-- Setup for: dashboard-nvim
time([[Setup for dashboard-nvim]], true)
try_loadstring("\27LJ\2\n‡\1\0\0\3\0\n\2\0316\0\0\0009\0\1\0009\0\2\0B\0\1\2\t\0\0\0X\0\24Ä6\0\0\0009\0\3\0009\0\4\0)\2\0\0B\0\2\2\t\0\1\0X\0\17Ä6\0\0\0009\0\3\0009\0\5\0B\0\1\2\a\0\6\0X\0\vÄ6\0\0\0009\0\3\0009\0\a\0)\2\0\0B\0\2\2\a\0\6\0X\0\4Ä6\0\0\0009\0\b\0'\2\t\0B\0\2\1K\0\1\0\14Dashboard\bcmd\22nvim_buf_get_name\5\26nvim_get_current_line\24nvim_buf_line_count\bapi\targc\afn\bvim\0\2a\1\0\5\0\a\0\t6\0\0\0009\0\1\0009\0\2\0005\2\3\0005\3\5\0003\4\4\0=\4\6\3B\0\3\1K\0\1\0\rcallback\1\0\0\0\1\2\0\0\rVimenter\24nvim_create_autocmd\bapi\bvim\0", "setup", "dashboard-nvim")
time([[Setup for dashboard-nvim]], false)
-- Setup for: dirbuf.nvim
time([[Setup for dirbuf.nvim]], true)
try_loadstring("\27LJ\2\nî\1\0\0\4\0\5\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0005\3\4\0B\0\3\1K\0\1\0\1\0\1\fcommandEif isdirectory(expand('%')) && !&modified|execute 'Dirbuf'|endif\rBufEnter\24nvim_create_autocmd\bapi\bvim\0", "setup", "dirbuf.nvim")
time([[Setup for dirbuf.nvim]], false)
-- Setup for: nvim-notify
time([[Setup for nvim-notify]], true)
vim.notify=function (...) require"notify"(...) end
time([[Setup for nvim-notify]], false)
-- Setup for: pyro
time([[Setup for pyro]], true)
try_loadstring("\27LJ\2\nC\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\22/home/user/.macro\20pyro_macro_path\6g\bvim\0", "setup", "pyro")
time([[Setup for pyro]], false)
-- Setup for: vim-highlighter
time([[Setup for vim-highlighter]], true)
try_loadstring("\27LJ\2\nà\1\0\0\2\0\n\0\0176\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\1\0'\1\a\0=\1\6\0006\0\0\0009\0\1\0'\1\t\0=\1\b\0K\0\1\0\vM<tab>\vHiFind\vM<C-L>\fHiClear\nM<BS>\fHiErase\nM<CR>\nHiSet\6g\bvim\0", "setup", "vim-highlighter")
time([[Setup for vim-highlighter]], false)
-- Setup for: telescope-ui-select.nvim
time([[Setup for telescope-ui-select.nvim]], true)
try_loadstring("\27LJ\2\np\2\0\4\0\a\0\f6\0\0\0'\2\1\0B\0\2\0029\1\2\0'\3\3\0B\1\2\0016\1\4\0009\1\5\0019\1\6\1G\3\0\0A\1\0\1K\0\1\0\vselect\aui\bvim\14ui-select\19load_extension\14telescope\frequire*\1\0\2\0\4\0\0056\0\0\0009\0\1\0003\1\3\0=\1\2\0K\0\1\0\0\vselect\aui\bvim\0", "setup", "telescope-ui-select.nvim")
time([[Setup for telescope-ui-select.nvim]], false)
time([[packadd for telescope-ui-select.nvim]], true)
vim.cmd [[packadd telescope-ui-select.nvim]]
time([[packadd for telescope-ui-select.nvim]], false)
-- Setup for: codeium.vim
time([[Setup for codeium.vim]], true)
try_loadstring("\27LJ\2\nY\0\0\2\0\4\0\t6\0\0\0009\0\1\0+\1\1\0=\1\2\0006\0\0\0009\0\1\0+\1\2\0=\1\3\0K\0\1\0\19codeium_manual\29codeium_disable_bindings\6g\bvim\0", "setup", "codeium.vim")
time([[Setup for codeium.vim]], false)
-- Setup for: scratch.vim
time([[Setup for scratch.vim]], true)
try_loadstring("\27LJ\2\n5\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0\24scratch_no_mappings\6g\bvim\0", "setup", "scratch.vim")
time([[Setup for scratch.vim]], false)
-- Setup for: vim-visual-multi
time([[Setup for vim-visual-multi]], true)
vim.cmd"let g:VM_maps={}"
time([[Setup for vim-visual-multi]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
require("config.treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-lazy-inner-block
time([[Config for nvim-lazy-inner-block]], true)
require"nvim-lazy-inner-block".setup{}
time([[Config for nvim-lazy-inner-block]], false)
-- Config for: mini.nvim
time([[Config for mini.nvim]], true)
require("config.mini")
time([[Config for mini.nvim]], false)
-- Config for: guess-indent.nvim
time([[Config for guess-indent.nvim]], true)
require"guess-indent".setup{}
time([[Config for guess-indent.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
require"lualine".setup{}
time([[Config for lualine.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd vim-fugitive ]]
time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.api.nvim_create_user_command, 'DiffviewFileHistory', function(cmdargs)
          require('packer.load')({'diffview.nvim'}, { cmd = 'DiffviewFileHistory', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'diffview.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('DiffviewFileHistory ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'ConvertColorTo', function(cmdargs)
          require('packer.load')({'vim-convert-color-to'}, { cmd = 'ConvertColorTo', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-convert-color-to'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('ConvertColorTo ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'VSSplit', function(cmdargs)
          require('packer.load')({'visual-split.vim'}, { cmd = 'VSSplit', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'visual-split.vim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('VSSplit ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'FastFoldUpdate', function(cmdargs)
          require('packer.load')({'FastFold'}, { cmd = 'FastFoldUpdate', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'FastFold'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('FastFoldUpdate ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'DiffviewToggleFiles', function(cmdargs)
          require('packer.load')({'diffview.nvim'}, { cmd = 'DiffviewToggleFiles', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'diffview.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('DiffviewToggleFiles ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'CECompile', function(cmdargs)
          require('packer.load')({'compiler-explorer.nvim'}, { cmd = 'CECompile', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'compiler-explorer.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('CECompile ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'DiffviewRefresh', function(cmdargs)
          require('packer.load')({'diffview.nvim'}, { cmd = 'DiffviewRefresh', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'diffview.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('DiffviewRefresh ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Neogen', function(cmdargs)
          require('packer.load')({'neogen'}, { cmd = 'Neogen', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'neogen'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Neogen ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Thesaurus', function(cmdargs)
          require('packer.load')({'thesaurus_query.vim'}, { cmd = 'Thesaurus', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'thesaurus_query.vim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Thesaurus ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'AccordionZoomIn', function(cmdargs)
          require('packer.load')({'vim-accordion'}, { cmd = 'AccordionZoomIn', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-accordion'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('AccordionZoomIn ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Move', function(cmdargs)
          require('packer.load')({'nvim-genghis'}, { cmd = 'Move', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'nvim-genghis'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Move ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Refactor', function(cmdargs)
          require('packer.load')({'refactoring.nvim'}, { cmd = 'Refactor', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'refactoring.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Refactor ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'T', function(cmdargs)
          require('packer.load')({'neoterm'}, { cmd = 'T', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'neoterm'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('T ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'TagbarToggle', function(cmdargs)
          require('packer.load')({'tagbar'}, { cmd = 'TagbarToggle', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'tagbar'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('TagbarToggle ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'ConvColor', function(cmdargs)
          require('packer.load')({'nvim-conv'}, { cmd = 'ConvColor', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'nvim-conv'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('ConvColor ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Mario', function(cmdargs)
          require('packer.load')({'vim-mario'}, { cmd = 'Mario', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-mario'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Mario ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'DittoSentOn', function(cmdargs)
          require('packer.load')({'vim-ditto'}, { cmd = 'DittoSentOn', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-ditto'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('DittoSentOn ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'VBoxH', function(cmdargs)
          require('packer.load')({'venn.nvim'}, { cmd = 'VBoxH', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'venn.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('VBoxH ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'DittoOff', function(cmdargs)
          require('packer.load')({'vim-ditto'}, { cmd = 'DittoOff', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-ditto'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('DittoOff ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'ConvDataTransRate', function(cmdargs)
          require('packer.load')({'nvim-conv'}, { cmd = 'ConvDataTransRate', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'nvim-conv'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('ConvDataTransRate ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Tetris', function(cmdargs)
          require('packer.load')({'nvim-tetris'}, { cmd = 'Tetris', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'nvim-tetris'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Tetris ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'DittoPar', function(cmdargs)
          require('packer.load')({'vim-ditto'}, { cmd = 'DittoPar', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-ditto'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('DittoPar ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Tabularize', function(cmdargs)
          require('packer.load')({'tabular'}, { cmd = 'Tabularize', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'tabular'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Tabularize ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Ditto', function(cmdargs)
          require('packer.load')({'vim-ditto'}, { cmd = 'Ditto', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-ditto'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Ditto ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'AccordionStop', function(cmdargs)
          require('packer.load')({'vim-accordion'}, { cmd = 'AccordionStop', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-accordion'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('AccordionStop ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Sort', function(cmdargs)
          require('packer.load')({'sort.nvim'}, { cmd = 'Sort', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'sort.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Sort ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Limelight', function(cmdargs)
          require('packer.load')({'limelight.vim'}, { cmd = 'Limelight', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'limelight.vim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Limelight ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Flogsplit', function(cmdargs)
          require('packer.load')({'vim-flog'}, { cmd = 'Flogsplit', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-flog'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Flogsplit ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'PinBuftype', function(cmdargs)
          require('packer.load')({'stickybuf.nvim'}, { cmd = 'PinBuftype', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'stickybuf.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('PinBuftype ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'AccordionClear', function(cmdargs)
          require('packer.load')({'vim-accordion'}, { cmd = 'AccordionClear', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-accordion'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('AccordionClear ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'SnipRun', function(cmdargs)
          require('packer.load')({'sniprun'}, { cmd = 'SnipRun', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'sniprun'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('SnipRun ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'MurenUnique', function(cmdargs)
          require('packer.load')({'muren.nvim'}, { cmd = 'MurenUnique', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'muren.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('MurenUnique ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Peepsight', function(cmdargs)
          require('packer.load')({'peepsight.nvim'}, { cmd = 'Peepsight', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'peepsight.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Peepsight ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'AsyncRun', function(cmdargs)
          require('packer.load')({'asyncrun.vim'}, { cmd = 'AsyncRun', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'asyncrun.vim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('AsyncRun ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Colortils', function(cmdargs)
          require('packer.load')({'colortils.nvim'}, { cmd = 'Colortils', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'colortils.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Colortils ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Dashboard', function(cmdargs)
          require('packer.load')({'dashboard-nvim'}, { cmd = 'Dashboard', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'dashboard-nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Dashboard ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'MurenClose', function(cmdargs)
          require('packer.load')({'muren.nvim'}, { cmd = 'MurenClose', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'muren.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('MurenClose ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'ThesaurusQueryLookupCurrentWord', function(cmdargs)
          require('packer.load')({'thesaurus_query.vim'}, { cmd = 'ThesaurusQueryLookupCurrentWord', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'thesaurus_query.vim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('ThesaurusQueryLookupCurrentWord ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'ToggleDitto', function(cmdargs)
          require('packer.load')({'vim-ditto'}, { cmd = 'ToggleDitto', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-ditto'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('ToggleDitto ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'BWipeout', function(cmdargs)
          require('packer.load')({'close-buffers.nvim'}, { cmd = 'BWipeout', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'close-buffers.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('BWipeout ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'SwitchExtend', function(cmdargs)
          require('packer.load')({'switch.vim'}, { cmd = 'SwitchExtend', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'switch.vim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('SwitchExtend ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'MurenToggle', function(cmdargs)
          require('packer.load')({'muren.nvim'}, { cmd = 'MurenToggle', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'muren.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('MurenToggle ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'TableModeToggle', function(cmdargs)
          require('packer.load')({'vim-table-mode'}, { cmd = 'TableModeToggle', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-table-mode'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('TableModeToggle ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'CompetiTest', function(cmdargs)
          require('packer.load')({'competitest.nvim'}, { cmd = 'CompetiTest', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'competitest.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('CompetiTest ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'ConvOct', function(cmdargs)
          require('packer.load')({'nvim-conv'}, { cmd = 'ConvOct', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'nvim-conv'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('ConvOct ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'ConvCelsius', function(cmdargs)
          require('packer.load')({'nvim-conv'}, { cmd = 'ConvCelsius', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'nvim-conv'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('ConvCelsius ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'TabmodeEnter', function(cmdargs)
          require('packer.load')({'vim-tabmode'}, { cmd = 'TabmodeEnter', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-tabmode'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('TabmodeEnter ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Styler', function(cmdargs)
          require('packer.load')({'styler.nvim'}, { cmd = 'Styler', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'styler.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Styler ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'PeepsightDisable', function(cmdargs)
          require('packer.load')({'peepsight.nvim'}, { cmd = 'PeepsightDisable', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'peepsight.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('PeepsightDisable ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'VBoxD', function(cmdargs)
          require('packer.load')({'venn.nvim'}, { cmd = 'VBoxD', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'venn.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('VBoxD ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'ConvDec', function(cmdargs)
          require('packer.load')({'nvim-conv'}, { cmd = 'ConvDec', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'nvim-conv'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('ConvDec ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'DittoFileOn', function(cmdargs)
          require('packer.load')({'vim-ditto'}, { cmd = 'DittoFileOn', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-ditto'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('DittoFileOn ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Pantran', function(cmdargs)
          require('packer.load')({'pantran.nvim'}, { cmd = 'Pantran', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'pantran.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Pantran ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'VSResize', function(cmdargs)
          require('packer.load')({'visual-split.vim'}, { cmd = 'VSResize', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'visual-split.vim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('VSResize ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'DittoOn', function(cmdargs)
          require('packer.load')({'vim-ditto'}, { cmd = 'DittoOn', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-ditto'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('DittoOn ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'DittoParOn', function(cmdargs)
          require('packer.load')({'vim-ditto'}, { cmd = 'DittoParOn', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-ditto'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('DittoParOn ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'CopyFilename', function(cmdargs)
          require('packer.load')({'nvim-genghis'}, { cmd = 'CopyFilename', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'nvim-genghis'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('CopyFilename ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'G', function(cmdargs)
          require('packer.load')({'live-command.nvim'}, { cmd = 'G', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'live-command.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('G ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'VBox', function(cmdargs)
          require('packer.load')({'venn.nvim'}, { cmd = 'VBox', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'venn.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('VBox ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'ConvSetPrecision', function(cmdargs)
          require('packer.load')({'nvim-conv'}, { cmd = 'ConvSetPrecision', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'nvim-conv'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('ConvSetPrecision ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Trash', function(cmdargs)
          require('packer.load')({'nvim-genghis'}, { cmd = 'Trash', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'nvim-genghis'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Trash ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Norm', function(cmdargs)
          require('packer.load')({'live-command.nvim'}, { cmd = 'Norm', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'live-command.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Norm ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Topen', function(cmdargs)
          require('packer.load')({'neoterm'}, { cmd = 'Topen', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'neoterm'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Topen ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'CopyFilepath', function(cmdargs)
          require('packer.load')({'nvim-genghis'}, { cmd = 'CopyFilepath', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'nvim-genghis'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('CopyFilepath ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Tnew', function(cmdargs)
          require('packer.load')({'neoterm'}, { cmd = 'Tnew', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'neoterm'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Tnew ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'ConvStr', function(cmdargs)
          require('packer.load')({'nvim-conv'}, { cmd = 'ConvStr', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'nvim-conv'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('ConvStr ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'SnipTerminate', function(cmdargs)
          require('packer.load')({'sniprun'}, { cmd = 'SnipTerminate', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'sniprun'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('SnipTerminate ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Neogit', function(cmdargs)
          require('packer.load')({'neogit'}, { cmd = 'Neogit', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'neogit'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Neogit ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'NoDitto', function(cmdargs)
          require('packer.load')({'vim-ditto'}, { cmd = 'NoDitto', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-ditto'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('NoDitto ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'NoWordy', function(cmdargs)
          require('packer.load')({'vim-wordy'}, { cmd = 'NoWordy', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-wordy'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('NoWordy ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Floggit', function(cmdargs)
          require('packer.load')({'vim-flog'}, { cmd = 'Floggit', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-flog'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Floggit ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'KillKillKill', function(cmdargs)
          require('packer.load')({'killersheep.nvim'}, { cmd = 'KillKillKill', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'killersheep.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('KillKillKill ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'VFill', function(cmdargs)
          require('packer.load')({'venn.nvim'}, { cmd = 'VFill', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'venn.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('VFill ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'LinediffReset', function(cmdargs)
          require('packer.load')({'linediff.vim'}, { cmd = 'LinediffReset', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'linediff.vim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('LinediffReset ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'VBoxDO', function(cmdargs)
          require('packer.load')({'venn.nvim'}, { cmd = 'VBoxDO', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'venn.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('VBoxDO ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Lista', function(cmdargs)
          require('packer.load')({'lista.nvim'}, { cmd = 'Lista', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'lista.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Lista ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'GhostStart', function(cmdargs)
          require('packer.load')({'vim-ghost'}, { cmd = 'GhostStart', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-ghost'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('GhostStart ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'IncRename', function(cmdargs)
          require('packer.load')({'inc-rename.nvim'}, { cmd = 'IncRename', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'inc-rename.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('IncRename ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Rename', function(cmdargs)
          require('packer.load')({'nvim-genghis'}, { cmd = 'Rename', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'nvim-genghis'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Rename ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'ScratchPreview', function(cmdargs)
          require('packer.load')({'scratch.vim'}, { cmd = 'ScratchPreview', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'scratch.vim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('ScratchPreview ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Folds', function(cmdargs)
          require('packer.load')({'fzf-folds.vim'}, { cmd = 'Folds', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'fzf-folds.vim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Folds ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'BDelete', function(cmdargs)
          require('packer.load')({'close-buffers.nvim'}, { cmd = 'BDelete', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'close-buffers.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('BDelete ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Accordion', function(cmdargs)
          require('packer.load')({'vim-accordion'}, { cmd = 'Accordion', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-accordion'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Accordion ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'WindowsToggleAutowidth', function(cmdargs)
          require('packer.load')({'windows.nvim'}, { cmd = 'WindowsToggleAutowidth', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'windows.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('WindowsToggleAutowidth ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'AccordionZoomOut', function(cmdargs)
          require('packer.load')({'vim-accordion'}, { cmd = 'AccordionZoomOut', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-accordion'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('AccordionZoomOut ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'VBoxHO', function(cmdargs)
          require('packer.load')({'venn.nvim'}, { cmd = 'VBoxHO', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'venn.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('VBoxHO ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'MurenFresh', function(cmdargs)
          require('packer.load')({'muren.nvim'}, { cmd = 'MurenFresh', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'muren.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('MurenFresh ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'SnipReset', function(cmdargs)
          require('packer.load')({'sniprun'}, { cmd = 'SnipReset', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'sniprun'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('SnipReset ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'DiffviewLog', function(cmdargs)
          require('packer.load')({'diffview.nvim'}, { cmd = 'DiffviewLog', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'diffview.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('DiffviewLog ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'VBoxO', function(cmdargs)
          require('packer.load')({'venn.nvim'}, { cmd = 'VBoxO', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'venn.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('VBoxO ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Calendar', function(cmdargs)
          require('packer.load')({'calendar.vim'}, { cmd = 'Calendar', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'calendar.vim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Calendar ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Dirbuf', function(cmdargs)
          require('packer.load')({'dirbuf.nvim'}, { cmd = 'Dirbuf', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'dirbuf.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Dirbuf ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'DiffviewFocusFiles', function(cmdargs)
          require('packer.load')({'diffview.nvim'}, { cmd = 'DiffviewFocusFiles', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'diffview.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('DiffviewFocusFiles ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'DirDiff', function(cmdargs)
          require('packer.load')({'vim-dirdiff'}, { cmd = 'DirDiff', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-dirdiff'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('DirDiff ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'ScratchSelection', function(cmdargs)
          require('packer.load')({'scratch.vim'}, { cmd = 'ScratchSelection', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'scratch.vim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('ScratchSelection ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'DB', function(cmdargs)
          require('packer.load')({'vim-dadbod'}, { cmd = 'DB', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-dadbod'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('DB ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'DiffviewClose', function(cmdargs)
          require('packer.load')({'diffview.nvim'}, { cmd = 'DiffviewClose', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'diffview.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('DiffviewClose ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'HSRmHighlight', function(cmdargs)
          require('packer.load')({'HighStr.nvim'}, { cmd = 'HSRmHighlight', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'HighStr.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('HSRmHighlight ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Puyo', function(cmdargs)
          require('packer.load')({'vim-puyo'}, { cmd = 'Puyo', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-puyo'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Puyo ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'ZenMode', function(cmdargs)
          require('packer.load')({'zen-mode.nvim'}, { cmd = 'ZenMode', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'zen-mode.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('ZenMode ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'AsyncStop', function(cmdargs)
          require('packer.load')({'asyncrun.vim'}, { cmd = 'AsyncStop', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'asyncrun.vim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('AsyncStop ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Unpin', function(cmdargs)
          require('packer.load')({'stickybuf.nvim'}, { cmd = 'Unpin', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'stickybuf.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Unpin ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'DittoSent', function(cmdargs)
          require('packer.load')({'vim-ditto'}, { cmd = 'DittoSent', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-ditto'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('DittoSent ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'WhichKey', function(cmdargs)
          require('packer.load')({'which-key.nvim'}, { cmd = 'WhichKey', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'which-key.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('WhichKey ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'LspStart', function(cmdargs)
          require('packer.load')({'nvim-lspconfig'}, { cmd = 'LspStart', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'nvim-lspconfig'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('LspStart ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'OverlengthToggle', function(cmdargs)
          require('packer.load')({'overlength.nvim'}, { cmd = 'OverlengthToggle', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'overlength.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('OverlengthToggle ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Z', function(cmdargs)
          require('packer.load')({'zoxide.vim'}, { cmd = 'Z', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'zoxide.vim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Z ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'New', function(cmdargs)
          require('packer.load')({'nvim-genghis'}, { cmd = 'New', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'nvim-genghis'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('New ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'DittoUpdate', function(cmdargs)
          require('packer.load')({'vim-ditto'}, { cmd = 'DittoUpdate', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-ditto'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('DittoUpdate ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Duplicate', function(cmdargs)
          require('packer.load')({'nvim-genghis'}, { cmd = 'Duplicate', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'nvim-genghis'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Duplicate ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'ShenzhenSolitaireNewGame', function(cmdargs)
          require('packer.load')({'shenzhen-solitaire.nvim'}, { cmd = 'ShenzhenSolitaireNewGame', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'shenzhen-solitaire.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('ShenzhenSolitaireNewGame ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'ConvMetricImperial', function(cmdargs)
          require('packer.load')({'nvim-conv'}, { cmd = 'ConvMetricImperial', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'nvim-conv'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('ConvMetricImperial ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'VSSplitBelow', function(cmdargs)
          require('packer.load')({'visual-split.vim'}, { cmd = 'VSSplitBelow', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'visual-split.vim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('VSSplitBelow ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'ConvHex', function(cmdargs)
          require('packer.load')({'nvim-conv'}, { cmd = 'ConvHex', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'nvim-conv'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('ConvHex ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'CarbonNow', function(cmdargs)
          require('packer.load')({'carbon-now.nvim'}, { cmd = 'CarbonNow', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'carbon-now.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('CarbonNow ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Capture', function(cmdargs)
          require('packer.load')({'capture.vim'}, { cmd = 'Capture', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'capture.vim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Capture ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Switch', function(cmdargs)
          require('packer.load')({'switch.vim'}, { cmd = 'Switch', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'switch.vim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Switch ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'FloatermToggle', function(cmdargs)
          require('packer.load')({'vim-floaterm'}, { cmd = 'FloatermToggle', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-floaterm'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('FloatermToggle ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Twilight', function(cmdargs)
          require('packer.load')({'twilight.nvim'}, { cmd = 'Twilight', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'twilight.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Twilight ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'ConvFarenheit', function(cmdargs)
          require('packer.load')({'nvim-conv'}, { cmd = 'ConvFarenheit', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'nvim-conv'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('ConvFarenheit ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Neoformat', function(cmdargs)
          require('packer.load')({'neoformat'}, { cmd = 'Neoformat', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'neoformat'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Neoformat ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'VSSplitAbove', function(cmdargs)
          require('packer.load')({'visual-split.vim'}, { cmd = 'VSSplitAbove', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'visual-split.vim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('VSSplitAbove ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'PinFiletype', function(cmdargs)
          require('packer.load')({'stickybuf.nvim'}, { cmd = 'PinFiletype', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'stickybuf.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('PinFiletype ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'SnipClose', function(cmdargs)
          require('packer.load')({'sniprun'}, { cmd = 'SnipClose', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'sniprun'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('SnipClose ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'PinBuffer', function(cmdargs)
          require('packer.load')({'stickybuf.nvim'}, { cmd = 'PinBuffer', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'stickybuf.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('PinBuffer ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'V', function(cmdargs)
          require('packer.load')({'live-command.nvim'}, { cmd = 'V', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'live-command.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('V ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'MundoToggle', function(cmdargs)
          require('packer.load')({'vim-mundo'}, { cmd = 'MundoToggle', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-mundo'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('MundoToggle ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'DittoFile', function(cmdargs)
          require('packer.load')({'vim-ditto'}, { cmd = 'DittoFile', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-ditto'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('DittoFile ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Luapad', function(cmdargs)
          require('packer.load')({'nvim-luapad'}, { cmd = 'Luapad', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'nvim-luapad'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Luapad ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Telekasten', function(cmdargs)
          require('packer.load')({'telekasten.nvim'}, { cmd = 'Telekasten', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'telekasten.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Telekasten ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Scratch', function(cmdargs)
          require('packer.load')({'scratch.vim'}, { cmd = 'Scratch', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'scratch.vim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Scratch ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'TSPlaygroundToggle', function(cmdargs)
          require('packer.load')({'playground'}, { cmd = 'TSPlaygroundToggle', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'playground'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('TSPlaygroundToggle ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Subvert', function(cmdargs)
          require('packer.load')({'vim-abolish'}, { cmd = 'Subvert', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-abolish'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Subvert ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Linediff', function(cmdargs)
          require('packer.load')({'linediff.vim'}, { cmd = 'Linediff', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'linediff.vim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Linediff ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'ScratchInsert', function(cmdargs)
          require('packer.load')({'scratch.vim'}, { cmd = 'ScratchInsert', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'scratch.vim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('ScratchInsert ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Abolish', function(cmdargs)
          require('packer.load')({'vim-abolish'}, { cmd = 'Abolish', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-abolish'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Abolish ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'ThesaurusQueryReplace', function(cmdargs)
          require('packer.load')({'thesaurus_query.vim'}, { cmd = 'ThesaurusQueryReplace', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'thesaurus_query.vim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('ThesaurusQueryReplace ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'SnipReplMemoryClean', function(cmdargs)
          require('packer.load')({'sniprun'}, { cmd = 'SnipReplMemoryClean', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'sniprun'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('SnipReplMemoryClean ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Telescope', function(cmdargs)
          require('packer.load')({'telescope.nvim'}, { cmd = 'Telescope', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'telescope.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Telescope ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'NewFromSelection', function(cmdargs)
          require('packer.load')({'nvim-genghis'}, { cmd = 'NewFromSelection', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'nvim-genghis'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('NewFromSelection ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'ThesaurusQueryReplaceCurrentWord', function(cmdargs)
          require('packer.load')({'thesaurus_query.vim'}, { cmd = 'ThesaurusQueryReplaceCurrentWord', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'thesaurus_query.vim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('ThesaurusQueryReplaceCurrentWord ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'CodeWindow', function(cmdargs)
          require('packer.load')({'codewindow.nvim'}, { cmd = 'CodeWindow', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'codewindow.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('CodeWindow ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'MurenOpen', function(cmdargs)
          require('packer.load')({'muren.nvim'}, { cmd = 'MurenOpen', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'muren.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('MurenOpen ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Chmodx', function(cmdargs)
          require('packer.load')({'nvim-genghis'}, { cmd = 'Chmodx', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'nvim-genghis'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Chmodx ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'DashboardNewFile', function(cmdargs)
          require('packer.load')({'dashboard-nvim'}, { cmd = 'DashboardNewFile', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'dashboard-nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('DashboardNewFile ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Pyro', function(cmdargs)
          require('packer.load')({'pyro'}, { cmd = 'Pyro', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'pyro'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Pyro ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Wordy', function(cmdargs)
          require('packer.load')({'vim-wordy'}, { cmd = 'Wordy', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-wordy'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Wordy ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Nvimesweeper', function(cmdargs)
          require('packer.load')({'nvimesweeper'}, { cmd = 'Nvimesweeper', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'nvimesweeper'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Nvimesweeper ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'ConvBytes', function(cmdargs)
          require('packer.load')({'nvim-conv'}, { cmd = 'ConvBytes', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'nvim-conv'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('ConvBytes ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'AccordionOnce', function(cmdargs)
          require('packer.load')({'vim-accordion'}, { cmd = 'AccordionOnce', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-accordion'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('AccordionOnce ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Redact', function(cmdargs)
          require('packer.load')({'vim-redacted'}, { cmd = 'Redact', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-redacted'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Redact ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Texec', function(cmdargs)
          require('packer.load')({'neoterm'}, { cmd = 'Texec', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'neoterm'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Texec ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'AccordionAll', function(cmdargs)
          require('packer.load')({'vim-accordion'}, { cmd = 'AccordionAll', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-accordion'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('AccordionAll ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'ConvBin', function(cmdargs)
          require('packer.load')({'nvim-conv'}, { cmd = 'ConvBin', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'nvim-conv'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('ConvBin ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'PeepsightEnable', function(cmdargs)
          require('packer.load')({'peepsight.nvim'}, { cmd = 'PeepsightEnable', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'peepsight.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('PeepsightEnable ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Flog', function(cmdargs)
          require('packer.load')({'vim-flog'}, { cmd = 'Flog', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-flog'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Flog ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'SwitchReverse', function(cmdargs)
          require('packer.load')({'switch.vim'}, { cmd = 'SwitchReverse', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'switch.vim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('SwitchReverse ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'BrowserOpen', function(cmdargs)
          require('packer.load')({'web-tools.nvim'}, { cmd = 'BrowserOpen', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'web-tools.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('BrowserOpen ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'SnipInfo', function(cmdargs)
          require('packer.load')({'sniprun'}, { cmd = 'SnipInfo', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'sniprun'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('SnipInfo ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Neotree', function(cmdargs)
          require('packer.load')({'neo-tree.nvim'}, { cmd = 'Neotree', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'neo-tree.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Neotree ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'DiffviewOpen', function(cmdargs)
          require('packer.load')({'diffview.nvim'}, { cmd = 'DiffviewOpen', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'diffview.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('DiffviewOpen ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'NotMuch', function(cmdargs)
          require('packer.load')({'notmuch-vim'}, { cmd = 'NotMuch', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'notmuch-vim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('NotMuch ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'HSHighlight', function(cmdargs)
          require('packer.load')({'HighStr.nvim'}, { cmd = 'HSHighlight', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'HighStr.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('HSHighlight ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'AccordionDiff', function(cmdargs)
          require('packer.load')({'vim-accordion'}, { cmd = 'AccordionDiff', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-accordion'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('AccordionDiff ', 'cmdline')
      end})
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[xnoremap <silent> <C-h> <cmd>lua require("packer.load")({'syntax-tree-surfer'}, { keys = "<lt>C-h>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> \<tab> <cmd>lua require("packer.load")({'vim-tabmode'}, { keys = "\\<lt>tab>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> X <cmd>lua require("packer.load")({'vim-exchange'}, { keys = "X", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> P <cmd>lua require("packer.load")({'yanky.nvim'}, { keys = "P", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <C-W>gr <cmd>lua require("packer.load")({'visual-split.vim'}, { keys = "<lt>C-W>gr", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> crx <cmd>lua require("packer.load")({'vim-radical'}, { keys = "crx", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> i<space> <cmd>lua require("packer.load")({'vim-textobj-blanklines'}, { keys = "i<lt>space>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <C-W>gsb <cmd>lua require("packer.load")({'visual-split.vim'}, { keys = "<lt>C-W>gsb", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <char-93><char-93> <cmd>lua require("packer.load")({'jumpy.vim'}, { keys = "<lt>char-93><lt>char-93>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> <S-A-n> <cmd>lua require("packer.load")({'vim-edgemotion'}, { keys = "<lt>S-A-n>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <C-S-l> <cmd>lua require("packer.load")({'winshift.nvim'}, { keys = "<lt>C-S-l>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[onoremap <silent> av <cmd>lua require("packer.load")({'vim-textobj-variable-segment'}, { keys = "av", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> ys <cmd>lua require("packer.load")({'nvim-surround'}, { keys = "ys", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> √æ <cmd>lua require("packer.load")({'vim-translator'}, { keys = "√æ", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> vn <cmd>lua require("packer.load")({'syntax-tree-surfer'}, { keys = "vn", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> \ri <cmd>lua require("packer.load")({'refactoring.nvim'}, { keys = "\\ri", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <C-x> <cmd>lua require("packer.load")({'dial.nvim'}, { keys = "<lt>C-x>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> [_ <cmd>lua require("packer.load")({'vim-indentwise'}, { keys = "[_", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> \rf <cmd>lua require("packer.load")({'refactoring.nvim'}, { keys = "\\rf", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> [[ <cmd>lua require("packer.load")({'jumpy.vim'}, { keys = "[[", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> T <cmd>lua require("packer.load")({'clever-f.vim'}, { keys = "T", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[onoremap <silent> i<space> <cmd>lua require("packer.load")({'vim-textobj-blanklines'}, { keys = "i<lt>space>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <A-P> <cmd>lua require("packer.load")({'yanky.nvim'}, { keys = "<lt>A-P>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> <C-W>gsb <cmd>lua require("packer.load")({'visual-split.vim'}, { keys = "<lt>C-W>gsb", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> cro <cmd>lua require("packer.load")({'vim-radical'}, { keys = "cro", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> >A <cmd>lua require("packer.load")({'sideways.vim'}, { keys = ">A", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> av <cmd>lua require("packer.load")({'vim-textobj-variable-segment'}, { keys = "av", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <A-S-j> <cmd>lua require("packer.load")({'syntax-tree-surfer'}, { keys = "<lt>A-S-j>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> yS <cmd>lua require("packer.load")({'nvim-surround'}, { keys = "yS", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> t <cmd>lua require("packer.load")({'clever-f.vim'}, { keys = "t", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> <C-l> <cmd>lua require("packer.load")({'syntax-tree-surfer'}, { keys = "<lt>C-l>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> ds <cmd>lua require("packer.load")({'nvim-surround'}, { keys = "ds", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> j <cmd>lua require("packer.load")({'accelerated-jk.nvim'}, { keys = "j", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> <C-a> <cmd>lua require("packer.load")({'dial.nvim'}, { keys = "<lt>C-a>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> [% <cmd>lua require("packer.load")({'vim-indentwise'}, { keys = "[%", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <C-w><space> <cmd>lua require("packer.load")({'vim-choosewin'}, { keys = "<lt>C-w><lt>space>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> <C-W>gr <cmd>lua require("packer.load")({'visual-split.vim'}, { keys = "<lt>C-W>gr", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> x <cmd>lua require("packer.load")({'vim-visual-multi'}, { keys = "x", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> gS <cmd>lua require("packer.load")({'nvim-surround'}, { keys = "gS", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> dm <cmd>lua require("packer.load")({'marks.nvim'}, { keys = "dm", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> <C-j> <cmd>lua require("packer.load")({'syntax-tree-surfer'}, { keys = "<lt>C-j>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> ]% <cmd>lua require("packer.load")({'vim-indentwise'}, { keys = "]%", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> j <cmd>lua require("packer.load")({'accelerated-jk.nvim'}, { keys = "j", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> P <cmd>lua require("packer.load")({'yanky.nvim'}, { keys = "P", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[onoremap <silent> iv <cmd>lua require("packer.load")({'vim-textobj-variable-segment'}, { keys = "iv", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <C-S-j> <cmd>lua require("packer.load")({'winshift.nvim'}, { keys = "<lt>C-S-j>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <C-S-h> <cmd>lua require("packer.load")({'winshift.nvim'}, { keys = "<lt>C-S-h>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> f <cmd>lua require("packer.load")({'clever-f.vim'}, { keys = "f", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> <C-S-h> <cmd>lua require("packer.load")({'syntax-tree-surfer'}, { keys = "<lt>C-S-h>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> crd <cmd>lua require("packer.load")({'vim-radical'}, { keys = "crd", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> ]= <cmd>lua require("packer.load")({'vim-indentwise'}, { keys = "]=", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[inoremap <silent> <C-y> <cmd>lua require("packer.load")({'emmet-vim'}, { keys = "<lt>C-y>" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <char-34><char-34> <cmd>lua require("packer.load")({'nvim-peekup'}, { keys = "<lt>char-34><lt>char-34>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> iv <cmd>lua require("packer.load")({'vim-textobj-variable-segment'}, { keys = "iv", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <S-A-p> <cmd>lua require("packer.load")({'vim-edgemotion'}, { keys = "<lt>S-A-p>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> S <cmd>lua require("packer.load")({'nvim-surround'}, { keys = "S", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> F <cmd>lua require("packer.load")({'clever-f.vim'}, { keys = "F", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <A-k> <cmd>lua require("packer.load")({'syntax-tree-surfer'}, { keys = "<lt>A-k>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> <C-W>gss <cmd>lua require("packer.load")({'visual-split.vim'}, { keys = "<lt>C-W>gss", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> gA <cmd>lua require("packer.load")({'vim-radical'}, { keys = "gA", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[onoremap <silent> a<space> <cmd>lua require("packer.load")({'vim-textobj-blanklines'}, { keys = "a<lt>space>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> <C-x> <cmd>lua require("packer.load")({'dial.nvim'}, { keys = "<lt>C-x>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> j <cmd>lua require("packer.load")({'accelerated-jk.nvim'}, { keys = "j", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> ]+ <cmd>lua require("packer.load")({'vim-indentwise'}, { keys = "]+", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> gr <cmd>lua require("packer.load")({'inc-rename.nvim'}, { keys = "gr", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> <S-A-p> <cmd>lua require("packer.load")({'vim-edgemotion'}, { keys = "<lt>S-A-p>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> cr <cmd>lua require("packer.load")({'vim-abolish'}, { keys = "cr", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> [- <cmd>lua require("packer.load")({'vim-indentwise'}, { keys = "[-", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> \a <cmd>lua require("packer.load")({'attempt.nvim'}, { keys = "\\a", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> \\ <cmd>lua require("packer.load")({'vim-visual-multi'}, { keys = "\\\\", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <A-j> <cmd>lua require("packer.load")({'syntax-tree-surfer'}, { keys = "<lt>A-j>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> m <cmd>lua require("packer.load")({'marks.nvim'}, { keys = "m", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> √û <cmd>lua require("packer.load")({'vim-translator'}, { keys = "√û", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> k <cmd>lua require("packer.load")({'accelerated-jk.nvim'}, { keys = "k", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> p <cmd>lua require("packer.load")({'yanky.nvim'}, { keys = "p", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <A-S-k> <cmd>lua require("packer.load")({'syntax-tree-surfer'}, { keys = "<lt>A-S-k>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> ]- <cmd>lua require("packer.load")({'vim-indentwise'}, { keys = "]-", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <A-p> <cmd>lua require("packer.load")({'yanky.nvim'}, { keys = "<lt>A-p>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[inoremap <silent> <A-'> <cmd>lua require("packer.load")({'codeium.vim'}, { keys = "<lt>A-'>" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> g/ <cmd>lua require("packer.load")({'vim-tranquille'}, { keys = "g/", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> t <cmd>lua require("packer.load")({'clever-f.vim'}, { keys = "t", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <space> <cmd>lua require("packer.load")({'which-key.nvim'}, { keys = "<lt>space>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> gA <cmd>lua require("packer.load")({'vim-radical'}, { keys = "gA", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> crb <cmd>lua require("packer.load")({'vim-radical'}, { keys = "crb", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> ]_ <cmd>lua require("packer.load")({'vim-indentwise'}, { keys = "]_", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> <C-S-l> <cmd>lua require("packer.load")({'syntax-tree-surfer'}, { keys = "<lt>C-S-l>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> \re <cmd>lua require("packer.load")({'refactoring.nvim'}, { keys = "\\re", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> cs <cmd>lua require("packer.load")({'nvim-surround'}, { keys = "cs", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <char-92> <cmd>lua require("packer.load")({'which-key.nvim'}, { keys = "<lt>char-92>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> vx <cmd>lua require("packer.load")({'syntax-tree-surfer'}, { keys = "vx", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> p <cmd>lua require("packer.load")({'yanky.nvim'}, { keys = "p", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[inoremap <silent> <A-tab> <cmd>lua require("packer.load")({'tabout.nvim'}, { keys = "<lt>A-tab>" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <C-W>gsa <cmd>lua require("packer.load")({'visual-split.vim'}, { keys = "<lt>C-W>gsa", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> Z <cmd>lua require("packer.load")({'FastFold'}, { keys = "Z", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> M<Tab> <cmd>lua require("packer.load")({'vim-highlighter'}, { keys = "M<lt>Tab>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> gX <cmd>lua require("packer.load")({'syntax-tree-surfer'}, { keys = "gX", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[inoremap <silent> <A-S-tab> <cmd>lua require("packer.load")({'tabout.nvim'}, { keys = "<lt>A-S-tab>" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> <C-S-k> <cmd>lua require("packer.load")({'syntax-tree-surfer'}, { keys = "<lt>C-S-k>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> gs <cmd>lua require("packer.load")({'switch.vim'}, { keys = "gs", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> a<space> <cmd>lua require("packer.load")({'vim-textobj-blanklines'}, { keys = "a<lt>space>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> <A-j> <cmd>lua require("packer.load")({'syntax-tree-surfer'}, { keys = "<lt>A-j>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <S-A-n> <cmd>lua require("packer.load")({'vim-edgemotion'}, { keys = "<lt>S-A-n>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> M<BS> <cmd>lua require("packer.load")({'vim-highlighter'}, { keys = "M<lt>BS>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> <C-k> <cmd>lua require("packer.load")({'syntax-tree-surfer'}, { keys = "<lt>C-k>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> ga <cmd>lua require("packer.load")({'vim-characterize'}, { keys = "ga", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> T <cmd>lua require("packer.load")({'clever-f.vim'}, { keys = "T", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> M<C-l> <cmd>lua require("packer.load")({'vim-highlighter'}, { keys = "M<lt>C-l>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> gF <cmd>lua require("packer.load")({'syntax-tree-surfer'}, { keys = "gF", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> gX <cmd>lua require("packer.load")({'syntax-tree-surfer'}, { keys = "gX", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <C-W>gss <cmd>lua require("packer.load")({'visual-split.vim'}, { keys = "<lt>C-W>gss", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> \rv <cmd>lua require("packer.load")({'refactoring.nvim'}, { keys = "\\rv", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> f <cmd>lua require("packer.load")({'clever-f.vim'}, { keys = "f", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <A <cmd>lua require("packer.load")({'sideways.vim'}, { keys = "<lt>A", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> cx <cmd>lua require("packer.load")({'vim-exchange'}, { keys = "cx", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> \ww <cmd>lua require("packer.load")({'vim-windowswap'}, { keys = "\\ww", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> <A-k> <cmd>lua require("packer.load")({'syntax-tree-surfer'}, { keys = "<lt>A-k>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> g <cmd>lua require("packer.load")({'which-key.nvim'}, { keys = "g", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <C-n> <cmd>lua require("packer.load")({'vim-visual-multi'}, { keys = "<lt>C-n>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> gE <cmd>lua require("packer.load")({'nvim-expand-expr'}, { keys = "gE", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> >a <cmd>lua require("packer.load")({'sibling-swap.nvim'}, { keys = ">a", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <a <cmd>lua require("packer.load")({'sibling-swap.nvim'}, { keys = "<lt>a", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> <C-S-j> <cmd>lua require("packer.load")({'syntax-tree-surfer'}, { keys = "<lt>C-S-j>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <C-a> <cmd>lua require("packer.load")({'dial.nvim'}, { keys = "<lt>C-a>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <C-S-k> <cmd>lua require("packer.load")({'winshift.nvim'}, { keys = "<lt>C-S-k>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> M<CR> <cmd>lua require("packer.load")({'vim-highlighter'}, { keys = "M<lt>CR>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> <C-W>gsa <cmd>lua require("packer.load")({'visual-split.vim'}, { keys = "<lt>C-W>gsa", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <C-n> <cmd>lua require("packer.load")({'vim-visual-multi'}, { keys = "<lt>C-n>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> [+ <cmd>lua require("packer.load")({'vim-indentwise'}, { keys = "[+", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> [= <cmd>lua require("packer.load")({'vim-indentwise'}, { keys = "[=", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> F <cmd>lua require("packer.load")({'clever-f.vim'}, { keys = "F", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType nu ++once lua require("packer.load")({'nvim-nu'}, { ft = "nu" }, _G.packer_plugins)]]
vim.cmd [[au FileType text ++once lua require("packer.load")({'easyread.nvim'}, { ft = "text" }, _G.packer_plugins)]]
vim.cmd [[au FileType html ++once lua require("packer.load")({'nvim-ts-autotag', 'tagalong.vim'}, { ft = "html" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'markdown-preview.nvim', 'vim-markdown-toc', 'mkdnflow.nvim', 'obsidian.nvim', 'easyread.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType norg ++once lua require("packer.load")({'neorg'}, { ft = "norg" }, _G.packer_plugins)]]
vim.cmd [[au FileType terminal ++once lua require("packer.load")({'nvim-terminal.lua'}, { ft = "terminal" }, _G.packer_plugins)]]
vim.cmd [[au FileType latex ++once lua require("packer.load")({'vim-latex'}, { ft = "latex" }, _G.packer_plugins)]]
vim.cmd [[au FileType ipynb ++once lua require("packer.load")({'jupyter-nvim'}, { ft = "ipynb" }, _G.packer_plugins)]]
vim.cmd [[au FileType org ++once lua require("packer.load")({'orgmode'}, { ft = "org" }, _G.packer_plugins)]]
vim.cmd [[au FileType puml ++once lua require("packer.load")({'plantuml-syntax', 'plantuml-previewer.vim', 'vim-slumlord'}, { ft = "puml" }, _G.packer_plugins)]]
vim.cmd [[au FileType haskell ++once lua require("packer.load")({'haskell-tools.nvim'}, { ft = "haskell" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au User isfolded ++once lua require("packer.load")({'pretty-fold.nvim', 'FastFold'}, { event = "User isfolded" }, _G.packer_plugins)]]
vim.cmd [[au User s1 ++once lua require("packer.load")({'nightfox.nvim', 'vim-hexokinase', 'github-nvim-theme', 'matchparen.nvim', 'indent-blankline.nvim', 'nvim-lspconfig', 'hlargs.nvim', 'due.nvim', 'rainbow-delimiters.nvim'}, { event = "User s1" }, _G.packer_plugins)]]
vim.cmd [[au CmdlineEnter * ++once lua require("packer.load")({'nvim-cmp', 'numb.nvim', 'range-highlight.nvim'}, { event = "CmdlineEnter *" }, _G.packer_plugins)]]
vim.cmd [[au User autotag ++once lua require("packer.load")({'nvim-ts-autotag'}, { event = "User autotag" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'nvim-treesitter-endwise', 'nvim-cmp'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
vim.cmd [[au TextYankPost * ++once lua require("packer.load")({'yanky.nvim'}, { event = "TextYankPost *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/user/.local/share/nvim/site/pack/packer/opt/plantuml-syntax/ftdetect/plantuml.vim]], true)
vim.cmd [[source /home/user/.local/share/nvim/site/pack/packer/opt/plantuml-syntax/ftdetect/plantuml.vim]]
time([[Sourcing ftdetect script at: /home/user/.local/share/nvim/site/pack/packer/opt/plantuml-syntax/ftdetect/plantuml.vim]], false)
time([[Sourcing ftdetect script at: /home/user/.local/share/nvim/site/pack/packer/opt/vim-markdown-toc/ftdetect/markdown.vim]], true)
vim.cmd [[source /home/user/.local/share/nvim/site/pack/packer/opt/vim-markdown-toc/ftdetect/markdown.vim]]
time([[Sourcing ftdetect script at: /home/user/.local/share/nvim/site/pack/packer/opt/vim-markdown-toc/ftdetect/markdown.vim]], false)
time([[Sourcing ftdetect script at: /home/user/.local/share/nvim/site/pack/packer/opt/neorg/ftdetect/norg.lua]], true)
vim.cmd [[source /home/user/.local/share/nvim/site/pack/packer/opt/neorg/ftdetect/norg.lua]]
time([[Sourcing ftdetect script at: /home/user/.local/share/nvim/site/pack/packer/opt/neorg/ftdetect/norg.lua]], false)
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
