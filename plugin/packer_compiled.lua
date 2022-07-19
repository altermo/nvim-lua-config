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
  ["AutoSave.nvim"] = {
    config = { 'require"autosave".setup{}' },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/AutoSave.nvim",
    url = "https://github.com/Pocco81/AutoSave.nvim"
  },
  ["CommentFrame.vim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/CommentFrame.vim",
    url = "https://github.com/cometsong/CommentFrame.vim"
  },
  FastFold = {
    commands = { "FastFoldUpdate" },
    config = { "\27LJ\2\ni\0\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\2\vnowait\2\fnoremap\2\27<Plug>(FastFoldUpdate)\6Z\6n\bset\vkeymap\bvim\0" },
    keys = { { "", "Z" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/FastFold",
    url = "https://github.com/Konfekt/FastFold"
  },
  ["FixCursorHold.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/FixCursorHold.nvim",
    url = "https://github.com/antoinemadec/FixCursorHold.nvim"
  },
  ["HighStr.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/HighStr.nvim",
    url = "https://github.com/Pocco81/HighStr.nvim"
  },
  LuaSnip = {
    config = { 'require("config.snip")' },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["NeoWell.lua"] = {
    config = { 'require"neo-well".setup{}' },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/NeoWell.lua",
    url = "https://github.com/nyngwang/NeoWell.lua"
  },
  ["abbreinder.nvim"] = {
    config = { 'require"abbreinder".setup{}' },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/abbreinder.nvim",
    url = "https://github.com/0styx0/abbreinder.nvim"
  },
  ["abbremand.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/abbremand.nvim",
    url = "https://github.com/0styx0/abbremand.nvim"
  },
  ["aerojump.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/aerojump.nvim",
    url = "https://github.com/ripxorip/aerojump.nvim"
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
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/attempt.nvim",
    url = "https://github.com/m-demare/attempt.nvim"
  },
  ["bex.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/bex.nvim",
    url = "https://github.com/bkoropoff/bex.nvim"
  },
  ["bufdelete.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/bufdelete.nvim",
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
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/calendar.vim",
    url = "https://github.com/itchyny/calendar.vim"
  },
  ["centerpad.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/centerpad.nvim",
    url = "https://github.com/smithbm2316/centerpad.nvim"
  },
  ["clever-f.vim"] = {
    config = { "\27LJ\2\n¸\1\0\0\6\0\n\0\0176\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\0\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0005\5\t\0B\0\5\1K\0\1\0\1\0\2\fnoremap\2\vsilent\2\27<Plug>(clever-f-reset)\n<esc>\6n\bset\vkeymap\25clever_f_mark_direct\24clever_f_smart_case\6g\bvim\0" },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/clever-f.vim",
    url = "https://github.com/rhysd/clever-f.vim"
  },
  ["close-buffers.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/close-buffers.nvim",
    url = "https://github.com/kazhala/close-buffers.nvim"
  },
  ["cmd-parser.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/cmd-parser.nvim",
    url = "https://github.com/winston0410/cmd-parser.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-calc"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/cmp-calc",
    url = "https://github.com/hrsh7th/cmp-calc"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-cmdline-history"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/cmp-cmdline-history",
    url = "https://github.com/dmitmel/cmp-cmdline-history"
  },
  ["cmp-dictionary"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/cmp-dictionary",
    url = "https://github.com/uga-rosa/cmp-dictionary"
  },
  ["cmp-fish"] = {
    after_files = { "/home/user/.local/share/nvim/site/pack/packer/opt/cmp-fish/after/plugin/cmp_fish.lua" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/cmp-fish",
    url = "https://github.com/mtoohey31/cmp-fish"
  },
  ["cmp-fuzzy-buffer"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/cmp-fuzzy-buffer",
    url = "https://github.com/tzachar/cmp-fuzzy-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lsp-signature-help"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp-signature-help",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp-signature-help"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-nvim-tags"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/cmp-nvim-tags",
    url = "https://github.com/quangnguyen30192/cmp-nvim-tags"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-rg"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/cmp-rg",
    url = "https://github.com/lukas-reineke/cmp-rg"
  },
  ["cmp-spell"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/cmp-spell",
    url = "https://github.com/f3fora/cmp-spell"
  },
  ["cmp-tabnine"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/cmp-tabnine",
    url = "https://github.com/tzachar/cmp-tabnine"
  },
  ["cmp-treesitter"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/cmp-treesitter",
    url = "https://github.com/ray-x/cmp-treesitter"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["codi.vim"] = {
    commands = { "Codi", "CodiNew", "CodiExpand", "CodiSelect", "CodiUpdate" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/codi.vim",
    url = "https://github.com/metakirby5/codi.vim"
  },
  ["cybu.nvim"] = {
    config = { "\27LJ\2\n“\2\0\0\5\0\15\0\"6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0B\0\4\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\t\0'\4\n\0B\0\4\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\v\0'\4\f\0B\0\4\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\r\0'\4\14\0B\0\4\1K\0\1\0\29<plug>(CybuLastusedNext)\a]B\29<plug>(CybuLastusedPrev)\a[B\21<Plug>(CybuNext)\a]b\21<Plug>(CybuPrev)\a[b\6n\bset\vkeymap\bvim\nsetup\tcybu\frequire\0" },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/cybu.nvim",
    url = "https://github.com/ghillb/cybu.nvim"
  },
  ["darkplus.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/darkplus.nvim",
    url = "https://github.com/yong1le/darkplus.nvim"
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
    keys = { { "n", "<C-a>" }, { "n", "<C-x>" }, { "v", "<C-a>" }, { "v", "<C-x>" }, { "v", "g<C-a>" }, { "v", "g<C-x>" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/dial.nvim",
    url = "https://github.com/monaqa/dial.nvim"
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
  falcon = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/falcon",
    url = "https://github.com/fenetikm/falcon"
  },
  ["far.vim"] = {
    commands = { "Far", "Fardo", "Farr", "Farf", "Farp", "Farundo", "F", "Refar" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/far.vim",
    url = "https://github.com/brooth/far.vim"
  },
  ["filetype.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/filetype.nvim",
    url = "https://github.com/nathom/filetype.nvim"
  },
  ["focus.nvim"] = {
    config = { 'require"focus".setup{\n  autoresize = false\n}' },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/focus.nvim",
    url = "https://github.com/beauwilliams/focus.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["fuzzy.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/fuzzy.nvim",
    url = "https://github.com/tzachar/fuzzy.nvim"
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
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/harpoon",
    url = "https://github.com/ThePrimeagen/harpoon"
  },
  ["hop.nvim"] = {
    config = { 'require"hop".setup{}' },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/hop.nvim",
    url = "https://github.com/phaazon/hop.nvim"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["inc-rename.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/inc-rename.nvim",
    url = "https://github.com/smjonas/inc-rename.nvim"
  },
  ["jumpy.vim"] = {
    keys = { { "", "[[" }, { "", "<char-93><char-93>" } },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/jumpy.vim",
    url = "https://github.com/arp242/jumpy.vim"
  },
  kimbox = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/kimbox",
    url = "https://github.com/lmburns/kimbox"
  },
  ["lazylist.vim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/lazylist.vim",
    url = "https://github.com/kabbamine/lazylist.vim"
  },
  ["lista.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/lista.nvim",
    url = "https://github.com/lambdalisue/lista.nvim"
  },
  ["lsp-colors.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/lsp-colors.nvim",
    url = "https://github.com/folke/lsp-colors.nvim"
  },
  ["lspkind.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/lspkind.nvim",
    url = "https://github.com/onsails/lspkind.nvim"
  },
  ["lspsaga.nvim"] = {
    config = { "\27LJ\2\nf\0\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\24:Lspsaga hover_doc\r\6K\6n\bset\vkeymap\bvim\0" },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/lspsaga.nvim",
    url = "https://github.com/kkharji/lspsaga.nvim"
  },
  ["lualine.nvim"] = {
    config = { 'require"lualine".setup{\n  options = {\n    theme = "powerline"\n  }\n}' },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["markdown-preview.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  ["matchparen.nvim"] = {
    config = { 'require"matchparen".setup{}' },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/matchparen.nvim",
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
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/mkdir.nvim",
    url = "https://github.com/jghauser/mkdir.nvim"
  },
  ["naz.vim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/naz.vim",
    url = "https://github.com/1995parham/naz.vim"
  },
  ["nebulous.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/nebulous.nvim",
    url = "https://github.com/yagua/nebulous.nvim"
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
  neorg = {
    config = { 'require"neorg".setup{\n  load = {\n    ["core.defaults"] = {},\n    ["core.export"] = {},\n    ["core.export.markdown"] = {},\n    ["core.integrations.telescope"] = {},\n    ["core.norg.concealer"] = {}\n  }\n}' },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/neorg",
    url = "https://github.com/nvim-neorg/neorg"
  },
  ["neorg-telescope"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/neorg-telescope",
    url = "https://github.com/nvim-neorg/neorg-telescope"
  },
  ["neoscroll.nvim"] = {
    config = { 'require"neoscroll".setup{}' },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/neoscroll.nvim",
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
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/nerdcommenter",
    url = "https://github.com/preservim/nerdcommenter"
  },
  ["nightfox.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/nightfox.nvim",
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
  ["nui.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["numb.nvim"] = {
    config = { 'require"numb".setup{}' },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/numb.nvim",
    url = "https://github.com/nacro90/numb.nvim"
  },
  nvim = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/nvim",
    url = "https://github.com/catppuccin/nvim"
  },
  ["nvim-autopairs"] = {
    config = { 'require("config.autopairs")' },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    config = { 'require("config.cmp-nvim")' },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { 'require"colorizer".setup{ "*" }' },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-expand-expr"] = {
    config = { "\27LJ\2\n_\0\0\5\0\6\0\b6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0B\0\4\1K\0\1\0(:lua require\"expand_expr\".expand()\r\agE\6n\bset\vkeymap\bvim\0" },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/nvim-expand-expr",
    url = "https://github.com/allendang/nvim-expand-expr"
  },
  ["nvim-gomove"] = {
    config = { 'require"gomove".setup{\n  map_defaults = false\n}' },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/nvim-gomove",
    url = "https://github.com/booperlv/nvim-gomove"
  },
  ["nvim-highlite"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/nvim-highlite",
    url = "https://github.com/iron-e/nvim-highlite"
  },
  ["nvim-hlslens"] = {
    config = { 'require("config.hlslens")' },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/nvim-hlslens",
    url = "https://github.com/kevinhwang91/nvim-hlslens"
  },
  ["nvim-keymap-amend"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/nvim-keymap-amend",
    url = "https://github.com/anuvyklack/nvim-keymap-amend"
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
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    config = { 'require("config.lsp")' },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-notify"] = {
    config = { 'require("config.notify")' },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-peekup"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/nvim-peekup",
    url = "https://github.com/gennaro-tedesco/nvim-peekup"
  },
  ["nvim-pqf"] = {
    config = { 'require"pqf".setup{}' },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/nvim-pqf",
    url = "https://gitlab.com/yorickpeterse/nvim-pqf"
  },
  ["nvim-regexplainer"] = {
    config = { 'require"regexplainer".setup{\n  auto = true,\n  filetypes = { "*" }\n}' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/nvim-regexplainer",
    url = "https://github.com/bennypowers/nvim-regexplainer"
  },
  ["nvim-rooter.lua"] = {
    config = { 'require"nvim-rooter".setup{\n  manual = true\n}' },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/nvim-rooter.lua",
    url = "https://github.com/notjedi/nvim-rooter.lua"
  },
  ["nvim-surround"] = {
    config = { 'require"nvim-surround".setup{}' },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/nvim-surround",
    url = "https://github.com/kylechui/nvim-surround"
  },
  ["nvim-tetris"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/nvim-tetris",
    url = "https://github.com/alec-gibson/nvim-tetris"
  },
  ["nvim-tree.lua"] = {
    commands = { "NvimTreeToggle" },
    config = { 'require("config.nvimtree")' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treehopper"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/nvim-treehopper",
    url = "https://github.com/mfussenegger/nvim-treehopper"
  },
  ["nvim-treesitter"] = {
    config = { 'require("config.treesitter")' },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-pairs"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/nvim-treesitter-pairs",
    url = "https://github.com/theHamsta/nvim-treesitter-pairs"
  },
  ["nvim-treesitter-refactor"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/nvim-treesitter-refactor",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-refactor"
  },
  ["nvim-treesitter-textsubjects"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textsubjects",
    url = "https://github.com/RRethy/nvim-treesitter-textsubjects"
  },
  ["nvim-trevj.lua"] = {
    config = { "\27LJ\2\ne\0\0\5\0\6\0\b6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0B\0\4\1K\0\1\0.:lua require(\"trevj\").format_at_cursor()\r\agS\6n\bset\vkeymap\bvim\0" },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/nvim-trevj.lua",
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
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["nvim-window"] = {
    config = { "\27LJ\2\n|\0\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\2\fnoremap\2\vsilent\2(:lua require(\"nvim-window\").pick()\r\f<C-w>g \6n\bset\vkeymap\bvim\0" },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/nvim-window",
    url = "https://gitlab.com/yorickpeterse/nvim-window"
  },
  ["nvim-window-picker"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/nvim-window-picker",
    url = "https://github.com/s1n7ax/nvim-window-picker"
  },
  ["nvim-yati"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/nvim-yati",
    url = "https://github.com/yioneko/nvim-yati"
  },
  nvim_context_vt = {
    config = { 'require"nvim_context_vt".setup{}' },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/nvim_context_vt",
    url = "https://github.com/haringsrob/nvim_context_vt"
  },
  oak = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/oak",
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
    config = { "\27LJ\2\nª\1\0\0\6\0\t\0\0176\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\a\0'\3\4\0'\4\5\0005\5\b\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\6v\1\0\2\vsilent\2\fnoremap\2%<Plug>(openbrowser-smart-search)\agx\6n\bset\vkeymap\bvim\0" },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/open-browser.vim",
    url = "https://github.com/tyru/open-browser.vim"
  },
  orgmode = {
    config = { 'require"orgmode".setup{}' },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/orgmode",
    url = "https://github.com/nvim-orgmode/orgmode"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  pinkmare = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/pinkmare",
    url = "https://github.com/matsuuu/pinkmare"
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
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["pounce.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/pounce.nvim",
    url = "https://github.com/rlane/pounce.nvim"
  },
  ["pretty-fold.nvim"] = {
    config = { 'require"pretty-fold".setup{}require"pretty-fold.preview".setup{}' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/pretty-fold.nvim",
    url = "https://github.com/anuvyklack/pretty-fold.nvim"
  },
  ["range-highlight.nvim"] = {
    config = { 'require"range-highlight".setup{}' },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/range-highlight.nvim",
    url = "https://github.com/winston0410/range-highlight.nvim"
  },
  ["reach.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/reach.nvim",
    url = "https://github.com/toppair/reach.nvim"
  },
  ["refactoring.nvim"] = {
    config = { "\27LJ\2\nÀ\4\0\0\6\0\16\0!6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\a\0'\4\b\0005\5\t\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\n\0'\4\v\0005\5\f\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\r\0'\4\14\0005\5\15\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2I<Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>\15<leader>ri\1\0\2\vsilent\2\fnoremap\2J<Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>\15<leader>rv\1\0\2\vsilent\2\fnoremap\2R<Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>\15<leader>rf\1\0\2\vsilent\2\fnoremap\2J<Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>\15<leader>re\6v\20nvim_set_keymap\bapi\bvim\0" },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/refactoring.nvim",
    url = "https://github.com/ThePrimeagen/refactoring.nvim"
  },
  ["registers.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/registers.nvim",
    url = "https://github.com/tversteeg/registers.nvim"
  },
  ["sideways.vim"] = {
    config = { "\27LJ\2\nš\2\0\0\6\0\16\0!6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\a\0'\4\b\0005\5\t\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\n\0'\4\v\0005\5\f\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\r\0'\4\14\0005\5\15\0B\0\5\1K\0\1\0\1\0\1\vsilent\2\23:SidewaysJumpLeft\r\a<A\1\0\1\vsilent\2\24:SidewaysJumpRight\r\a>A\1\0\1\vsilent\2\19:SidewaysLeft\r\a<a\1\0\1\vsilent\2\20:SidewaysRight\r\a>a\6n\bset\vkeymap\bvim\0" },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/sideways.vim",
    url = "https://github.com/AndrewRadev/sideways.vim"
  },
  ["simplebuffer.vim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/simplebuffer.vim",
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
  ["spellsitter.nvim"] = {
    config = { 'require"spellsitter".setup{}' },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/spellsitter.nvim",
    url = "https://github.com/lewis6991/spellsitter.nvim"
  },
  ["splitjoin.vim"] = {
    keys = { { "", "gR" }, { "", "gJ" } },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/splitjoin.vim",
    url = "https://github.com/andrewradev/splitjoin.vim"
  },
  ["stabilize.nvim"] = {
    config = { 'require"stabilize".setup{}' },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/stabilize.nvim",
    url = "https://github.com/luukvbaal/stabilize.nvim"
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
  ["syntax-tree-surfer"] = {
    config = { 'require("config.gomove-treesurfer")' },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/syntax-tree-surfer",
    url = "https://github.com/ziontee113/syntax-tree-surfer"
  },
  ["tabout.nvim"] = {
    config = { 'require"tabout".setup{\n  act_as_tab = false,\n  backwards_tabkey = "<A-S-tab>",\n  tabkey = "<A-tab>"\n}' },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/tabout.nvim",
    url = "https://github.com/abecodes/tabout.nvim"
  },
  tabular = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/tabular",
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
  ["targets.vim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/targets.vim",
    url = "https://github.com/wellle/targets.vim"
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
  ["telescope-live-grep-args.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/telescope-live-grep-args.nvim",
    url = "https://github.com/nvim-telescope/telescope-live-grep-args.nvim"
  },
  ["telescope-luasnip.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/telescope-luasnip.nvim",
    url = "https://github.com/benfowler/telescope-luasnip.nvim"
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
    config = { 'require("config.telescope")' },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["textobj-word-column.vim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/textobj-word-column.vim",
    url = "https://github.com/coderifous/textobj-word-column.vim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ["truezen.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/truezen.nvim",
    url = "https://github.com/pocco81/truezen.nvim"
  },
  ["twilight.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/twilight.nvim",
    url = "https://github.com/folke/twilight.nvim"
  },
  ["venn.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/venn.nvim",
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
  ["vim-bookmarks"] = {
    keys = { { "", "mg" }, { "", "mjj" }, { "", "mkk" }, { "", "mx" }, { "", "mc" }, { "", "mp" }, { "", "mn" }, { "", "mi" }, { "", "mm" }, { "", "ma" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-bookmarks",
    url = "https://github.com/mattesgroeger/vim-bookmarks"
  },
  ["vim-buffest"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/vim-buffest",
    url = "https://github.com/rbong/vim-buffest"
  },
  ["vim-characterize"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/vim-characterize",
    url = "https://github.com/tpope/vim-characterize"
  },
  ["vim-choosewin"] = {
    config = { "\27LJ\2\n…\1\0\0\6\0\t\0\r6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\3\0009\0\4\0'\2\5\0'\3\6\0'\4\a\0005\5\b\0B\0\5\1K\0\1\0\1\0\1\vsilent\2\16:ChooseWin\r\v<C-w> \6n\bset\vkeymap\29choosewin_overlay_enable\6g\bvim\0" },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/vim-choosewin",
    url = "https://github.com/t9md/vim-choosewin"
  },
  ["vim-ditto"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/vim-ditto",
    url = "https://github.com/dbmrq/vim-ditto"
  },
  ["vim-doge"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/vim-doge",
    url = "https://github.com/kkoomen/vim-doge"
  },
  ["vim-eunuch"] = {
    commands = { "Cfind", "Chmod", "Clocate", "Copy", "Delete", "Duplicate", "Lfind", "Llocate", "Mkdir", "Move", "Remove", "Rename", "SudoEdit", "SudoWrite", "Unlink", "W", "Wall" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-eunuch",
    url = "https://github.com/tpope/vim-eunuch"
  },
  ["vim-exchange"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/vim-exchange",
    url = "https://github.com/tommcdo/vim-exchange"
  },
  ["vim-flog"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-flog",
    url = "https://github.com/rbong/vim-flog"
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
  ["vim-grammarous"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/vim-grammarous",
    url = "https://github.com/rhysd/vim-grammarous"
  },
  ["vim-highlighter"] = {
    keys = { { "", "M<CR>" }, { "", "M<BS>" }, { "", "M<C-l>" }, { "", "M<Tab>" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-highlighter",
    url = "https://github.com/azabiong/vim-highlighter"
  },
  ["vim-hopping"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/vim-hopping",
    url = "https://github.com/osyo-manga/vim-hopping"
  },
  ["vim-im-select"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/vim-im-select",
    url = "https://github.com/brglng/vim-im-select"
  },
  ["vim-indent-object"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/vim-indent-object",
    url = "https://github.com/michaeljsmith/vim-indent-object"
  },
  ["vim-lion"] = {
    keys = { { "v", "gl" }, { "n", "gl" }, { "v", "gL" }, { "n", "gL" } },
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
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/vim-mario",
    url = "https://github.com/rbtnn/vim-mario"
  },
  ["vim-mundo"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/vim-mundo",
    url = "https://github.com/simnalamburt/vim-mundo"
  },
  ["vim-pushover"] = {
    keys = { { "n", ">w" }, { "n", "<w" }, { "n", "<W" }, { "n", ">W" }, { "n", "<p" }, { "n", ">p" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-pushover",
    url = "https://github.com/D4KU/vim-pushover"
  },
  ["vim-puyo"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/vim-puyo",
    url = "https://github.com/rbtnn/vim-puyo"
  },
  ["vim-qf"] = {
    config = { 'require("config.qf")' },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/vim-qf",
    url = "https://github.com/romainl/vim-qf"
  },
  ["vim-radical"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/vim-radical",
    url = "https://github.com/glts/vim-radical"
  },
  ["vim-rainbow-lists"] = {
    config = { "\27LJ\2\n`\0\0\4\0\5\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0005\3\4\0B\0\3\1K\0\1\0\1\0\1\fcommand\17RBListEnable\rFileType\24nvim_create_autocmd\bapi\bvim\0" },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/vim-rainbow-lists",
    url = "https://github.com/lervag/vim-rainbow-lists"
  },
  ["vim-seek"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/vim-seek",
    url = "https://github.com/goldfeld/vim-seek"
  },
  ["vim-smalls"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/vim-smalls",
    url = "https://github.com/t9md/vim-smalls"
  },
  ["vim-smartq"] = {
    config = { "\27LJ\2\n9\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\0\0=\1\2\0K\0\1\0\28smartq_default_mappings\6g\bvim\0" },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/vim-smartq",
    url = "https://github.com/marklcrns/vim-smartq"
  },
  ["vim-split-line"] = {
    config = { "\27LJ\2\nb\0\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\16:SplitLine\r\n<A-s>\6n\bset\vkeymap\bvim\0" },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/vim-split-line",
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
  ["vim-textobj-blanklines"] = {
    keys = { { "o", "i<space>" }, { "v", "i<space>" }, { "o", "a<space>" }, { "v", "a<space>" } },
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
    keys = { { "o", "iv" }, { "o", "av" }, { "v", "iv" }, { "v", "av" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-textobj-variable-segment",
    url = "https://github.com/Julian/vim-textobj-variable-segment"
  },
  ["vim-translator"] = {
    config = { 'require("config.translator")' },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/vim-translator",
    url = "https://github.com/voldikss/vim-translator"
  },
  ["vim-windowswap"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/vim-windowswap",
    url = "https://github.com/wesQ3/vim-windowswap"
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
  ["vlog.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/vlog.nvim",
    url = "https://github.com/tjdevries/vlog.nvim"
  },
  ["which-key.nvim"] = {
    config = { 'require("config.which-key")' },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  },
  ["winshift.nvim"] = {
    config = { "\27LJ\2\nè\1\0\0\f\0\14\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\3\0005\2\4\0B\0\2\4H\3\14€6\5\5\0009\5\6\0059\5\a\5'\a\b\0'\b\t\0\18\t\3\0'\n\n\0&\b\n\b'\t\v\0\18\n\4\0'\v\f\0&\t\v\t5\n\r\0B\5\5\1F\3\3\3R\3ð\127K\0\1\0\1\0\2\vsilent\2\fnoremap\2\6\r\15:WinShift \6>\n<C-S-\6n\bset\vkeymap\bvim\1\0\4\6k\aup\6j\tdown\6l\nright\6h\tleft\npairs\nsetup\rwinshift\frequire\0" },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/winshift.nvim",
    url = "https://github.com/sindrets/winshift.nvim"
  },
  ["yanky.nvim"] = {
    config = { 'require("config.yanky")' },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/yanky.nvim",
    url = "https://github.com/gbprod/yanky.nvim"
  },
  ["zen-mode.nvim"] = {
    config = { 'require"zen-mode".setup{}' },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/zen-mode.nvim",
    url = "https://github.com/folke/zen-mode.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Setup for: nvim-regexplainer
time([[Setup for nvim-regexplainer]], true)
try_loadstring("\27LJ\2\n­\2\0\0\4\0\6\0\b6\0\0\0009\0\1\0009\0\2\0'\2\3\0005\3\4\0B\0\3\0027\0\5\0K\0\1\0\17REGEXPLAINER\1\0\1\fcommandÉ\1lua local a,_=require\"regexplainer.utils.treesitter\".get_regexp_pattern_at_cursor() if a then vim.api.nvim_del_autocmd(REGEXPLAINER) vim.api.nvim_exec_autocmds(\"User\",{pattern=\"regexplainer\"}) end\16CursorMoved\24nvim_create_autocmd\bapi\bvim\0", "setup", "nvim-regexplainer")
time([[Setup for nvim-regexplainer]], false)
-- Setup for: vim-highlighter
time([[Setup for vim-highlighter]], true)
try_loadstring("\27LJ\2\nˆ\1\0\0\2\0\n\0\0176\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\1\0'\1\a\0=\1\6\0006\0\0\0009\0\1\0'\1\t\0=\1\b\0K\0\1\0\vM<tab>\vHiFind\vM<C-L>\fHiClear\nM<BS>\fHiErase\nM<CR>\nHiSet\6g\bvim\0", "setup", "vim-highlighter")
time([[Setup for vim-highlighter]], false)
-- Setup for: splitjoin.vim
time([[Setup for splitjoin.vim]], true)
try_loadstring("\27LJ\2\n<\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\agR\28splitjoin_split_mapping\6g\bvim\0", "setup", "splitjoin.vim")
time([[Setup for splitjoin.vim]], false)
-- Setup for: FastFold
time([[Setup for FastFold]], true)
try_loadstring("\27LJ\2\nÍ\1\0\0\b\1\n\0\25-\0\0\0009\0\0\0-\2\0\0009\2\1\2)\4\1\0-\5\0\0009\5\2\5'\a\3\0B\5\2\0A\2\1\2'\3\4\0B\0\3\2\21\0\0\0)\1\0\0\1\1\0\0X\0\b€6\0\5\0009\0\6\0'\2\a\0B\0\2\1-\0\0\0009\0\b\0006\2\t\0B\0\2\1K\0\1\0\0À\18FASTFOLDTIMER\15timer_stop\28doautocmd User isfolded\bcmd\bvim\23foldlevel(v:val)>0\6$\tline\nrange\vfiltera\1\0\6\0\6\0\n6\0\0\0009\0\1\0009\1\2\0)\3Ð\a3\4\3\0005\5\4\0B\1\4\0027\1\5\0002\0\0€K\0\1\0\18FASTFOLDTIMER\1\0\1\vrepeat\3ÿÿÿÿ\15\0\16timer_start\afn\bvim\0", "setup", "FastFold")
time([[Setup for FastFold]], false)
-- Setup for: vim-flog
time([[Setup for vim-flog]], true)
try_loadstring("\27LJ\2\n¹\2\0\1\a\0\6\0\v6\1\0\0009\1\1\0019\1\2\1\18\3\0\0'\4\3\0\18\5\0\0'\6\4\0&\4\6\0045\5\5\0B\1\4\1K\0\1\0\1\0\4\tbang\2\nnargs\6*\nrange\2\rcomplete\tfileZ\",l1=<line1>,l2=<line2>,bang=<q-bang>,args=<q-args>,mods=\"<mods>\"},_G.packer_plugins)mlua require\"packer.load\"({\"vim-fugitive\"},{},_G.packer_plugins) require\"packer.load\"({\"vim-flog\"},{cmd=\"\29nvim_create_user_command\bapi\bvimK\1\0\4\0\4\0\v3\0\0\0\18\1\0\0'\3\1\0B\1\2\1\18\1\0\0'\3\2\0B\1\2\1\18\1\0\0'\3\3\0B\1\2\1K\0\1\0\fFloggit\14Flogsplit\tFlog\0\0", "setup", "vim-flog")
time([[Setup for vim-flog]], false)
-- Setup for: dashboard-nvim
time([[Setup for dashboard-nvim]], true)
try_loadstring("\27LJ\2\n{\0\0\3\0\a\2\0186\0\0\0009\0\1\0009\0\2\0B\0\1\2\t\0\0\0X\0\v€6\0\0\0009\0\1\0009\0\3\0'\2\4\0B\0\2\2\t\0\1\0X\0\4€6\0\0\0009\0\5\0'\2\6\0B\0\2\1K\0\1\0\14Dashboard\bcmd\6$\14line2byte\targc\afn\bvim\0þÿÿÿ\31]\1\0\5\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0005\3\5\0003\4\4\0=\4\6\3B\0\3\1K\0\1\0\rcallback\1\0\0\0\rVimenter\24nvim_create_autocmd\bapi\bvim\0", "setup", "dashboard-nvim")
time([[Setup for dashboard-nvim]], false)
-- Setup for: dirbuf.nvim
time([[Setup for dirbuf.nvim]], true)
try_loadstring("\27LJ\2\n”\1\0\0\4\0\5\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0005\3\4\0B\0\3\1K\0\1\0\1\0\1\fcommandEif isdirectory(expand('%')) && !&modified|execute 'Dirbuf'|endif\rBufEnter\24nvim_create_autocmd\bapi\bvim\0", "setup", "dirbuf.nvim")
time([[Setup for dirbuf.nvim]], false)
-- Config for: nvim-window
time([[Config for nvim-window]], true)
try_loadstring("\27LJ\2\n|\0\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\2\fnoremap\2\vsilent\2(:lua require(\"nvim-window\").pick()\r\f<C-w>g \6n\bset\vkeymap\bvim\0", "config", "nvim-window")
time([[Config for nvim-window]], false)
-- Config for: vim-translator
time([[Config for vim-translator]], true)
require("config.translator")
time([[Config for vim-translator]], false)
-- Config for: lspsaga.nvim
time([[Config for lspsaga.nvim]], true)
try_loadstring("\27LJ\2\nf\0\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\24:Lspsaga hover_doc\r\6K\6n\bset\vkeymap\bvim\0", "config", "lspsaga.nvim")
time([[Config for lspsaga.nvim]], false)
-- Config for: nerdcommenter
time([[Config for nerdcommenter]], true)
try_loadstring("\27LJ\2\n¼\1\0\0\5\0\n\0\0196\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\3\0009\0\4\0'\2\5\0'\3\6\0'\4\a\0B\0\4\0016\0\0\0009\0\3\0009\0\4\0'\2\b\0'\3\6\0'\4\t\0B\0\4\1K\0\1\0\30<Plug>NERDCommenterToggle\6n!<Plug>NERDCommenterToggle gv\agc\6x\bset\vkeymap\30NERDCreateDefaultMappings\6g\bvim\0", "config", "nerdcommenter")
time([[Config for nerdcommenter]], false)
-- Config for: nvim-rooter.lua
time([[Config for nvim-rooter.lua]], true)
require"nvim-rooter".setup{
  manual = true
}
time([[Config for nvim-rooter.lua]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
require"lualine".setup{
  options = {
    theme = "powerline"
  }
}
time([[Config for lualine.nvim]], false)
-- Config for: neorg
time([[Config for neorg]], true)
require"neorg".setup{
  load = {
    ["core.defaults"] = {},
    ["core.export"] = {},
    ["core.export.markdown"] = {},
    ["core.integrations.telescope"] = {},
    ["core.norg.concealer"] = {}
  }
}
time([[Config for neorg]], false)
-- Config for: matchparen.nvim
time([[Config for matchparen.nvim]], true)
require"matchparen".setup{}
time([[Config for matchparen.nvim]], false)
-- Config for: orgmode
time([[Config for orgmode]], true)
require"orgmode".setup{}
time([[Config for orgmode]], false)
-- Config for: nvim_context_vt
time([[Config for nvim_context_vt]], true)
require"nvim_context_vt".setup{}
time([[Config for nvim_context_vt]], false)
-- Config for: nvim-pqf
time([[Config for nvim-pqf]], true)
require"pqf".setup{}
time([[Config for nvim-pqf]], false)
-- Config for: tabout.nvim
time([[Config for tabout.nvim]], true)
require"tabout".setup{
  act_as_tab = false,
  backwards_tabkey = "<A-S-tab>",
  tabkey = "<A-tab>"
}
time([[Config for tabout.nvim]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
require"colorizer".setup{ "*" }
time([[Config for nvim-colorizer.lua]], false)
-- Config for: open-browser.vim
time([[Config for open-browser.vim]], true)
try_loadstring("\27LJ\2\nª\1\0\0\6\0\t\0\0176\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\a\0'\3\4\0'\4\5\0005\5\b\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\6v\1\0\2\vsilent\2\fnoremap\2%<Plug>(openbrowser-smart-search)\agx\6n\bset\vkeymap\bvim\0", "config", "open-browser.vim")
time([[Config for open-browser.vim]], false)
-- Config for: nvim-notify
time([[Config for nvim-notify]], true)
require("config.notify")
time([[Config for nvim-notify]], false)
-- Config for: nvim-lastplace
time([[Config for nvim-lastplace]], true)
require"nvim-lastplace".setup{}
time([[Config for nvim-lastplace]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
require("config.autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
require("config.lsp")
time([[Config for nvim-lspconfig]], false)
-- Config for: range-highlight.nvim
time([[Config for range-highlight.nvim]], true)
require"range-highlight".setup{}
time([[Config for range-highlight.nvim]], false)
-- Config for: onedark.nvim
time([[Config for onedark.nvim]], true)
vim.cmd"colorschem onedark"
time([[Config for onedark.nvim]], false)
-- Config for: vim-rainbow-lists
time([[Config for vim-rainbow-lists]], true)
try_loadstring("\27LJ\2\n`\0\0\4\0\5\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0005\3\4\0B\0\3\1K\0\1\0\1\0\1\fcommand\17RBListEnable\rFileType\24nvim_create_autocmd\bapi\bvim\0", "config", "vim-rainbow-lists")
time([[Config for vim-rainbow-lists]], false)
-- Config for: nvim-expand-expr
time([[Config for nvim-expand-expr]], true)
try_loadstring("\27LJ\2\n_\0\0\5\0\6\0\b6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0B\0\4\1K\0\1\0(:lua require\"expand_expr\".expand()\r\agE\6n\bset\vkeymap\bvim\0", "config", "nvim-expand-expr")
time([[Config for nvim-expand-expr]], false)
-- Config for: stabilize.nvim
time([[Config for stabilize.nvim]], true)
require"stabilize".setup{}
time([[Config for stabilize.nvim]], false)
-- Config for: zen-mode.nvim
time([[Config for zen-mode.nvim]], true)
require"zen-mode".setup{}
time([[Config for zen-mode.nvim]], false)
-- Config for: vim-choosewin
time([[Config for vim-choosewin]], true)
try_loadstring("\27LJ\2\n…\1\0\0\6\0\t\0\r6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\3\0009\0\4\0'\2\5\0'\3\6\0'\4\a\0005\5\b\0B\0\5\1K\0\1\0\1\0\1\vsilent\2\16:ChooseWin\r\v<C-w> \6n\bset\vkeymap\29choosewin_overlay_enable\6g\bvim\0", "config", "vim-choosewin")
time([[Config for vim-choosewin]], false)
-- Config for: vim-smartq
time([[Config for vim-smartq]], true)
try_loadstring("\27LJ\2\n9\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\0\0=\1\2\0K\0\1\0\28smartq_default_mappings\6g\bvim\0", "config", "vim-smartq")
time([[Config for vim-smartq]], false)
-- Config for: neoscroll.nvim
time([[Config for neoscroll.nvim]], true)
require"neoscroll".setup{}
time([[Config for neoscroll.nvim]], false)
-- Config for: abbreinder.nvim
time([[Config for abbreinder.nvim]], true)
require"abbreinder".setup{}
time([[Config for abbreinder.nvim]], false)
-- Config for: syntax-tree-surfer
time([[Config for syntax-tree-surfer]], true)
require("config.gomove-treesurfer")
time([[Config for syntax-tree-surfer]], false)
-- Config for: nvim-hlslens
time([[Config for nvim-hlslens]], true)
require("config.hlslens")
time([[Config for nvim-hlslens]], false)
-- Config for: NeoWell.lua
time([[Config for NeoWell.lua]], true)
require"neo-well".setup{}
time([[Config for NeoWell.lua]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
require("config.treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: focus.nvim
time([[Config for focus.nvim]], true)
require"focus".setup{
  autoresize = false
}
time([[Config for focus.nvim]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
require("config.snip")
time([[Config for LuaSnip]], false)
-- Config for: vim-qf
time([[Config for vim-qf]], true)
require("config.qf")
time([[Config for vim-qf]], false)
-- Config for: nvim-gomove
time([[Config for nvim-gomove]], true)
require"gomove".setup{
  map_defaults = false
}
time([[Config for nvim-gomove]], false)
-- Config for: sideways.vim
time([[Config for sideways.vim]], true)
try_loadstring("\27LJ\2\nš\2\0\0\6\0\16\0!6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\a\0'\4\b\0005\5\t\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\n\0'\4\v\0005\5\f\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\r\0'\4\14\0005\5\15\0B\0\5\1K\0\1\0\1\0\1\vsilent\2\23:SidewaysJumpLeft\r\a<A\1\0\1\vsilent\2\24:SidewaysJumpRight\r\a>A\1\0\1\vsilent\2\19:SidewaysLeft\r\a<a\1\0\1\vsilent\2\20:SidewaysRight\r\a>a\6n\bset\vkeymap\bvim\0", "config", "sideways.vim")
time([[Config for sideways.vim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
require("config.telescope")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-surround
time([[Config for nvim-surround]], true)
require"nvim-surround".setup{}
time([[Config for nvim-surround]], false)
-- Config for: mini.nvim
time([[Config for mini.nvim]], true)
require("config.mini")
time([[Config for mini.nvim]], false)
-- Config for: vim-split-line
time([[Config for vim-split-line]], true)
try_loadstring("\27LJ\2\nb\0\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\16:SplitLine\r\n<A-s>\6n\bset\vkeymap\bvim\0", "config", "vim-split-line")
time([[Config for vim-split-line]], false)
-- Config for: nvim-lazy-inner-block
time([[Config for nvim-lazy-inner-block]], true)
require"nvim-lazy-inner-block".setup{}
time([[Config for nvim-lazy-inner-block]], false)
-- Config for: refactoring.nvim
time([[Config for refactoring.nvim]], true)
try_loadstring("\27LJ\2\nÀ\4\0\0\6\0\16\0!6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\a\0'\4\b\0005\5\t\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\n\0'\4\v\0005\5\f\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\r\0'\4\14\0005\5\15\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2I<Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>\15<leader>ri\1\0\2\vsilent\2\fnoremap\2J<Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>\15<leader>rv\1\0\2\vsilent\2\fnoremap\2R<Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>\15<leader>rf\1\0\2\vsilent\2\fnoremap\2J<Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>\15<leader>re\6v\20nvim_set_keymap\bapi\bvim\0", "config", "refactoring.nvim")
time([[Config for refactoring.nvim]], false)
-- Config for: cybu.nvim
time([[Config for cybu.nvim]], true)
try_loadstring("\27LJ\2\n“\2\0\0\5\0\15\0\"6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0B\0\4\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\t\0'\4\n\0B\0\4\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\v\0'\4\f\0B\0\4\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\r\0'\4\14\0B\0\4\1K\0\1\0\29<plug>(CybuLastusedNext)\a]B\29<plug>(CybuLastusedPrev)\a[B\21<Plug>(CybuNext)\a]b\21<Plug>(CybuPrev)\a[b\6n\bset\vkeymap\bvim\nsetup\tcybu\frequire\0", "config", "cybu.nvim")
time([[Config for cybu.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
require("config.cmp-nvim")
time([[Config for nvim-cmp]], false)
-- Config for: yanky.nvim
time([[Config for yanky.nvim]], true)
require("config.yanky")
time([[Config for yanky.nvim]], false)
-- Config for: nvim-trevj.lua
time([[Config for nvim-trevj.lua]], true)
try_loadstring("\27LJ\2\ne\0\0\5\0\6\0\b6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0B\0\4\1K\0\1\0.:lua require(\"trevj\").format_at_cursor()\r\agS\6n\bset\vkeymap\bvim\0", "config", "nvim-trevj.lua")
time([[Config for nvim-trevj.lua]], false)
-- Config for: attempt.nvim
time([[Config for attempt.nvim]], true)
require("config.attempt")
time([[Config for attempt.nvim]], false)
-- Config for: winshift.nvim
time([[Config for winshift.nvim]], true)
try_loadstring("\27LJ\2\nè\1\0\0\f\0\14\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\3\0005\2\4\0B\0\2\4H\3\14€6\5\5\0009\5\6\0059\5\a\5'\a\b\0'\b\t\0\18\t\3\0'\n\n\0&\b\n\b'\t\v\0\18\n\4\0'\v\f\0&\t\v\t5\n\r\0B\5\5\1F\3\3\3R\3ð\127K\0\1\0\1\0\2\vsilent\2\fnoremap\2\6\r\15:WinShift \6>\n<C-S-\6n\bset\vkeymap\bvim\1\0\4\6k\aup\6j\tdown\6l\nright\6h\tleft\npairs\nsetup\rwinshift\frequire\0", "config", "winshift.nvim")
time([[Config for winshift.nvim]], false)
-- Config for: AutoSave.nvim
time([[Config for AutoSave.nvim]], true)
require"autosave".setup{}
time([[Config for AutoSave.nvim]], false)
-- Config for: hop.nvim
time([[Config for hop.nvim]], true)
require"hop".setup{}
time([[Config for hop.nvim]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
require("config.which-key")
time([[Config for which-key.nvim]], false)
-- Config for: numb.nvim
time([[Config for numb.nvim]], true)
require"numb".setup{}
time([[Config for numb.nvim]], false)
-- Config for: spellsitter.nvim
time([[Config for spellsitter.nvim]], true)
require"spellsitter".setup{}
time([[Config for spellsitter.nvim]], false)
-- Config for: clever-f.vim
time([[Config for clever-f.vim]], true)
try_loadstring("\27LJ\2\n¸\1\0\0\6\0\n\0\0176\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\0\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0005\5\t\0B\0\5\1K\0\1\0\1\0\2\fnoremap\2\vsilent\2\27<Plug>(clever-f-reset)\n<esc>\6n\bset\vkeymap\25clever_f_mark_direct\24clever_f_smart_case\6g\bvim\0", "config", "clever-f.vim")
time([[Config for clever-f.vim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SwitchExtend lua require("packer.load")({'switch.vim'}, { cmd = "SwitchExtend", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SwitchReverse lua require("packer.load")({'switch.vim'}, { cmd = "SwitchReverse", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeToggle lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SymbolsOutline lua require("packer.load")({'symbols-outline.nvim'}, { cmd = "SymbolsOutline", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file VSSplitAbove lua require("packer.load")({'visual-split.vim'}, { cmd = "VSSplitAbove", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file VSSplitBelow lua require("packer.load")({'visual-split.vim'}, { cmd = "VSSplitBelow", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file MinimapToggle lua require("packer.load")({'minimap.vim'}, { cmd = "MinimapToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file AsyncTaskEdit lua require("packer.load")({'asynctasks.vim'}, { cmd = "AsyncTaskEdit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file AsyncTaskLast lua require("packer.load")({'asynctasks.vim'}, { cmd = "AsyncTaskLast", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file AsyncTaskList lua require("packer.load")({'asynctasks.vim'}, { cmd = "AsyncTaskList", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file AsyncTaskMacro lua require("packer.load")({'asynctasks.vim'}, { cmd = "AsyncTaskMacro", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file AsyncTaskProfile lua require("packer.load")({'asynctasks.vim'}, { cmd = "AsyncTaskProfile", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Fardo lua require("packer.load")({'far.vim'}, { cmd = "Fardo", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Farr lua require("packer.load")({'far.vim'}, { cmd = "Farr", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Farf lua require("packer.load")({'far.vim'}, { cmd = "Farf", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Farp lua require("packer.load")({'far.vim'}, { cmd = "Farp", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Farundo lua require("packer.load")({'far.vim'}, { cmd = "Farundo", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SnipRun lua require("packer.load")({'sniprun'}, { cmd = "SnipRun", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SnipInfo lua require("packer.load")({'sniprun'}, { cmd = "SnipInfo", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SnipClose lua require("packer.load")({'sniprun'}, { cmd = "SnipClose", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SnipReset lua require("packer.load")({'sniprun'}, { cmd = "SnipReset", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SnipTerminate lua require("packer.load")({'sniprun'}, { cmd = "SnipTerminate", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SnipReplMemoryClean lua require("packer.load")({'sniprun'}, { cmd = "SnipReplMemoryClean", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SymbolsOutlineOpen lua require("packer.load")({'symbols-outline.nvim'}, { cmd = "SymbolsOutlineOpen", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SymbolsOutlineClose lua require("packer.load")({'symbols-outline.nvim'}, { cmd = "SymbolsOutlineClose", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file CodiNew lua require("packer.load")({'codi.vim'}, { cmd = "CodiNew", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file CodiExpand lua require("packer.load")({'codi.vim'}, { cmd = "CodiExpand", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file CodiSelect lua require("packer.load")({'codi.vim'}, { cmd = "CodiSelect", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file CodiUpdate lua require("packer.load")({'codi.vim'}, { cmd = "CodiUpdate", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Cfind lua require("packer.load")({'vim-eunuch'}, { cmd = "Cfind", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Chmod lua require("packer.load")({'vim-eunuch'}, { cmd = "Chmod", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Clocate lua require("packer.load")({'vim-eunuch'}, { cmd = "Clocate", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Move lua require("packer.load")({'vim-eunuch'}, { cmd = "Move", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Remove lua require("packer.load")({'vim-eunuch'}, { cmd = "Remove", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Rename lua require("packer.load")({'vim-eunuch'}, { cmd = "Rename", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SudoEdit lua require("packer.load")({'vim-eunuch'}, { cmd = "SudoEdit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SudoWrite lua require("packer.load")({'vim-eunuch'}, { cmd = "SudoWrite", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Mkdir lua require("packer.load")({'vim-eunuch'}, { cmd = "Mkdir", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file W lua require("packer.load")({'vim-eunuch'}, { cmd = "W", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Wall lua require("packer.load")({'vim-eunuch'}, { cmd = "Wall", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Abolish lua require("packer.load")({'vim-abolish'}, { cmd = "Abolish", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Subvert lua require("packer.load")({'vim-abolish'}, { cmd = "Subvert", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file FastFoldUpdate lua require("packer.load")({'FastFold'}, { cmd = "FastFoldUpdate", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file VSSplit lua require("packer.load")({'visual-split.vim'}, { cmd = "VSSplit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TSPlaygroundToggle lua require("packer.load")({'playground'}, { cmd = "TSPlaygroundToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file VSResize lua require("packer.load")({'visual-split.vim'}, { cmd = "VSResize", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TableModeToggle lua require("packer.load")({'vim-table-mode'}, { cmd = "TableModeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file AsyncRun lua require("packer.load")({'asyncrun.vim'}, { cmd = "AsyncRun", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file AsyncStop lua require("packer.load")({'asyncrun.vim'}, { cmd = "AsyncStop", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file T lua require("packer.load")({'neoterm'}, { cmd = "T", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Tnew lua require("packer.load")({'neoterm'}, { cmd = "Tnew", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Topen lua require("packer.load")({'neoterm'}, { cmd = "Topen", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Texec lua require("packer.load")({'neoterm'}, { cmd = "Texec", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Neogit lua require("packer.load")({'neogit'}, { cmd = "Neogit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Dirbuf lua require("packer.load")({'dirbuf.nvim'}, { cmd = "Dirbuf", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Lfind lua require("packer.load")({'vim-eunuch'}, { cmd = "Lfind", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file AsyncTask lua require("packer.load")({'asynctasks.vim'}, { cmd = "AsyncTask", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Duplicate lua require("packer.load")({'vim-eunuch'}, { cmd = "Duplicate", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file F lua require("packer.load")({'far.vim'}, { cmd = "F", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Dashboard lua require("packer.load")({'dashboard-nvim'}, { cmd = "Dashboard", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Copy lua require("packer.load")({'vim-eunuch'}, { cmd = "Copy", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Delete lua require("packer.load")({'vim-eunuch'}, { cmd = "Delete", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Switch lua require("packer.load")({'switch.vim'}, { cmd = "Switch", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Far lua require("packer.load")({'far.vim'}, { cmd = "Far", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Unlink lua require("packer.load")({'vim-eunuch'}, { cmd = "Unlink", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Codi lua require("packer.load")({'codi.vim'}, { cmd = "Codi", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Refar lua require("packer.load")({'far.vim'}, { cmd = "Refar", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DashboardNewFile lua require("packer.load")({'dashboard-nvim'}, { cmd = "DashboardNewFile", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Llocate lua require("packer.load")({'vim-eunuch'}, { cmd = "Llocate", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TagbarToggle lua require("packer.load")({'tagbar'}, { cmd = "TagbarToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[noremap <silent> M<Tab> <cmd>lua require("packer.load")({'vim-highlighter'}, { keys = "M<lt>Tab>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> ma <cmd>lua require("packer.load")({'vim-bookmarks'}, { keys = "ma", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[vnoremap <silent> gL <cmd>lua require("packer.load")({'vim-lion'}, { keys = "gL", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <C-W>gsa <cmd>lua require("packer.load")({'visual-split.vim'}, { keys = "<lt>C-W>gsa", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> M<BS> <cmd>lua require("packer.load")({'vim-highlighter'}, { keys = "M<lt>BS>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <char-93><char-93> <cmd>lua require("packer.load")({'jumpy.vim'}, { keys = "<lt>char-93><lt>char-93>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> gl <cmd>lua require("packer.load")({'vim-lion'}, { keys = "gl", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> >p <cmd>lua require("packer.load")({'vim-pushover'}, { keys = ">p", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> Z <cmd>lua require("packer.load")({'FastFold'}, { keys = "Z", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> mi <cmd>lua require("packer.load")({'vim-bookmarks'}, { keys = "mi", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <p <cmd>lua require("packer.load")({'vim-pushover'}, { keys = "<lt>p", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> <C-W>gsb <cmd>lua require("packer.load")({'visual-split.vim'}, { keys = "<lt>C-W>gsb", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> >W <cmd>lua require("packer.load")({'vim-pushover'}, { keys = ">W", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <W <cmd>lua require("packer.load")({'vim-pushover'}, { keys = "<lt>W", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <w <cmd>lua require("packer.load")({'vim-pushover'}, { keys = "<lt>w", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> mc <cmd>lua require("packer.load")({'vim-bookmarks'}, { keys = "mc", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[onoremap <silent> iv <cmd>lua require("packer.load")({'vim-textobj-variable-segment'}, { keys = "iv", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> mx <cmd>lua require("packer.load")({'vim-bookmarks'}, { keys = "mx", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[vnoremap <silent> g<C-x> <cmd>lua require("packer.load")({'dial.nvim'}, { keys = "g<lt>C-x>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <C-x> <cmd>lua require("packer.load")({'dial.nvim'}, { keys = "<lt>C-x>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[vnoremap <silent> g<C-a> <cmd>lua require("packer.load")({'dial.nvim'}, { keys = "g<lt>C-a>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[vnoremap <silent> <C-x> <cmd>lua require("packer.load")({'dial.nvim'}, { keys = "<lt>C-x>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[vnoremap <silent> <C-a> <cmd>lua require("packer.load")({'dial.nvim'}, { keys = "<lt>C-a>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <C-a> <cmd>lua require("packer.load")({'dial.nvim'}, { keys = "<lt>C-a>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> mg <cmd>lua require("packer.load")({'vim-bookmarks'}, { keys = "mg", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> [[ <cmd>lua require("packer.load")({'jumpy.vim'}, { keys = "[[", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[vnoremap <silent> a<space> <cmd>lua require("packer.load")({'vim-textobj-blanklines'}, { keys = "a<lt>space>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> cr <cmd>lua require("packer.load")({'vim-abolish'}, { keys = "cr", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[onoremap <silent> a<space> <cmd>lua require("packer.load")({'vim-textobj-blanklines'}, { keys = "a<lt>space>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> gJ <cmd>lua require("packer.load")({'splitjoin.vim'}, { keys = "gJ", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[vnoremap <silent> i<space> <cmd>lua require("packer.load")({'vim-textobj-blanklines'}, { keys = "i<lt>space>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[onoremap <silent> i<space> <cmd>lua require("packer.load")({'vim-textobj-blanklines'}, { keys = "i<lt>space>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[vnoremap <silent> iv <cmd>lua require("packer.load")({'vim-textobj-variable-segment'}, { keys = "iv", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[vnoremap <silent> av <cmd>lua require("packer.load")({'vim-textobj-variable-segment'}, { keys = "av", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[onoremap <silent> av <cmd>lua require("packer.load")({'vim-textobj-variable-segment'}, { keys = "av", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> <C-W>gss <cmd>lua require("packer.load")({'visual-split.vim'}, { keys = "<lt>C-W>gss", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> <C-W>gsa <cmd>lua require("packer.load")({'visual-split.vim'}, { keys = "<lt>C-W>gsa", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[vnoremap <silent> gl <cmd>lua require("packer.load")({'vim-lion'}, { keys = "gl", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <C-W>gsb <cmd>lua require("packer.load")({'visual-split.vim'}, { keys = "<lt>C-W>gsb", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> mkk <cmd>lua require("packer.load")({'vim-bookmarks'}, { keys = "mkk", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> >w <cmd>lua require("packer.load")({'vim-pushover'}, { keys = ">w", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> mn <cmd>lua require("packer.load")({'vim-bookmarks'}, { keys = "mn", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <C-W>gr <cmd>lua require("packer.load")({'visual-split.vim'}, { keys = "<lt>C-W>gr", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> o <cmd>lua require("packer.load")({'bullets.vim'}, { keys = "o", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> mp <cmd>lua require("packer.load")({'vim-bookmarks'}, { keys = "mp", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> gs <cmd>lua require("packer.load")({'switch.vim'}, { keys = "gs", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> gL <cmd>lua require("packer.load")({'vim-lion'}, { keys = "gL", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> mm <cmd>lua require("packer.load")({'vim-bookmarks'}, { keys = "mm", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> M<C-l> <cmd>lua require("packer.load")({'vim-highlighter'}, { keys = "M<lt>C-l>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> mjj <cmd>lua require("packer.load")({'vim-bookmarks'}, { keys = "mjj", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <C-W>gss <cmd>lua require("packer.load")({'visual-split.vim'}, { keys = "<lt>C-W>gss", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> M<CR> <cmd>lua require("packer.load")({'vim-highlighter'}, { keys = "M<lt>CR>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> <C-W>gr <cmd>lua require("packer.load")({'visual-split.vim'}, { keys = "<lt>C-W>gr", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> gR <cmd>lua require("packer.load")({'splitjoin.vim'}, { keys = "gR", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType html ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "html" }, _G.packer_plugins)]]
vim.cmd [[au FileType fish ++once lua require("packer.load")({'cmp-fish'}, { ft = "fish" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au User isfolded ++once lua require("packer.load")({'FastFold', 'pretty-fold.nvim'}, { event = "User isfolded" }, _G.packer_plugins)]]
vim.cmd [[au User regexplainer ++once lua require("packer.load")({'nvim-regexplainer'}, { event = "User regexplainer" }, _G.packer_plugins)]]
vim.cmd [[au User autotag ++once lua require("packer.load")({'nvim-ts-autotag'}, { event = "User autotag" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
