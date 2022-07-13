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
  CycleColor = {
    commands = { "CycleColorNext", "CycleColorPrev", "CycleColorRefresh" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/CycleColor",
    url = "https://github.com/vim-scripts/CycleColor"
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
  ["JABS.nvim"] = {
    config = { 'require"jabs".setup{}' },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/JABS.nvim",
    url = "https://github.com/matbme/JABS.nvim"
  },
  LuaSnip = {
    config = { 'require("config.snip")' },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["NeoNoName.lua"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/NeoNoName.lua",
    url = "https://github.com/nyngwang/NeoNoName.lua"
  },
  ["Shade.nvim"] = {
    config = { 'require"shade".setup{}' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/Shade.nvim",
    url = "https://github.com/sunjon/Shade.nvim"
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
    config = { "\27LJ\2\n…\4\0\0\a\0\25\00066\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\0016\1\3\0009\1\4\0019\1\5\1'\3\6\0'\4\a\0009\5\b\0005\6\t\0B\1\5\0016\1\3\0009\1\4\0019\1\5\1'\3\6\0'\4\n\0009\5\v\0005\6\f\0B\1\5\0016\1\3\0009\1\4\0019\1\5\1'\3\6\0'\4\r\0009\5\14\0005\6\15\0B\1\5\0016\1\3\0009\1\4\0019\1\5\1'\3\6\0'\4\16\0009\5\17\0005\6\18\0B\1\5\0016\1\3\0009\1\4\0019\1\5\1'\3\6\0'\4\19\0009\5\20\0005\6\21\0B\1\5\0016\1\3\0009\1\4\0019\1\5\1'\3\6\0'\4\22\0'\5\23\0005\6\24\0B\1\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\22Telescope attempt\15<leader>al\1\0\2\vsilent\2\fnoremap\2\15rename_buf\15<leader>ac\1\0\2\vsilent\2\fnoremap\2\15delete_buf\15<leader>ad\1\0\2\vsilent\2\fnoremap\2\brun\15<leader>ar\1\0\2\vsilent\2\fnoremap\2\18new_input_ext\15<leader>ai\1\0\2\vsilent\2\fnoremap\2\15new_select\15<leader>an\6n\bset\vkeymap\bvim\nsetup\fattempt\frequire\0" },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/attempt.nvim",
    url = "https://github.com/m-demare/attempt.nvim"
  },
  ["base16-vim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/base16-vim",
    url = "https://github.com/base16-project/base16-vim"
  },
  ["bookmarks.nvim"] = {
    config = { 'require"bookmarks".setup{}' },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/bookmarks.nvim",
    url = "https://github.com/crusj/bookmarks.nvim"
  },
  ["bufdelete.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/bufdelete.nvim",
    url = "https://github.com/famiu/bufdelete.nvim"
  },
  ["bullets.vim"] = {
    config = { "\27LJ\2\ng\0\0\2\0\5\0\t6\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\4\0K\0\1\0\25bullets_set_mappings\1\2\0\0\6*\31bullets_enabled_file_types\6g\bvim\0" },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/bullets.vim",
    url = "https://github.com/dkarter/bullets.vim"
  },
  ["calendar-vim"] = {
    commands = { "Calender", "CalenderH", "CalenderT", "CalenderVT" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/calendar-vim",
    url = "https://github.com/mattn/calendar-vim"
  },
  ["chartoggle.nvim"] = {
    config = { "require\"chartoggle\".setup{\n  keys = { \"}\", \"'\", \")\", \"--\", \"#\" },\n  leader = \"\\\\\"\n}" },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/chartoggle.nvim",
    url = "https://github.com/saifulapm/chartoggle.nvim"
  },
  ["clever-f.vim"] = {
    config = { "\27LJ\2\n¸\1\0\0\6\0\n\0\0176\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\0\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0005\5\t\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\27<Plug>(clever-f-reset)\n<esc>\6n\bset\vkeymap\25clever_f_mark_direct\24clever_f_smart_case\6g\bvim\0" },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/clever-f.vim",
    url = "https://github.com/rhysd/clever-f.vim"
  },
  ["clipboard-image.nvim"] = {
    config = { "\27LJ\2\n]\0\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\2\vnowait\2\vsilent\2\15:PasteImg\r\a\\p\6n\bset\vkeymap\bvim\0" },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/clipboard-image.nvim",
    url = "https://github.com/ekickx/clipboard-image.nvim"
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
  ["cmp-fish"] = {
    after_files = { "/home/user/.local/share/nvim/site/pack/packer/opt/cmp-fish/after/plugin/cmp_fish.lua" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/cmp-fish",
    url = "https://github.com/mtoohey31/cmp-fish"
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
  ["color-picker.nvim"] = {
    config = { 'require("color-picker")' },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/color-picker.nvim",
    url = "https://github.com/ziontee113/color-picker.nvim"
  },
  ["colortils.nvim"] = {
    config = { 'require"colortils".setup{}' },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/colortils.nvim",
    url = "https://github.com/nvim-colortils/colortils.nvim"
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
    config = { "\27LJ\2\nþ\3\0\0\a\0\23\0I6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0006\4\5\0'\6\6\0B\4\2\0029\4\a\4B\4\1\0025\5\b\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\t\0006\4\5\0'\6\6\0B\4\2\0029\4\n\4B\4\1\0025\5\v\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\f\0'\3\4\0006\4\5\0'\6\6\0B\4\2\0029\4\r\4B\4\1\0025\5\14\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\f\0'\3\t\0006\4\5\0'\6\6\0B\4\2\0029\4\15\4B\4\1\0025\5\16\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\f\0'\3\17\0006\4\5\0'\6\6\0B\4\2\0029\4\18\4B\4\1\0025\5\19\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\f\0'\3\20\0006\4\5\0'\6\6\0B\4\2\0029\4\21\4B\4\1\0025\5\22\0B\0\5\1K\0\1\0\1\0\1\fnoremap\2\16dec_gvisual\vg<C-x>\1\0\1\fnoremap\2\16inc_gvisual\vg<C-a>\1\0\1\fnoremap\2\15dec_visual\1\0\1\fnoremap\2\15inc_visual\6v\1\0\1\fnoremap\2\15dec_normal\n<C-x>\1\0\1\fnoremap\2\15inc_normal\rdial.map\frequire\n<C-a>\6n\20nvim_set_keymap\bapi\bvim\0" },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/dial.nvim",
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
  firenvim = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/firenvim",
    url = "https://github.com/glacambre/firenvim"
  },
  ["focus.nvim"] = {
    config = { 'require"focus".setup{\n  autoresize = false\n}' },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/focus.nvim",
    url = "https://github.com/beauwilliams/focus.nvim"
  },
  ["fold-cycle.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/fold-cycle.nvim",
    url = "https://github.com/jghauser/fold-cycle.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    commands = { "Gitsigns" },
    config = { 'require"gitsigns".setup{}' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["gruvbox-baby"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/gruvbox-baby",
    url = "https://github.com/luisiacc/gruvbox-baby"
  },
  ["gruvbox-material.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/gruvbox-material.nvim",
    url = "https://github.com/wittyjudge/gruvbox-material.nvim"
  },
  ["gruvbox.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/gruvbox.nvim",
    url = "https://github.com/ellisonleao/gruvbox.nvim"
  },
  ["gv.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/gv.vim",
    url = "https://github.com/junegunn/gv.vim"
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
  ["hydra.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/hydra.nvim",
    url = "https://github.com/anuvyklack/hydra.nvim"
  },
  ["hydrangea-vim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/hydrangea-vim",
    url = "https://github.com/yuttie/hydrangea-vim"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["iswap.nvim"] = {
    config = { "\27LJ\2\nn\0\0\5\0\b\0\0156\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0B\0\4\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\6\0'\4\a\0B\0\4\1K\0\1\0\f:ISwap\r\agH\16:ISwapWith\r\agh\6n\bset\vkeymap\bvim\0" },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/iswap.nvim",
    url = "https://github.com/mizlan/iswap.nvim"
  },
  ["jumpy.vim"] = {
    keys = { { "", "[[" }, { "", "<char-93><char-93>" }, { "", "g]" }, { "", "g[" } },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/jumpy.vim",
    url = "https://github.com/arp242/jumpy.vim"
  },
  ["lazylist.vim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/lazylist.vim",
    url = "https://github.com/kabbamine/lazylist.vim"
  },
  ["leap.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/leap.nvim",
    url = "https://github.com/ggandor/leap.nvim"
  },
  ["lists.vim"] = {
    config = { "\27LJ\2\n7\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\2\0\0\6*\20lists_filetypes\6g\bvim\0" },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/lists.vim",
    url = "https://github.com/lervag/lists.vim"
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
  ["lualine.nvim"] = {
    config = { 'require"lualine".setup{\n  options = {\n    theme = "powerline"\n  }\n}' },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["matchparen.nvim"] = {
    config = { 'require"matchparen".setup{}' },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/matchparen.nvim",
    url = "https://github.com/monkoose/matchparen.nvim"
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
    url = "https://github.com/muniftanjim/nui.nvim"
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
    config = { "\27LJ\2\n›\3\0\0\f\0\21\0-6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0005\4\5\0005\5\4\0=\5\6\4=\4\a\3B\1\2\0016\1\0\0'\3\b\0B\1\2\0029\2\t\0\18\4\1\0'\6\n\0'\a\n\0'\b\v\0B\4\4\0A\2\0\0016\2\0\0'\4\f\0B\2\2\0029\3\t\0\18\5\1\0'\a\r\0'\b\r\0'\t\14\0B\5\4\2\18\a\5\0009\5\15\0059\b\16\2'\n\17\0)\vÿÿB\b\3\0A\5\1\0A\3\0\0019\3\t\0\18\5\1\0'\a\18\0'\b\19\0005\t\20\0B\5\4\0A\3\0\1K\0\1\0\1\t\0\0\6c\bcpp\tjava\15javascript\trust\bphp\fhaskell\ago\a*/\a/*\v[[]=*$\17before_regex\14with_pair\blua\6=\25nvim-autopairs.conds\vpython\b'''\radd_rule\24nvim-autopairs.rule\14fast_wrap\nchars\1\0\0\1\a\0\0\6{\6[\6(\6\"\6'\6`\1\0\1\vmap_cr\1\nsetup\19nvim-autopairs\frequire\0" },
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
  ["nvim-editcommand"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/nvim-editcommand",
    url = "https://github.com/brettanomyces/nvim-editcommand"
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
  ["nvim-hlslens"] = {
    config = { "\27LJ\2\ná\4\0\0\6\0\21\00016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\3\0'\4\4\0005\5\5\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\6\0'\4\a\0005\5\b\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\t\0'\4\n\0005\5\v\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\f\0'\4\r\0005\5\14\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\15\0'\4\16\0005\5\17\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\18\0'\4\19\0005\5\20\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2.g#<Cmd>lua require('hlslens').start()<CR>\ag#\1\0\2\vsilent\2\fnoremap\2.g*<Cmd>lua require('hlslens').start()<CR>\ag*\1\0\2\vsilent\2\fnoremap\2-#<Cmd>lua require('hlslens').start()<CR>\6#\1\0\2\vsilent\2\fnoremap\2-*<Cmd>lua require('hlslens').start()<CR>\6*\1\0\2\vsilent\2\fnoremap\2-N<Cmd>lua require('hlslens').start()<CR>\6N\1\0\2\vsilent\2\fnoremap\2-n<Cmd>lua require('hlslens').start()<CR>\6n\20nvim_set_keymap\bapi\bvim\0" },
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
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
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
    config = { "\27LJ\2\n|\0\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2(:lua require(\"nvim-window\").pick()\r\f<C-w>g \6n\bset\vkeymap\bvim\0" },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/nvim-window",
    url = "https://gitlab.com/yorickpeterse/nvim-window"
  },
  nvim_context_vt = {
    config = { 'require"nvim_context_vt".setup{}' },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/nvim_context_vt",
    url = "https://github.com/haringsrob/nvim_context_vt"
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
  ["project.nvim"] = {
    config = { 'require"project_nvim".setup{\n  manual_mode = true\n}' },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/project.nvim",
    url = "https://github.com/ahmedkhalf/project.nvim"
  },
  ["range-highlight.nvim"] = {
    config = { 'require"range-highlight".setup{}' },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/range-highlight.nvim",
    url = "https://github.com/winston0410/range-highlight.nvim"
  },
  ["reach.nvim"] = {
    config = { 'require"reach".setup{}' },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/reach.nvim",
    url = "https://github.com/toppair/reach.nvim"
  },
  ["readline.nvim"] = {
    config = { "\27LJ\2\nð\3\0\0\6\0\24\0C6\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\6\0009\5\a\0B\1\4\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\b\0009\5\t\0B\1\4\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\n\0009\5\v\0B\1\4\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\f\0009\5\r\0B\1\4\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\14\0009\5\15\0B\1\4\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\16\0009\5\17\0B\1\4\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\18\0009\5\19\0B\1\4\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\20\0009\5\21\0B\1\4\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\22\0009\5\23\0B\1\4\1K\0\1\0\23backward_kill_line\n<C-u>\14kill_line\n<C-k>\21unix_word_rubout\n<C-w>\23backward_kill_word\v<M-BS>\14kill_word\n<M-d>\16end_of_line\n<C-e>\22beginning_of_line\n<C-a>\18backward_word\n<M-b>\17forward_word\n<M-f>\6!\bset\vkeymap\bvim\rreadline\frequire\0" },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/readline.nvim",
    url = "https://github.com/linty-org/readline.nvim"
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
  ["renamer.nvim"] = {
    config = { "\27LJ\2\n˜\1\0\0\5\0\n\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0009\0\5\0009\0\6\0'\2\a\0'\3\b\0'\4\t\0B\0\4\1K\0\1\0$:lua require\"renamer\".rename()\r\agr\6n\bset\vkeymap\bvim\1\0\1\15with_popup\1\nsetup\frenamer\frequire\0" },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/renamer.nvim",
    url = "https://github.com/filipdutescu/renamer.nvim"
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
  ["sort.nvim"] = {
    config = { 'require"sort".setup{}' },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/sort.nvim",
    url = "https://github.com/sQVe/sort.nvim"
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
    config = { "\27LJ\2\n\\\0\0\3\1\2\0\5-\0\0\0009\0\0\0005\2\1\0B\0\2\1K\0\1\0\0À\1\4\0\0\rfunction\20arrrow_function\24function_definition\18targeted_jumph\0\0\3\1\2\0\5-\0\0\0009\0\0\0005\2\1\0B\0\2\1K\0\1\0\0À\1\5\0\0\17if_statement\16else_clause\19else_statement\21elseif_statement\18targeted_jump^\0\0\3\1\2\0\5-\0\0\0009\0\0\0005\2\1\0B\0\2\1K\0\1\0\0À\1\4\0\0\18for_statement\20while_statement\21switch_statement\18targeted_jumpD\0\0\3\1\2\0\5-\0\0\0009\0\0\0005\2\1\0B\0\2\1K\0\1\0\0À\1\2\0\0\25variable_declaration\18targeted_jump6\0\0\3\1\2\0\5-\0\0\0009\0\0\0005\2\1\0B\0\2\1K\0\1\0\0À\1\2\0\0\vstring\18targeted_jump6\0\0\3\1\2\0\5-\0\0\0009\0\0\0005\2\1\0B\0\2\1K\0\1\0\0À\1\2\0\0\vineger\18targeted_jump \1\0\0\3\1\2\0\5-\0\0\0009\0\0\0005\2\1\0B\0\2\1K\0\1\0\0À\1\t\0\0\rfunction\17if_statement\16else_clause\19else_statement\21elseif_statement\18for_statement\20while_statement\21switch_statement\18targeted_jump7\0\0\4\1\2\0\6-\0\0\0009\0\0\0'\2\1\0+\3\2\0B\0\3\1K\0\1\0\0À\fdefault\18filtered_jump7\0\0\4\1\2\0\6-\0\0\0009\0\0\0'\2\1\0+\3\1\0B\0\3\1K\0\1\0\0À\fdefault\18filtered_jump¶\19\1\0\a\0W\0å\0016\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\6\0'\5\a\0005\6\b\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\t\0'\5\n\0005\6\v\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\f\0'\4\r\0'\5\14\0005\6\15\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\f\0'\4\16\0'\5\17\0005\6\18\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\f\0'\4\19\0'\5\20\0005\6\21\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\f\0'\4\22\0'\5\23\0005\6\24\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\f\0'\4\25\0'\5\26\0005\6\27\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\f\0'\4\28\0'\5\29\0005\6\30\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\f\0'\4\31\0'\5 \0005\6!\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\f\0'\4\"\0'\5#\0005\6$\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\f\0'\4%\0'\5&\0005\6'\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\f\0'\4(\0'\5)\0005\6*\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4%\0'\5+\0005\6,\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4(\0'\5-\0005\6.\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\f\0'\4/\0'\0050\0005\0061\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\f\0'\0042\0'\0053\0005\0064\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4/\0'\0055\0005\0066\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\0042\0'\0057\0005\0068\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\0049\0'\5:\0005\6;\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4<\0003\5=\0005\6>\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4?\0003\5@\0005\6A\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4B\0003\5C\0005\6D\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4E\0003\5F\0005\6G\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4H\0003\5I\0005\6J\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4K\0003\5L\0005\6M\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4N\0003\5O\0005\6P\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4Q\0003\5R\0005\6S\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4T\0003\5U\0005\6V\0B\1\5\0012\0\0€K\0\1\0\1\0\2\vsilent\2\fnoremap\2\0\n<A-P>\1\0\2\vsilent\2\fnoremap\2\0\n<A-N>\1\0\2\vsilent\2\fnoremap\2\0\bgfa\1\0\2\vsilent\2\fnoremap\2\0\bgfi\1\0\2\vsilent\2\fnoremap\2\0\bgfs\1\0\2\vsilent\2\fnoremap\2\0\bgfv\1\0\2\vsilent\2\fnoremap\2\0\bgfo\1\0\2\vsilent\2\fnoremap\2\0\bgfe\1\0\2\vsilent\2\fnoremap\2\0\bgfu\1\0\2\vsilent\2\fnoremap\2y:lua require(\"syntax-tree-surfer\").go_to_top_node_and_execute_commands(false,{\"normal!O\",\"normal!O\",\"startinsert\"})\r\n<C-o>\1\0\2\vsilent\2\fnoremap\2\23<Plug>GoNDLineDown\1\0\2\vsilent\2\fnoremap\2\21<Plug>GoNDLineUp\1\0\2\vsilent\2\fnoremap\2\23<Plug>GoVDLineDown\f<A-S-j>\1\0\2\vsilent\2\fnoremap\2\21<Plug>GoVDLineUp\f<A-S-k>\1\0\2\vsilent\2\fnoremap\2\23<Plug>GoNMLineDown\1\0\2\vsilent\2\fnoremap\2\21<Plug>GoNMLineUp\1\0\2\vsilent\2\fnoremap\2\23<Plug>GoVMLineDown\n<A-j>\1\0\2\vsilent\2\fnoremap\2\21<Plug>GoVMLineUp\n<A-k>\1\0\3\texpr\2\fnoremap\2\vsilent\2*mode()==\"<C-v>\"?\"<Plug>GoVSDRight\":\"\"\f<C-S-l>\1\0\3\texpr\2\fnoremap\2\vsilent\2)mode()==\"<C-v>\"?\"<Plug>GoVSDLeft\":\"\"\f<C-S-h>\1\0\3\texpr\2\fnoremap\2\vsilent\2>mode()==\"<C-v>\"?\"<Plug>GoVSDUp\":\"<cmd>STSSwapPrevVisual\r\"\f<C-S-k>\1\0\3\texpr\2\fnoremap\2\vsilent\2@mode()==\"<C-v>\"?\"<Plug>GoVSDDown\":\"<cmd>STSSwapNextVisual\r\"\f<C-S-j>\1\0\3\texpr\2\fnoremap\2\vsilent\2Bmode()==\"<C-v>\"?\"<Plug>GoVSMRight\":\"<cmd>STSSelectChildNode\r\"\n<C-l>\1\0\3\texpr\2\fnoremap\2\vsilent\2Bmode()==\"<C-v>\"?\"<Plug>GoVSMLeft\":\"<cmd>STSSelectParentNode\r\"\n<C-h>\1\0\3\texpr\2\fnoremap\2\vsilent\2Emode()==\"<C-v>\"?\"<Plug>GoVSMUp\":\"<cmd>STSSelectPrevSiblingNode\r\"\n<C-k>\1\0\3\texpr\2\fnoremap\2\vsilent\2Gmode()==\"<C-v>\"?\"<Plug>GoVSMDown\":\"<cmd>STSSelectNextSiblingNode\r\"\n<C-j>\6x\1\0\2\vsilent\2\fnoremap\2\31<cmd>STSSelectCurrentNode\r\avn\1\0\2\vsilent\2\fnoremap\2\30<cmd>STSSelectMasterNode\r\avx\6n\bset\vkeymap\bvim\23syntax-tree-surfer\frequire\0" },
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
  tagbar = {
    commands = { "TagbarToggle" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/tagbar",
    url = "https://github.com/majutsushi/tagbar"
  },
  ["targets.vim"] = {
    keys = { { "o", "i" }, { "x", "i" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/targets.vim",
    url = "https://github.com/wellle/targets.vim"
  },
  ["telescope-changed-files"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/telescope-changed-files",
    url = "https://github.com/axkirillov/telescope-changed-files"
  },
  ["telescope-changes.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/telescope-changes.nvim",
    url = "https://github.com/linarcx/telescope-changes.nvim"
  },
  ["telescope-luasnip.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/telescope-luasnip.nvim",
    url = "https://github.com/benfowler/telescope-luasnip.nvim"
  },
  ["telescope-ports.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/telescope-ports.nvim",
    url = "https://github.com/linarcx/telescope-ports.nvim"
  },
  ["telescope-software-licenses.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/telescope-software-licenses.nvim",
    url = "https://github.com/chip/telescope-software-licenses.nvim"
  },
  ["telescope-symbols.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/telescope-symbols.nvim",
    url = "https://github.com/nvim-telescope/telescope-symbols.nvim"
  },
  ["telescope-vim-bookmarks.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/telescope-vim-bookmarks.nvim",
    url = "https://github.com/tom-anders/telescope-vim-bookmarks.nvim"
  },
  ["telescope-zoxide"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/telescope-zoxide",
    url = "https://github.com/jvgrootveld/telescope-zoxide"
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
  ["tokyonight-vim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/tokyonight-vim",
    url = "https://github.com/ghifarit53/tokyonight-vim"
  },
  ["trouble.nvim"] = {
    config = { 'require"trouble".setup{}' },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
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
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/vim-abolish",
    url = "https://github.com/tpope/vim-abolish"
  },
  ["vim-better-whitespace"] = {
    config = { "\27LJ\2\n]\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\4\0\0\14dashboard\aqf\tterm*better_whitespace_filetypes_blacklist\6g\bvim\0" },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/vim-better-whitespace",
    url = "https://github.com/ntpeters/vim-better-whitespace"
  },
  ["vim-bookmarks"] = {
    keys = { { "", "mg" }, { "", "mjj" }, { "", "mkk" }, { "", "mx" }, { "", "mc" }, { "", "mp" }, { "", "mn" }, { "", "mi" }, { "", "mm" }, { "", "ma" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-bookmarks",
    url = "https://github.com/mattesgroeger/vim-bookmarks"
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
  ["vim-cursorword"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/vim-cursorword",
    url = "https://github.com/itchyny/vim-cursorword"
  },
  ["vim-cycle"] = {
    config = { "\27LJ\2\nª\1\0\0\5\0\n\0\0196\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\3\0009\0\4\0'\2\5\0'\3\6\0'\4\a\0B\0\4\0016\0\0\0009\0\3\0009\0\4\0'\2\5\0'\3\b\0'\4\t\0B\0\4\1K\0\1\0\24<Plug>CyclePrevious\vg<C-x>\20<Plug>CycleNext\vg<C-a>\6n\bset\vkeymap\22cycle_no_mappings\6g\bvim\0" },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/vim-cycle",
    url = "https://github.com/zef/vim-cycle"
  },
  ["vim-devdocs"] = {
    config = { "\27LJ\2\nX\0\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\t:DD\r\agD\6n\bset\vkeymap\bvim\0" },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/vim-devdocs",
    url = "https://github.com/romainl/vim-devdocs"
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
  ["vim-fugitive"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-gitgutter"] = {
    commands = { "GitGutter", "GitGutterAll", "GitGutterBufferDisable", "GitGutterBufferEnable", "GitGutterBufferToggle", "GitGutterDebug", "GitGutterDiffOrig", "GitGutterDisable", "GitGutterEnable", "GitGutterFold", "GitGutterLineHighlightsDisable", "GitGutterLineHighlightsEnable", "GitGutterLineHighlightsToggle", "GitGutterLineNrHighlightsDisable", "GitGutterLineNrHighlightsEnable", "GitGutterLineNrHighlightsToggle", "GitGutterNextHunk", "GitGutterPrevHunk", "GitGutterPreviewHunk", "GitGutterQuickFix", "GitGutterQuickFixCurrentFile", "GitGutterSignsDisable", "GitGutterSignsEnable", "GitGutterSignsToggle", "GitGutterStageHunk", "GitGutterToggle", "GitGutterUndoHunk" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-gitgutter",
    url = "https://github.com/airblade/vim-gitgutter"
  },
  ["vim-highlighter"] = {
    keys = { { "", "M<CR>" }, { "", "M<BS>" }, { "", "M<C-l>" }, { "", "M<Tab>" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-highlighter",
    url = "https://github.com/azabiong/vim-highlighter"
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
  ["vim-instant-markdown"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-instant-markdown",
    url = "https://github.com/suan/vim-instant-markdown"
  },
  ["vim-lion"] = {
    keys = { { "v", "gl" }, { "n", "gl" }, { "v", "gL" }, { "n", "gL" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-lion",
    url = "https://github.com/tommcdo/vim-lion"
  },
  ["vim-mundo"] = {
    commands = { "MundoToggle" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-mundo",
    url = "https://github.com/simnalamburt/vim-mundo"
  },
  ["vim-numbers"] = {
    config = { "\27LJ\2\n”\2\0\0\6\0\14\0%6\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\3\0009\0\4\0'\2\5\0'\3\6\0'\4\a\0005\5\b\0B\0\5\0016\0\0\0009\0\3\0009\0\4\0'\2\t\0'\3\6\0'\4\a\0005\5\n\0B\0\5\0016\0\0\0009\0\3\0009\0\4\0'\2\5\0'\3\v\0'\4\a\0005\5\f\0B\0\5\0016\0\0\0009\0\3\0009\0\4\0'\2\t\0'\3\v\0'\4\a\0005\5\r\0B\0\5\1K\0\1\0\1\0\1\vsilent\2\1\0\1\vsilent\2\ain\1\0\1\vsilent\2\6o\1\0\1\vsilent\2\26<Plug>(VselectNumber)\aan\6v\bset\vkeymap numbers#enable_text_objects\6g\bvim\0" },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/vim-numbers",
    url = "https://github.com/MisanthropicBit/vim-numbers"
  },
  ["vim-pushover"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/vim-pushover",
    url = "https://github.com/D4KU/vim-pushover"
  },
  ["vim-python-docstring"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/vim-python-docstring",
    url = "https://github.com/pixelneo/vim-python-docstring"
  },
  ["vim-qf"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/vim-qf",
    url = "https://github.com/romainl/vim-qf"
  },
  ["vim-quickui"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/vim-quickui",
    url = "https://github.com/skywind3000/vim-quickui"
  },
  ["vim-rainbow-lists"] = {
    config = { "\27LJ\2\n`\0\0\4\0\5\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0005\3\4\0B\0\3\1K\0\1\0\1\0\1\fcommand\17RBListEnable\rFileType\24nvim_create_autocmd\bapi\bvim\0" },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/vim-rainbow-lists",
    url = "https://github.com/lervag/vim-rainbow-lists"
  },
  ["vim-repeat"] = {
    config = { "\27LJ\2\n_\0\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\1\vsilent\2\22<Plug>(RepeatDot)\n<C-.>\6n\bset\vkeymap\bvim\0" },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-rooter"] = {
    commands = { "Rooter", "RooterToggle" },
    config = { "\27LJ\2\n4\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0\23rooter_manual_only\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-rooter",
    url = "https://github.com/airblade/vim-rooter"
  },
  ["vim-surround"] = {
    keys = { { "n", "ds" }, { "n", "cs" }, { "n", "cS" }, { "n", "ys" }, { "n", "yS" }, { "n", "yss" }, { "n", "ySs" }, { "n", "ySS" }, { "n", "gS" }, { "", "<C-S>" }, { "", "<C-G>s" }, { "", "<C-G>S" }, { "", "<Plug>VSurround" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-table-mode"] = {
    commands = { "TableModeToggle" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-table-mode",
    url = "https://github.com/dhruvasagar/vim-table-mode"
  },
  ["vim-textobj-anyblock"] = {
    keys = { { "o", "ib" }, { "v", "ib" }, { "o", "ab" }, { "v", "ab" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-textobj-anyblock",
    url = "https://github.com/rhysd/vim-textobj-anyblock"
  },
  ["vim-textobj-blanklines"] = {
    keys = { { "o", "i " }, { "v", "i " }, { "o", "a " }, { "v", "a " } },
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
  ["vim-translator"] = {
    config = { 'require("config.translator")' },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/vim-translator",
    url = "https://github.com/voldikss/vim-translator"
  },
  ["vim-visual-multi"] = {
    keys = { { "", "<C-S-n>" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-visual-multi",
    url = "https://github.com/mg979/vim-visual-multi"
  },
  ["vim-windowswap"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/vim-windowswap",
    url = "https://github.com/wesQ3/vim-windowswap"
  },
  ["vimconflive2021-colorscheme"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/vimconflive2021-colorscheme",
    url = "https://github.com/vim-conf-live/vimconflive2021-colorscheme"
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
  ["visualmark-nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/visualmark-nvim",
    url = "https://github.com/nagy135/visualmark-nvim"
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
    config = { "\27LJ\2\nè\1\0\0\f\0\14\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\3\0005\2\4\0B\0\2\4H\3\14€6\5\5\0009\5\6\0059\5\a\5'\a\b\0'\b\t\0\18\t\3\0'\n\n\0&\b\n\b'\t\v\0\18\n\4\0'\v\f\0&\t\v\t5\n\r\0B\5\5\1F\3\3\3R\3ð\127K\0\1\0\1\0\2\vsilent\2\fnoremap\2\6\r\15:WinShift \6>\n<C-S-\6n\bset\vkeymap\bvim\1\0\4\6l\nright\6h\tleft\6k\aup\6j\tdown\npairs\nsetup\rwinshift\frequire\0" },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/winshift.nvim",
    url = "https://github.com/sindrets/winshift.nvim"
  },
  ["yanky.nvim"] = {
    config = { "\27LJ\2\nø\3\0\0\5\0\23\0E6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0B\0\4\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\t\0'\4\n\0B\0\4\0016\0\3\0009\0\4\0009\0\5\0'\2\v\0'\3\a\0'\4\b\0B\0\4\0016\0\3\0009\0\4\0009\0\5\0'\2\v\0'\3\t\0'\4\n\0B\0\4\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\f\0'\4\r\0B\0\4\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\14\0'\4\15\0B\0\4\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\16\0'\4\17\0B\0\4\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\18\0'\4\19\0B\0\4\0016\0\0\0'\2\20\0B\0\2\0029\0\21\0'\2\22\0B\0\2\1K\0\1\0\17yank_history\19load_extension\14telescope\r:rshada\r\n<C-n>\r:wshada\r\n<C-p>\31<Plug>(YankyCycleBackward)\n<A-P>\30<Plug>(YankyCycleForward)\n<A-p>\6x\27<Plug>(YankyPutBefore)\6P\26<Plug>(YankyPutAfter)\6p\6n\bset\vkeymap\bvim\nsetup\nyanky\frequire\0" },
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
local module_lazy_loads = {
  ["^shade"] = "Shade.nvim"
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
-- Setup for: nvim-regexplainer
time([[Setup for nvim-regexplainer]], true)
try_loadstring("\27LJ\2\n­\2\0\0\4\0\6\0\b6\0\0\0009\0\1\0009\0\2\0'\2\3\0005\3\4\0B\0\3\0027\0\5\0K\0\1\0\17REGEXPLAINER\1\0\1\fcommandÉ\1lua local a,_=require\"regexplainer.utils.treesitter\".get_regexp_pattern_at_cursor() if a then vim.api.nvim_del_autocmd(REGEXPLAINER) vim.api.nvim_exec_autocmds(\"User\",{pattern=\"regexplainer\"}) end\16CursorMoved\24nvim_create_autocmd\bapi\bvim\0", "setup", "nvim-regexplainer")
time([[Setup for nvim-regexplainer]], false)
-- Setup for: dashboard-nvim
time([[Setup for dashboard-nvim]], true)
try_loadstring("\27LJ\2\n{\0\0\3\0\a\2\0186\0\0\0009\0\1\0009\0\2\0B\0\1\2\t\0\0\0X\0\v€6\0\0\0009\0\1\0009\0\3\0'\2\4\0B\0\2\2\t\0\1\0X\0\4€6\0\0\0009\0\5\0'\2\6\0B\0\2\1K\0\1\0\14Dashboard\bcmd\6$\14line2byte\targc\afn\bvim\0þÿÿÿ\31]\1\0\5\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0005\3\5\0003\4\4\0=\4\6\3B\0\3\1K\0\1\0\rcallback\1\0\0\0\rVimenter\24nvim_create_autocmd\bapi\bvim\0", "setup", "dashboard-nvim")
time([[Setup for dashboard-nvim]], false)
-- Setup for: FastFold
time([[Setup for FastFold]], true)
try_loadstring("\27LJ\2\nÍ\1\0\0\b\1\n\0\25-\0\0\0009\0\0\0-\2\0\0009\2\1\2)\4\1\0-\5\0\0009\5\2\5'\a\3\0B\5\2\0A\2\1\2'\3\4\0B\0\3\2\21\0\0\0)\1\0\0\1\1\0\0X\0\b€6\0\5\0009\0\6\0'\2\a\0B\0\2\1-\0\0\0009\0\b\0006\2\t\0B\0\2\1K\0\1\0\0À\18FASTFOLDTIMER\15timer_stop\28doautocmd User isfolded\bcmd\bvim\23foldlevel(v:val)>0\6$\tline\nrange\vfiltera\1\0\6\0\6\0\n6\0\0\0009\0\1\0009\1\2\0)\3Ð\a3\4\3\0005\5\4\0B\1\4\0027\1\5\0002\0\0€K\0\1\0\18FASTFOLDTIMER\1\0\1\vrepeat\3ÿÿÿÿ\15\0\16timer_start\afn\bvim\0", "setup", "FastFold")
time([[Setup for FastFold]], false)
-- Setup for: dirbuf.nvim
time([[Setup for dirbuf.nvim]], true)
try_loadstring("\27LJ\2\n”\1\0\0\4\0\5\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0005\3\4\0B\0\3\1K\0\1\0\1\0\1\fcommandEif isdirectory(expand('%')) && !&modified|execute 'Dirbuf'|endif\rBufEnter\24nvim_create_autocmd\bapi\bvim\0", "setup", "dirbuf.nvim")
time([[Setup for dirbuf.nvim]], false)
-- Setup for: gv.vim
time([[Setup for gv.vim]], true)
try_loadstring("\27LJ\2\n—\2\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0÷\1command! -nargs=* -range -bang -complete=file GV lua require(\"packer.load\")({'vim-fugitive'},{},_G.packer_plugins) require(\"packer.load\")({'gv.vim'},{cmd=\"GV\",l1=<line1>,l2=<line2>,bang=<q-bang>,args=<q-args>,mods=\"<mods>\"},_G.packer_plugins)\bcmd\bvim\0", "setup", "gv.vim")
time([[Setup for gv.vim]], false)
-- Setup for: vim-surround
time([[Setup for vim-surround]], true)
try_loadstring("\27LJ\2\nº\1\0\0\5\0\n\0\0226\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0B\0\4\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\6\0'\4\a\0B\0\4\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\b\0'\4\t\0B\0\4\1K\0\1\0\29<esc>`>a!<esc>`<iÂ¡<esc>\a&!\29<esc>`>a?<esc>`<iÂ¿<esc>\a&?\20<Plug>VSurround\6&\6x\bset\vkeymap\bvim\0", "setup", "vim-surround")
time([[Setup for vim-surround]], false)
-- Config for: dial.nvim
time([[Config for dial.nvim]], true)
try_loadstring("\27LJ\2\nþ\3\0\0\a\0\23\0I6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0006\4\5\0'\6\6\0B\4\2\0029\4\a\4B\4\1\0025\5\b\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\t\0006\4\5\0'\6\6\0B\4\2\0029\4\n\4B\4\1\0025\5\v\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\f\0'\3\4\0006\4\5\0'\6\6\0B\4\2\0029\4\r\4B\4\1\0025\5\14\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\f\0'\3\t\0006\4\5\0'\6\6\0B\4\2\0029\4\15\4B\4\1\0025\5\16\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\f\0'\3\17\0006\4\5\0'\6\6\0B\4\2\0029\4\18\4B\4\1\0025\5\19\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\f\0'\3\20\0006\4\5\0'\6\6\0B\4\2\0029\4\21\4B\4\1\0025\5\22\0B\0\5\1K\0\1\0\1\0\1\fnoremap\2\16dec_gvisual\vg<C-x>\1\0\1\fnoremap\2\16inc_gvisual\vg<C-a>\1\0\1\fnoremap\2\15dec_visual\1\0\1\fnoremap\2\15inc_visual\6v\1\0\1\fnoremap\2\15dec_normal\n<C-x>\1\0\1\fnoremap\2\15inc_normal\rdial.map\frequire\n<C-a>\6n\20nvim_set_keymap\bapi\bvim\0", "config", "dial.nvim")
time([[Config for dial.nvim]], false)
-- Config for: tabout.nvim
time([[Config for tabout.nvim]], true)
require"tabout".setup{
  act_as_tab = false,
  backwards_tabkey = "<A-S-tab>",
  tabkey = "<A-tab>"
}
time([[Config for tabout.nvim]], false)
-- Config for: cybu.nvim
time([[Config for cybu.nvim]], true)
try_loadstring("\27LJ\2\n“\2\0\0\5\0\15\0\"6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0B\0\4\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\t\0'\4\n\0B\0\4\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\v\0'\4\f\0B\0\4\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\r\0'\4\14\0B\0\4\1K\0\1\0\29<plug>(CybuLastusedNext)\a]B\29<plug>(CybuLastusedPrev)\a[B\21<Plug>(CybuNext)\a]b\21<Plug>(CybuPrev)\a[b\6n\bset\vkeymap\bvim\nsetup\tcybu\frequire\0", "config", "cybu.nvim")
time([[Config for cybu.nvim]], false)
-- Config for: iswap.nvim
time([[Config for iswap.nvim]], true)
try_loadstring("\27LJ\2\nn\0\0\5\0\b\0\0156\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0B\0\4\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\6\0'\4\a\0B\0\4\1K\0\1\0\f:ISwap\r\agH\16:ISwapWith\r\agh\6n\bset\vkeymap\bvim\0", "config", "iswap.nvim")
time([[Config for iswap.nvim]], false)
-- Config for: colortils.nvim
time([[Config for colortils.nvim]], true)
require"colortils".setup{}
time([[Config for colortils.nvim]], false)
-- Config for: vim-repeat
time([[Config for vim-repeat]], true)
try_loadstring("\27LJ\2\n_\0\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\1\vsilent\2\22<Plug>(RepeatDot)\n<C-.>\6n\bset\vkeymap\bvim\0", "config", "vim-repeat")
time([[Config for vim-repeat]], false)
-- Config for: color-picker.nvim
time([[Config for color-picker.nvim]], true)
require("color-picker")
time([[Config for color-picker.nvim]], false)
-- Config for: nvim-trevj.lua
time([[Config for nvim-trevj.lua]], true)
try_loadstring("\27LJ\2\ne\0\0\5\0\6\0\b6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0B\0\4\1K\0\1\0.:lua require(\"trevj\").format_at_cursor()\r\agS\6n\bset\vkeymap\bvim\0", "config", "nvim-trevj.lua")
time([[Config for nvim-trevj.lua]], false)
-- Config for: vim-rainbow-lists
time([[Config for vim-rainbow-lists]], true)
try_loadstring("\27LJ\2\n`\0\0\4\0\5\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0005\3\4\0B\0\3\1K\0\1\0\1\0\1\fcommand\17RBListEnable\rFileType\24nvim_create_autocmd\bapi\bvim\0", "config", "vim-rainbow-lists")
time([[Config for vim-rainbow-lists]], false)
-- Config for: stabilize.nvim
time([[Config for stabilize.nvim]], true)
require"stabilize".setup{}
time([[Config for stabilize.nvim]], false)
-- Config for: nvim-window
time([[Config for nvim-window]], true)
try_loadstring("\27LJ\2\n|\0\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2(:lua require(\"nvim-window\").pick()\r\f<C-w>g \6n\bset\vkeymap\bvim\0", "config", "nvim-window")
time([[Config for nvim-window]], false)
-- Config for: spellsitter.nvim
time([[Config for spellsitter.nvim]], true)
require"spellsitter".setup{}
time([[Config for spellsitter.nvim]], false)
-- Config for: sort.nvim
time([[Config for sort.nvim]], true)
require"sort".setup{}
time([[Config for sort.nvim]], false)
-- Config for: vim-numbers
time([[Config for vim-numbers]], true)
try_loadstring("\27LJ\2\n”\2\0\0\6\0\14\0%6\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\3\0009\0\4\0'\2\5\0'\3\6\0'\4\a\0005\5\b\0B\0\5\0016\0\0\0009\0\3\0009\0\4\0'\2\t\0'\3\6\0'\4\a\0005\5\n\0B\0\5\0016\0\0\0009\0\3\0009\0\4\0'\2\5\0'\3\v\0'\4\a\0005\5\f\0B\0\5\0016\0\0\0009\0\3\0009\0\4\0'\2\t\0'\3\v\0'\4\a\0005\5\r\0B\0\5\1K\0\1\0\1\0\1\vsilent\2\1\0\1\vsilent\2\ain\1\0\1\vsilent\2\6o\1\0\1\vsilent\2\26<Plug>(VselectNumber)\aan\6v\bset\vkeymap numbers#enable_text_objects\6g\bvim\0", "config", "vim-numbers")
time([[Config for vim-numbers]], false)
-- Config for: sideways.vim
time([[Config for sideways.vim]], true)
try_loadstring("\27LJ\2\nš\2\0\0\6\0\16\0!6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\a\0'\4\b\0005\5\t\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\n\0'\4\v\0005\5\f\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\r\0'\4\14\0005\5\15\0B\0\5\1K\0\1\0\1\0\1\vsilent\2\23:SidewaysJumpLeft\r\a<A\1\0\1\vsilent\2\24:SidewaysJumpRight\r\a>A\1\0\1\vsilent\2\19:SidewaysLeft\r\a<a\1\0\1\vsilent\2\20:SidewaysRight\r\a>a\6n\bset\vkeymap\bvim\0", "config", "sideways.vim")
time([[Config for sideways.vim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n›\3\0\0\f\0\21\0-6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0005\4\5\0005\5\4\0=\5\6\4=\4\a\3B\1\2\0016\1\0\0'\3\b\0B\1\2\0029\2\t\0\18\4\1\0'\6\n\0'\a\n\0'\b\v\0B\4\4\0A\2\0\0016\2\0\0'\4\f\0B\2\2\0029\3\t\0\18\5\1\0'\a\r\0'\b\r\0'\t\14\0B\5\4\2\18\a\5\0009\5\15\0059\b\16\2'\n\17\0)\vÿÿB\b\3\0A\5\1\0A\3\0\0019\3\t\0\18\5\1\0'\a\18\0'\b\19\0005\t\20\0B\5\4\0A\3\0\1K\0\1\0\1\t\0\0\6c\bcpp\tjava\15javascript\trust\bphp\fhaskell\ago\a*/\a/*\v[[]=*$\17before_regex\14with_pair\blua\6=\25nvim-autopairs.conds\vpython\b'''\radd_rule\24nvim-autopairs.rule\14fast_wrap\nchars\1\0\0\1\a\0\0\6{\6[\6(\6\"\6'\6`\1\0\1\vmap_cr\1\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: renamer.nvim
time([[Config for renamer.nvim]], true)
try_loadstring("\27LJ\2\n˜\1\0\0\5\0\n\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0009\0\5\0009\0\6\0'\2\a\0'\3\b\0'\4\t\0B\0\4\1K\0\1\0$:lua require\"renamer\".rename()\r\agr\6n\bset\vkeymap\bvim\1\0\1\15with_popup\1\nsetup\frenamer\frequire\0", "config", "renamer.nvim")
time([[Config for renamer.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
require("config.lsp")
time([[Config for nvim-lspconfig]], false)
-- Config for: refactoring.nvim
time([[Config for refactoring.nvim]], true)
try_loadstring("\27LJ\2\nÀ\4\0\0\6\0\16\0!6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\a\0'\4\b\0005\5\t\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\n\0'\4\v\0005\5\f\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\r\0'\4\14\0005\5\15\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2I<Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>\15<leader>ri\1\0\2\vsilent\2\fnoremap\2J<Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>\15<leader>rv\1\0\2\vsilent\2\fnoremap\2R<Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>\15<leader>rf\1\0\2\vsilent\2\fnoremap\2J<Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>\15<leader>re\6v\20nvim_set_keymap\bapi\bvim\0", "config", "refactoring.nvim")
time([[Config for refactoring.nvim]], false)
-- Config for: readline.nvim
time([[Config for readline.nvim]], true)
try_loadstring("\27LJ\2\nð\3\0\0\6\0\24\0C6\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\6\0009\5\a\0B\1\4\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\b\0009\5\t\0B\1\4\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\n\0009\5\v\0B\1\4\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\f\0009\5\r\0B\1\4\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\14\0009\5\15\0B\1\4\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\16\0009\5\17\0B\1\4\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\18\0009\5\19\0B\1\4\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\20\0009\5\21\0B\1\4\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\22\0009\5\23\0B\1\4\1K\0\1\0\23backward_kill_line\n<C-u>\14kill_line\n<C-k>\21unix_word_rubout\n<C-w>\23backward_kill_word\v<M-BS>\14kill_word\n<M-d>\16end_of_line\n<C-e>\22beginning_of_line\n<C-a>\18backward_word\n<M-b>\17forward_word\n<M-f>\6!\bset\vkeymap\bvim\rreadline\frequire\0", "config", "readline.nvim")
time([[Config for readline.nvim]], false)
-- Config for: reach.nvim
time([[Config for reach.nvim]], true)
require"reach".setup{}
time([[Config for reach.nvim]], false)
-- Config for: range-highlight.nvim
time([[Config for range-highlight.nvim]], true)
require"range-highlight".setup{}
time([[Config for range-highlight.nvim]], false)
-- Config for: nvim-hlslens
time([[Config for nvim-hlslens]], true)
try_loadstring("\27LJ\2\ná\4\0\0\6\0\21\00016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\3\0'\4\4\0005\5\5\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\6\0'\4\a\0005\5\b\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\t\0'\4\n\0005\5\v\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\f\0'\4\r\0005\5\14\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\15\0'\4\16\0005\5\17\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\18\0'\4\19\0005\5\20\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2.g#<Cmd>lua require('hlslens').start()<CR>\ag#\1\0\2\vsilent\2\fnoremap\2.g*<Cmd>lua require('hlslens').start()<CR>\ag*\1\0\2\vsilent\2\fnoremap\2-#<Cmd>lua require('hlslens').start()<CR>\6#\1\0\2\vsilent\2\fnoremap\2-*<Cmd>lua require('hlslens').start()<CR>\6*\1\0\2\vsilent\2\fnoremap\2-N<Cmd>lua require('hlslens').start()<CR>\6N\1\0\2\vsilent\2\fnoremap\2-n<Cmd>lua require('hlslens').start()<CR>\6n\20nvim_set_keymap\bapi\bvim\0", "config", "nvim-hlslens")
time([[Config for nvim-hlslens]], false)
-- Config for: project.nvim
time([[Config for project.nvim]], true)
require"project_nvim".setup{
  manual_mode = true
}
time([[Config for project.nvim]], false)
-- Config for: nvim-gomove
time([[Config for nvim-gomove]], true)
require"gomove".setup{
  map_defaults = false
}
time([[Config for nvim-gomove]], false)
-- Config for: nvim-expand-expr
time([[Config for nvim-expand-expr]], true)
try_loadstring("\27LJ\2\n_\0\0\5\0\6\0\b6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0B\0\4\1K\0\1\0(:lua require\"expand_expr\".expand()\r\agE\6n\bset\vkeymap\bvim\0", "config", "nvim-expand-expr")
time([[Config for nvim-expand-expr]], false)
-- Config for: vim-devdocs
time([[Config for vim-devdocs]], true)
try_loadstring("\27LJ\2\nX\0\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\t:DD\r\agD\6n\bset\vkeymap\bvim\0", "config", "vim-devdocs")
time([[Config for vim-devdocs]], false)
-- Config for: vim-cycle
time([[Config for vim-cycle]], true)
try_loadstring("\27LJ\2\nª\1\0\0\5\0\n\0\0196\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\3\0009\0\4\0'\2\5\0'\3\6\0'\4\a\0B\0\4\0016\0\0\0009\0\3\0009\0\4\0'\2\5\0'\3\b\0'\4\t\0B\0\4\1K\0\1\0\24<Plug>CyclePrevious\vg<C-x>\20<Plug>CycleNext\vg<C-a>\6n\bset\vkeymap\22cycle_no_mappings\6g\bvim\0", "config", "vim-cycle")
time([[Config for vim-cycle]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
require"colorizer".setup{ "*" }
time([[Config for nvim-colorizer.lua]], false)
-- Config for: clipboard-image.nvim
time([[Config for clipboard-image.nvim]], true)
try_loadstring("\27LJ\2\n]\0\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\2\vnowait\2\vsilent\2\15:PasteImg\r\a\\p\6n\bset\vkeymap\bvim\0", "config", "clipboard-image.nvim")
time([[Config for clipboard-image.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
require("config.cmp-nvim")
time([[Config for nvim-cmp]], false)
-- Config for: vim-choosewin
time([[Config for vim-choosewin]], true)
try_loadstring("\27LJ\2\n…\1\0\0\6\0\t\0\r6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\3\0009\0\4\0'\2\5\0'\3\6\0'\4\a\0005\5\b\0B\0\5\1K\0\1\0\1\0\1\vsilent\2\16:ChooseWin\r\v<C-w> \6n\bset\vkeymap\29choosewin_overlay_enable\6g\bvim\0", "config", "vim-choosewin")
time([[Config for vim-choosewin]], false)
-- Config for: nvim-lazy-inner-block
time([[Config for nvim-lazy-inner-block]], true)
require"nvim-lazy-inner-block".setup{}
time([[Config for nvim-lazy-inner-block]], false)
-- Config for: chartoggle.nvim
time([[Config for chartoggle.nvim]], true)
require"chartoggle".setup{
  keys = { "}", "'", ")", "--", "#" },
  leader = "\\"
}
time([[Config for chartoggle.nvim]], false)
-- Config for: numb.nvim
time([[Config for numb.nvim]], true)
require"numb".setup{}
time([[Config for numb.nvim]], false)
-- Config for: abbreinder.nvim
time([[Config for abbreinder.nvim]], true)
require"abbreinder".setup{}
time([[Config for abbreinder.nvim]], false)
-- Config for: syntax-tree-surfer
time([[Config for syntax-tree-surfer]], true)
try_loadstring("\27LJ\2\n\\\0\0\3\1\2\0\5-\0\0\0009\0\0\0005\2\1\0B\0\2\1K\0\1\0\0À\1\4\0\0\rfunction\20arrrow_function\24function_definition\18targeted_jumph\0\0\3\1\2\0\5-\0\0\0009\0\0\0005\2\1\0B\0\2\1K\0\1\0\0À\1\5\0\0\17if_statement\16else_clause\19else_statement\21elseif_statement\18targeted_jump^\0\0\3\1\2\0\5-\0\0\0009\0\0\0005\2\1\0B\0\2\1K\0\1\0\0À\1\4\0\0\18for_statement\20while_statement\21switch_statement\18targeted_jumpD\0\0\3\1\2\0\5-\0\0\0009\0\0\0005\2\1\0B\0\2\1K\0\1\0\0À\1\2\0\0\25variable_declaration\18targeted_jump6\0\0\3\1\2\0\5-\0\0\0009\0\0\0005\2\1\0B\0\2\1K\0\1\0\0À\1\2\0\0\vstring\18targeted_jump6\0\0\3\1\2\0\5-\0\0\0009\0\0\0005\2\1\0B\0\2\1K\0\1\0\0À\1\2\0\0\vineger\18targeted_jump \1\0\0\3\1\2\0\5-\0\0\0009\0\0\0005\2\1\0B\0\2\1K\0\1\0\0À\1\t\0\0\rfunction\17if_statement\16else_clause\19else_statement\21elseif_statement\18for_statement\20while_statement\21switch_statement\18targeted_jump7\0\0\4\1\2\0\6-\0\0\0009\0\0\0'\2\1\0+\3\2\0B\0\3\1K\0\1\0\0À\fdefault\18filtered_jump7\0\0\4\1\2\0\6-\0\0\0009\0\0\0'\2\1\0+\3\1\0B\0\3\1K\0\1\0\0À\fdefault\18filtered_jump¶\19\1\0\a\0W\0å\0016\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\6\0'\5\a\0005\6\b\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\t\0'\5\n\0005\6\v\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\f\0'\4\r\0'\5\14\0005\6\15\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\f\0'\4\16\0'\5\17\0005\6\18\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\f\0'\4\19\0'\5\20\0005\6\21\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\f\0'\4\22\0'\5\23\0005\6\24\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\f\0'\4\25\0'\5\26\0005\6\27\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\f\0'\4\28\0'\5\29\0005\6\30\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\f\0'\4\31\0'\5 \0005\6!\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\f\0'\4\"\0'\5#\0005\6$\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\f\0'\4%\0'\5&\0005\6'\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\f\0'\4(\0'\5)\0005\6*\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4%\0'\5+\0005\6,\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4(\0'\5-\0005\6.\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\f\0'\4/\0'\0050\0005\0061\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\f\0'\0042\0'\0053\0005\0064\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4/\0'\0055\0005\0066\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\0042\0'\0057\0005\0068\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\0049\0'\5:\0005\6;\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4<\0003\5=\0005\6>\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4?\0003\5@\0005\6A\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4B\0003\5C\0005\6D\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4E\0003\5F\0005\6G\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4H\0003\5I\0005\6J\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4K\0003\5L\0005\6M\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4N\0003\5O\0005\6P\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4Q\0003\5R\0005\6S\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4T\0003\5U\0005\6V\0B\1\5\0012\0\0€K\0\1\0\1\0\2\vsilent\2\fnoremap\2\0\n<A-P>\1\0\2\vsilent\2\fnoremap\2\0\n<A-N>\1\0\2\vsilent\2\fnoremap\2\0\bgfa\1\0\2\vsilent\2\fnoremap\2\0\bgfi\1\0\2\vsilent\2\fnoremap\2\0\bgfs\1\0\2\vsilent\2\fnoremap\2\0\bgfv\1\0\2\vsilent\2\fnoremap\2\0\bgfo\1\0\2\vsilent\2\fnoremap\2\0\bgfe\1\0\2\vsilent\2\fnoremap\2\0\bgfu\1\0\2\vsilent\2\fnoremap\2y:lua require(\"syntax-tree-surfer\").go_to_top_node_and_execute_commands(false,{\"normal!O\",\"normal!O\",\"startinsert\"})\r\n<C-o>\1\0\2\vsilent\2\fnoremap\2\23<Plug>GoNDLineDown\1\0\2\vsilent\2\fnoremap\2\21<Plug>GoNDLineUp\1\0\2\vsilent\2\fnoremap\2\23<Plug>GoVDLineDown\f<A-S-j>\1\0\2\vsilent\2\fnoremap\2\21<Plug>GoVDLineUp\f<A-S-k>\1\0\2\vsilent\2\fnoremap\2\23<Plug>GoNMLineDown\1\0\2\vsilent\2\fnoremap\2\21<Plug>GoNMLineUp\1\0\2\vsilent\2\fnoremap\2\23<Plug>GoVMLineDown\n<A-j>\1\0\2\vsilent\2\fnoremap\2\21<Plug>GoVMLineUp\n<A-k>\1\0\3\texpr\2\fnoremap\2\vsilent\2*mode()==\"<C-v>\"?\"<Plug>GoVSDRight\":\"\"\f<C-S-l>\1\0\3\texpr\2\fnoremap\2\vsilent\2)mode()==\"<C-v>\"?\"<Plug>GoVSDLeft\":\"\"\f<C-S-h>\1\0\3\texpr\2\fnoremap\2\vsilent\2>mode()==\"<C-v>\"?\"<Plug>GoVSDUp\":\"<cmd>STSSwapPrevVisual\r\"\f<C-S-k>\1\0\3\texpr\2\fnoremap\2\vsilent\2@mode()==\"<C-v>\"?\"<Plug>GoVSDDown\":\"<cmd>STSSwapNextVisual\r\"\f<C-S-j>\1\0\3\texpr\2\fnoremap\2\vsilent\2Bmode()==\"<C-v>\"?\"<Plug>GoVSMRight\":\"<cmd>STSSelectChildNode\r\"\n<C-l>\1\0\3\texpr\2\fnoremap\2\vsilent\2Bmode()==\"<C-v>\"?\"<Plug>GoVSMLeft\":\"<cmd>STSSelectParentNode\r\"\n<C-h>\1\0\3\texpr\2\fnoremap\2\vsilent\2Emode()==\"<C-v>\"?\"<Plug>GoVSMUp\":\"<cmd>STSSelectPrevSiblingNode\r\"\n<C-k>\1\0\3\texpr\2\fnoremap\2\vsilent\2Gmode()==\"<C-v>\"?\"<Plug>GoVSMDown\":\"<cmd>STSSelectNextSiblingNode\r\"\n<C-j>\6x\1\0\2\vsilent\2\fnoremap\2\31<cmd>STSSelectCurrentNode\r\avn\1\0\2\vsilent\2\fnoremap\2\30<cmd>STSSelectMasterNode\r\avx\6n\bset\vkeymap\bvim\23syntax-tree-surfer\frequire\0", "config", "syntax-tree-surfer")
time([[Config for syntax-tree-surfer]], false)
-- Config for: bookmarks.nvim
time([[Config for bookmarks.nvim]], true)
require"bookmarks".setup{}
time([[Config for bookmarks.nvim]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
require("config.snip")
time([[Config for LuaSnip]], false)
-- Config for: zen-mode.nvim
time([[Config for zen-mode.nvim]], true)
require"zen-mode".setup{}
time([[Config for zen-mode.nvim]], false)
-- Config for: JABS.nvim
time([[Config for JABS.nvim]], true)
require"jabs".setup{}
time([[Config for JABS.nvim]], false)
-- Config for: attempt.nvim
time([[Config for attempt.nvim]], true)
try_loadstring("\27LJ\2\n…\4\0\0\a\0\25\00066\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\0016\1\3\0009\1\4\0019\1\5\1'\3\6\0'\4\a\0009\5\b\0005\6\t\0B\1\5\0016\1\3\0009\1\4\0019\1\5\1'\3\6\0'\4\n\0009\5\v\0005\6\f\0B\1\5\0016\1\3\0009\1\4\0019\1\5\1'\3\6\0'\4\r\0009\5\14\0005\6\15\0B\1\5\0016\1\3\0009\1\4\0019\1\5\1'\3\6\0'\4\16\0009\5\17\0005\6\18\0B\1\5\0016\1\3\0009\1\4\0019\1\5\1'\3\6\0'\4\19\0009\5\20\0005\6\21\0B\1\5\0016\1\3\0009\1\4\0019\1\5\1'\3\6\0'\4\22\0'\5\23\0005\6\24\0B\1\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\22Telescope attempt\15<leader>al\1\0\2\vsilent\2\fnoremap\2\15rename_buf\15<leader>ac\1\0\2\vsilent\2\fnoremap\2\15delete_buf\15<leader>ad\1\0\2\vsilent\2\fnoremap\2\brun\15<leader>ar\1\0\2\vsilent\2\fnoremap\2\18new_input_ext\15<leader>ai\1\0\2\vsilent\2\fnoremap\2\15new_select\15<leader>an\6n\bset\vkeymap\bvim\nsetup\fattempt\frequire\0", "config", "attempt.nvim")
time([[Config for attempt.nvim]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
require"trouble".setup{}
time([[Config for trouble.nvim]], false)
-- Config for: winshift.nvim
time([[Config for winshift.nvim]], true)
try_loadstring("\27LJ\2\nè\1\0\0\f\0\14\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\3\0005\2\4\0B\0\2\4H\3\14€6\5\5\0009\5\6\0059\5\a\5'\a\b\0'\b\t\0\18\t\3\0'\n\n\0&\b\n\b'\t\v\0\18\n\4\0'\v\f\0&\t\v\t5\n\r\0B\5\5\1F\3\3\3R\3ð\127K\0\1\0\1\0\2\vsilent\2\fnoremap\2\6\r\15:WinShift \6>\n<C-S-\6n\bset\vkeymap\bvim\1\0\4\6l\nright\6h\tleft\6k\aup\6j\tdown\npairs\nsetup\rwinshift\frequire\0", "config", "winshift.nvim")
time([[Config for winshift.nvim]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
require("config.which-key")
time([[Config for which-key.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
require("config.telescope")
time([[Config for telescope.nvim]], false)
-- Config for: AutoSave.nvim
time([[Config for AutoSave.nvim]], true)
require"autosave".setup{}
time([[Config for AutoSave.nvim]], false)
-- Config for: focus.nvim
time([[Config for focus.nvim]], true)
require"focus".setup{
  autoresize = false
}
time([[Config for focus.nvim]], false)
-- Config for: clever-f.vim
time([[Config for clever-f.vim]], true)
try_loadstring("\27LJ\2\n¸\1\0\0\6\0\n\0\0176\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\0\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0005\5\t\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\27<Plug>(clever-f-reset)\n<esc>\6n\bset\vkeymap\25clever_f_mark_direct\24clever_f_smart_case\6g\bvim\0", "config", "clever-f.vim")
time([[Config for clever-f.vim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
require("config.treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: bullets.vim
time([[Config for bullets.vim]], true)
try_loadstring("\27LJ\2\ng\0\0\2\0\5\0\t6\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\4\0K\0\1\0\25bullets_set_mappings\1\2\0\0\6*\31bullets_enabled_file_types\6g\bvim\0", "config", "bullets.vim")
time([[Config for bullets.vim]], false)
-- Config for: matchparen.nvim
time([[Config for matchparen.nvim]], true)
require"matchparen".setup{}
time([[Config for matchparen.nvim]], false)
-- Config for: orgmode
time([[Config for orgmode]], true)
require"orgmode".setup{}
time([[Config for orgmode]], false)
-- Config for: vim-better-whitespace
time([[Config for vim-better-whitespace]], true)
try_loadstring("\27LJ\2\n]\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\4\0\0\14dashboard\aqf\tterm*better_whitespace_filetypes_blacklist\6g\bvim\0", "config", "vim-better-whitespace")
time([[Config for vim-better-whitespace]], false)
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
-- Config for: nvim-pqf
time([[Config for nvim-pqf]], true)
require"pqf".setup{}
time([[Config for nvim-pqf]], false)
-- Config for: vim-translator
time([[Config for vim-translator]], true)
require("config.translator")
time([[Config for vim-translator]], false)
-- Config for: nvim_context_vt
time([[Config for nvim_context_vt]], true)
require"nvim_context_vt".setup{}
time([[Config for nvim_context_vt]], false)
-- Config for: onedark.nvim
time([[Config for onedark.nvim]], true)
vim.cmd"colorschem onedark"
time([[Config for onedark.nvim]], false)
-- Config for: neoscroll.nvim
time([[Config for neoscroll.nvim]], true)
require"neoscroll".setup{}
time([[Config for neoscroll.nvim]], false)
-- Config for: yanky.nvim
time([[Config for yanky.nvim]], true)
try_loadstring("\27LJ\2\nø\3\0\0\5\0\23\0E6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0B\0\4\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\t\0'\4\n\0B\0\4\0016\0\3\0009\0\4\0009\0\5\0'\2\v\0'\3\a\0'\4\b\0B\0\4\0016\0\3\0009\0\4\0009\0\5\0'\2\v\0'\3\t\0'\4\n\0B\0\4\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\f\0'\4\r\0B\0\4\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\14\0'\4\15\0B\0\4\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\16\0'\4\17\0B\0\4\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\18\0'\4\19\0B\0\4\0016\0\0\0'\2\20\0B\0\2\0029\0\21\0'\2\22\0B\0\2\1K\0\1\0\17yank_history\19load_extension\14telescope\r:rshada\r\n<C-n>\r:wshada\r\n<C-p>\31<Plug>(YankyCycleBackward)\n<A-P>\30<Plug>(YankyCycleForward)\n<A-p>\6x\27<Plug>(YankyPutBefore)\6P\26<Plug>(YankyPutAfter)\6p\6n\bset\vkeymap\bvim\nsetup\nyanky\frequire\0", "config", "yanky.nvim")
time([[Config for yanky.nvim]], false)
-- Config for: hop.nvim
time([[Config for hop.nvim]], true)
require"hop".setup{}
time([[Config for hop.nvim]], false)
-- Config for: lists.vim
time([[Config for lists.vim]], true)
try_loadstring("\27LJ\2\n7\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\2\0\0\6*\20lists_filetypes\6g\bvim\0", "config", "lists.vim")
time([[Config for lists.vim]], false)
-- Config for: nvim-lastplace
time([[Config for nvim-lastplace]], true)
require"nvim-lastplace".setup{}
time([[Config for nvim-lastplace]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Neogit lua require("packer.load")({'neogit'}, { cmd = "Neogit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file FastFoldUpdate lua require("packer.load")({'FastFold'}, { cmd = "FastFoldUpdate", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file MundoToggle lua require("packer.load")({'vim-mundo'}, { cmd = "MundoToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file CodiNew lua require("packer.load")({'codi.vim'}, { cmd = "CodiNew", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file CodiExpand lua require("packer.load")({'codi.vim'}, { cmd = "CodiExpand", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file CodiSelect lua require("packer.load")({'codi.vim'}, { cmd = "CodiSelect", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file CodiUpdate lua require("packer.load")({'codi.vim'}, { cmd = "CodiUpdate", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TSPlaygroundToggle lua require("packer.load")({'playground'}, { cmd = "TSPlaygroundToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file MinimapToggle lua require("packer.load")({'minimap.vim'}, { cmd = "MinimapToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GitGutterAll lua require("packer.load")({'vim-gitgutter'}, { cmd = "GitGutterAll", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GitGutterBufferDisable lua require("packer.load")({'vim-gitgutter'}, { cmd = "GitGutterBufferDisable", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GitGutterBufferEnable lua require("packer.load")({'vim-gitgutter'}, { cmd = "GitGutterBufferEnable", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GitGutterBufferToggle lua require("packer.load")({'vim-gitgutter'}, { cmd = "GitGutterBufferToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GitGutterDebug lua require("packer.load")({'vim-gitgutter'}, { cmd = "GitGutterDebug", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GitGutterDiffOrig lua require("packer.load")({'vim-gitgutter'}, { cmd = "GitGutterDiffOrig", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GitGutterDisable lua require("packer.load")({'vim-gitgutter'}, { cmd = "GitGutterDisable", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GitGutterEnable lua require("packer.load")({'vim-gitgutter'}, { cmd = "GitGutterEnable", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GitGutterFold lua require("packer.load")({'vim-gitgutter'}, { cmd = "GitGutterFold", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GitGutterLineHighlightsDisable lua require("packer.load")({'vim-gitgutter'}, { cmd = "GitGutterLineHighlightsDisable", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GitGutterLineHighlightsEnable lua require("packer.load")({'vim-gitgutter'}, { cmd = "GitGutterLineHighlightsEnable", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GitGutterLineHighlightsToggle lua require("packer.load")({'vim-gitgutter'}, { cmd = "GitGutterLineHighlightsToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GitGutterLineNrHighlightsDisable lua require("packer.load")({'vim-gitgutter'}, { cmd = "GitGutterLineNrHighlightsDisable", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GitGutterLineNrHighlightsEnable lua require("packer.load")({'vim-gitgutter'}, { cmd = "GitGutterLineNrHighlightsEnable", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GitGutterLineNrHighlightsToggle lua require("packer.load")({'vim-gitgutter'}, { cmd = "GitGutterLineNrHighlightsToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GitGutterNextHunk lua require("packer.load")({'vim-gitgutter'}, { cmd = "GitGutterNextHunk", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GitGutterPrevHunk lua require("packer.load")({'vim-gitgutter'}, { cmd = "GitGutterPrevHunk", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GitGutterPreviewHunk lua require("packer.load")({'vim-gitgutter'}, { cmd = "GitGutterPreviewHunk", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GitGutterQuickFix lua require("packer.load")({'vim-gitgutter'}, { cmd = "GitGutterQuickFix", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GitGutterQuickFixCurrentFile lua require("packer.load")({'vim-gitgutter'}, { cmd = "GitGutterQuickFixCurrentFile", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GitGutterSignsDisable lua require("packer.load")({'vim-gitgutter'}, { cmd = "GitGutterSignsDisable", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GitGutterSignsEnable lua require("packer.load")({'vim-gitgutter'}, { cmd = "GitGutterSignsEnable", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GitGutterSignsToggle lua require("packer.load")({'vim-gitgutter'}, { cmd = "GitGutterSignsToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GitGutterStageHunk lua require("packer.load")({'vim-gitgutter'}, { cmd = "GitGutterStageHunk", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GitGutterToggle lua require("packer.load")({'vim-gitgutter'}, { cmd = "GitGutterToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GitGutterUndoHunk lua require("packer.load")({'vim-gitgutter'}, { cmd = "GitGutterUndoHunk", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file AsyncTaskEdit lua require("packer.load")({'asynctasks.vim'}, { cmd = "AsyncTaskEdit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file AsyncTaskLast lua require("packer.load")({'asynctasks.vim'}, { cmd = "AsyncTaskLast", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file AsyncTaskList lua require("packer.load")({'asynctasks.vim'}, { cmd = "AsyncTaskList", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file AsyncTaskMacro lua require("packer.load")({'asynctasks.vim'}, { cmd = "AsyncTaskMacro", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file AsyncTaskProfile lua require("packer.load")({'asynctasks.vim'}, { cmd = "AsyncTaskProfile", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Cfind lua require("packer.load")({'vim-eunuch'}, { cmd = "Cfind", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Chmod lua require("packer.load")({'vim-eunuch'}, { cmd = "Chmod", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Clocate lua require("packer.load")({'vim-eunuch'}, { cmd = "Clocate", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Copy lua require("packer.load")({'vim-eunuch'}, { cmd = "Copy", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Delete lua require("packer.load")({'vim-eunuch'}, { cmd = "Delete", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Duplicate lua require("packer.load")({'vim-eunuch'}, { cmd = "Duplicate", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Lfind lua require("packer.load")({'vim-eunuch'}, { cmd = "Lfind", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Llocate lua require("packer.load")({'vim-eunuch'}, { cmd = "Llocate", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Mkdir lua require("packer.load")({'vim-eunuch'}, { cmd = "Mkdir", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Move lua require("packer.load")({'vim-eunuch'}, { cmd = "Move", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Remove lua require("packer.load")({'vim-eunuch'}, { cmd = "Remove", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Rename lua require("packer.load")({'vim-eunuch'}, { cmd = "Rename", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SudoEdit lua require("packer.load")({'vim-eunuch'}, { cmd = "SudoEdit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Fardo lua require("packer.load")({'far.vim'}, { cmd = "Fardo", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DashboardNewFile lua require("packer.load")({'dashboard-nvim'}, { cmd = "DashboardNewFile", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Farf lua require("packer.load")({'far.vim'}, { cmd = "Farf", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Farp lua require("packer.load")({'far.vim'}, { cmd = "Farp", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Farundo lua require("packer.load")({'far.vim'}, { cmd = "Farundo", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Codi lua require("packer.load")({'codi.vim'}, { cmd = "Codi", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Wall lua require("packer.load")({'vim-eunuch'}, { cmd = "Wall", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file W lua require("packer.load")({'vim-eunuch'}, { cmd = "W", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Unlink lua require("packer.load")({'vim-eunuch'}, { cmd = "Unlink", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file VSSplit lua require("packer.load")({'visual-split.vim'}, { cmd = "VSSplit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SudoWrite lua require("packer.load")({'vim-eunuch'}, { cmd = "SudoWrite", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file RooterToggle lua require("packer.load")({'vim-rooter'}, { cmd = "RooterToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file VSResize lua require("packer.load")({'visual-split.vim'}, { cmd = "VSResize", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SwitchExtend lua require("packer.load")({'switch.vim'}, { cmd = "SwitchExtend", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SwitchReverse lua require("packer.load")({'switch.vim'}, { cmd = "SwitchReverse", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Tnew lua require("packer.load")({'neoterm'}, { cmd = "Tnew", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TableModeToggle lua require("packer.load")({'vim-table-mode'}, { cmd = "TableModeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Far lua require("packer.load")({'far.vim'}, { cmd = "Far", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file AsyncRun lua require("packer.load")({'asyncrun.vim'}, { cmd = "AsyncRun", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file AsyncStop lua require("packer.load")({'asyncrun.vim'}, { cmd = "AsyncStop", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file CalenderT lua require("packer.load")({'calendar-vim'}, { cmd = "CalenderT", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Switch lua require("packer.load")({'switch.vim'}, { cmd = "Switch", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Dashboard lua require("packer.load")({'dashboard-nvim'}, { cmd = "Dashboard", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Calender lua require("packer.load")({'calendar-vim'}, { cmd = "Calender", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Texec lua require("packer.load")({'neoterm'}, { cmd = "Texec", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Topen lua require("packer.load")({'neoterm'}, { cmd = "Topen", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file F lua require("packer.load")({'far.vim'}, { cmd = "F", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Rooter lua require("packer.load")({'vim-rooter'}, { cmd = "Rooter", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file VSSplitAbove lua require("packer.load")({'visual-split.vim'}, { cmd = "VSSplitAbove", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file VSSplitBelow lua require("packer.load")({'visual-split.vim'}, { cmd = "VSSplitBelow", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file T lua require("packer.load")({'neoterm'}, { cmd = "T", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file CycleColorNext lua require("packer.load")({'CycleColor'}, { cmd = "CycleColorNext", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file CycleColorPrev lua require("packer.load")({'CycleColor'}, { cmd = "CycleColorPrev", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file CycleColorRefresh lua require("packer.load")({'CycleColor'}, { cmd = "CycleColorRefresh", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file AsyncTask lua require("packer.load")({'asynctasks.vim'}, { cmd = "AsyncTask", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Refar lua require("packer.load")({'far.vim'}, { cmd = "Refar", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GitGutter lua require("packer.load")({'vim-gitgutter'}, { cmd = "GitGutter", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Dirbuf lua require("packer.load")({'dirbuf.nvim'}, { cmd = "Dirbuf", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SymbolsOutlineOpen lua require("packer.load")({'symbols-outline.nvim'}, { cmd = "SymbolsOutlineOpen", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SymbolsOutlineClose lua require("packer.load")({'symbols-outline.nvim'}, { cmd = "SymbolsOutlineClose", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file CalenderH lua require("packer.load")({'calendar-vim'}, { cmd = "CalenderH", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TagbarToggle lua require("packer.load")({'tagbar'}, { cmd = "TagbarToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file CalenderVT lua require("packer.load")({'calendar-vim'}, { cmd = "CalenderVT", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Farr lua require("packer.load")({'far.vim'}, { cmd = "Farr", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeToggle lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Gitsigns lua require("packer.load")({'gitsigns.nvim'}, { cmd = "Gitsigns", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SymbolsOutline lua require("packer.load")({'symbols-outline.nvim'}, { cmd = "SymbolsOutline", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[noremap <silent> mc <cmd>lua require("packer.load")({'vim-bookmarks'}, { keys = "mc", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> cS <cmd>lua require("packer.load")({'vim-surround'}, { keys = "cS", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> ma <cmd>lua require("packer.load")({'vim-bookmarks'}, { keys = "ma", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> gR <cmd>lua require("packer.load")({'splitjoin.vim'}, { keys = "gR", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <C-S-n> <cmd>lua require("packer.load")({'vim-visual-multi'}, { keys = "<lt>C-S-n>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> mx <cmd>lua require("packer.load")({'vim-bookmarks'}, { keys = "mx", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>VSurround <cmd>lua require("packer.load")({'vim-surround'}, { keys = "<lt>Plug>VSurround", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> mi <cmd>lua require("packer.load")({'vim-bookmarks'}, { keys = "mi", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> mn <cmd>lua require("packer.load")({'vim-bookmarks'}, { keys = "mn", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[vnoremap <silent> gl <cmd>lua require("packer.load")({'vim-lion'}, { keys = "gl", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> ys <cmd>lua require("packer.load")({'vim-surround'}, { keys = "ys", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[vnoremap <silent> ab <cmd>lua require("packer.load")({'vim-textobj-anyblock'}, { keys = "ab", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> mg <cmd>lua require("packer.load")({'vim-bookmarks'}, { keys = "mg", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> mjj <cmd>lua require("packer.load")({'vim-bookmarks'}, { keys = "mjj", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[onoremap <silent> ab <cmd>lua require("packer.load")({'vim-textobj-anyblock'}, { keys = "ab", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> gs <cmd>lua require("packer.load")({'switch.vim'}, { keys = "gs", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <char-93><char-93> <cmd>lua require("packer.load")({'jumpy.vim'}, { keys = "<lt>char-93><lt>char-93>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[vnoremap <silent> i  <cmd>lua require("packer.load")({'vim-textobj-blanklines'}, { keys = "i ", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[vnoremap <silent> ib <cmd>lua require("packer.load")({'vim-textobj-anyblock'}, { keys = "ib", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[onoremap <silent> ib <cmd>lua require("packer.load")({'vim-textobj-anyblock'}, { keys = "ib", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> M<Tab> <cmd>lua require("packer.load")({'vim-highlighter'}, { keys = "M<lt>Tab>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> M<CR> <cmd>lua require("packer.load")({'vim-highlighter'}, { keys = "M<lt>CR>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[onoremap <silent> i <cmd>lua require("packer.load")({'targets.vim'}, { keys = "i", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <C-G>s <cmd>lua require("packer.load")({'vim-surround'}, { keys = "<lt>C-G>s", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> M<BS> <cmd>lua require("packer.load")({'vim-highlighter'}, { keys = "M<lt>BS>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <C-W>gsa <cmd>lua require("packer.load")({'visual-split.vim'}, { keys = "<lt>C-W>gsa", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> gL <cmd>lua require("packer.load")({'vim-lion'}, { keys = "gL", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[vnoremap <silent> gL <cmd>lua require("packer.load")({'vim-lion'}, { keys = "gL", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> gl <cmd>lua require("packer.load")({'vim-lion'}, { keys = "gl", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> mp <cmd>lua require("packer.load")({'vim-bookmarks'}, { keys = "mp", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> <C-W>gsb <cmd>lua require("packer.load")({'visual-split.vim'}, { keys = "<lt>C-W>gsb", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> <C-W>gsa <cmd>lua require("packer.load")({'visual-split.vim'}, { keys = "<lt>C-W>gsa", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> g[ <cmd>lua require("packer.load")({'jumpy.vim'}, { keys = "g[", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[onoremap <silent> a  <cmd>lua require("packer.load")({'vim-textobj-blanklines'}, { keys = "a ", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <C-S> <cmd>lua require("packer.load")({'vim-surround'}, { keys = "<lt>C-S>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <C-G>S <cmd>lua require("packer.load")({'vim-surround'}, { keys = "<lt>C-G>S", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> Z <cmd>lua require("packer.load")({'FastFold'}, { keys = "Z", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> mm <cmd>lua require("packer.load")({'vim-bookmarks'}, { keys = "mm", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> ySS <cmd>lua require("packer.load")({'vim-surround'}, { keys = "ySS", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> ySs <cmd>lua require("packer.load")({'vim-surround'}, { keys = "ySs", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> cs <cmd>lua require("packer.load")({'vim-surround'}, { keys = "cs", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <C-W>gr <cmd>lua require("packer.load")({'visual-split.vim'}, { keys = "<lt>C-W>gr", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> ds <cmd>lua require("packer.load")({'vim-surround'}, { keys = "ds", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> yS <cmd>lua require("packer.load")({'vim-surround'}, { keys = "yS", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> [[ <cmd>lua require("packer.load")({'jumpy.vim'}, { keys = "[[", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> mkk <cmd>lua require("packer.load")({'vim-bookmarks'}, { keys = "mkk", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> yss <cmd>lua require("packer.load")({'vim-surround'}, { keys = "yss", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> gJ <cmd>lua require("packer.load")({'splitjoin.vim'}, { keys = "gJ", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> g] <cmd>lua require("packer.load")({'jumpy.vim'}, { keys = "g]", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> <C-W>gss <cmd>lua require("packer.load")({'visual-split.vim'}, { keys = "<lt>C-W>gss", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[onoremap <silent> i  <cmd>lua require("packer.load")({'vim-textobj-blanklines'}, { keys = "i ", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> gS <cmd>lua require("packer.load")({'vim-surround'}, { keys = "gS", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <C-W>gss <cmd>lua require("packer.load")({'visual-split.vim'}, { keys = "<lt>C-W>gss", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> M<C-l> <cmd>lua require("packer.load")({'vim-highlighter'}, { keys = "M<lt>C-l>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> i <cmd>lua require("packer.load")({'targets.vim'}, { keys = "i", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[vnoremap <silent> a  <cmd>lua require("packer.load")({'vim-textobj-blanklines'}, { keys = "a ", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <C-W>gsb <cmd>lua require("packer.load")({'visual-split.vim'}, { keys = "<lt>C-W>gsb", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> <C-W>gr <cmd>lua require("packer.load")({'visual-split.vim'}, { keys = "<lt>C-W>gr", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType html ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "html" }, _G.packer_plugins)]]
vim.cmd [[au FileType fish ++once lua require("packer.load")({'cmp-fish'}, { ft = "fish" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'vim-instant-markdown'}, { ft = "markdown" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au User isfolded ++once lua require("packer.load")({'pretty-fold.nvim', 'FastFold'}, { event = "User isfolded" }, _G.packer_plugins)]]
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
