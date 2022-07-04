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
    config = { "\27LJ\2\ni\0\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\2\fnoremap\2\vnowait\2\27<Plug>(FastFoldUpdate)\6Z\6n\bset\vkeymap\bvim\0" },
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
  ["base16-vim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/base16-vim",
    url = "https://github.com/base16-project/base16-vim"
  },
  ["bclose.vim"] = {
    commands = { "Bclose" },
    keys = { { "", "<leader>bd" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/bclose.vim",
    url = "https://github.com/rbgrouleff/bclose.vim"
  },
  ["calendar-vim"] = {
    commands = { "Calender", "CalenderH", "CalenderT", "CalenderVT" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/calendar-vim",
    url = "https://github.com/mattn/calendar-vim"
  },
  changesplugin = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/changesplugin",
    url = "https://github.com/chrisbra/changesplugin"
  },
  ["clever-f.vim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/clever-f.vim",
    url = "https://github.com/rhysd/clever-f.vim"
  },
  ["clipboard-image.nvim"] = {
    config = { "\27LJ\2\n]\0\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\vnowait\2\15:PasteImg\r\a\\p\6n\bset\vkeymap\bvim\0" },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/clipboard-image.nvim",
    url = "https://github.com/ekickx/clipboard-image.nvim"
  },
  ["close-buffers.vim"] = {
    commands = { "Bdelete", "Bwipeout" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/close-buffers.vim",
    url = "https://github.com/Asheq/close-buffers.vim"
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
  ["cmp-nvim-lsp-document-symbol"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp-document-symbol",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp-document-symbol"
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
  ["command_center.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/command_center.nvim",
    url = "https://github.com/FeiyouG/command_center.nvim"
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
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
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
  ["mapx.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/mapx.nvim",
    url = "https://github.com/b0o/mapx.nvim"
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
    config = { 'require"nvim-autopairs".setup{\n  fast_wrap = {},\n  map_cr = false\n}' },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cartographer"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/nvim-cartographer",
    url = "https://github.com/Iron-E/nvim-cartographer"
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
    config = { "\27LJ\2\ne\0\0\5\0\6\0\b6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0B\0\4\1K\0\1\0.:lua require(\"trevj\").format_at_cursor()\r\agR\6n\bset\vkeymap\bvim\0" },
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
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-window"] = {
    config = { "\27LJ\2\n{\0\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2(:lua require(\"nvim-window\").pick()\r\v<C-w> \6n\bset\vkeymap\bvim\0" },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/nvim-window",
    url = "https://gitlab.com/yorickpeterse/nvim-window"
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
  ["simplebuffer.vim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/simplebuffer.vim",
    url = "https://github.com/codcodog/simplebuffer.vim"
  },
  ["spellsitter.nvim"] = {
    config = { 'require"spellsitter".setup{}' },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/spellsitter.nvim",
    url = "https://github.com/lewis6991/spellsitter.nvim"
  },
  ["splitjoin.vim"] = {
    keys = { { "", "gS" }, { "", "gJ" } },
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
  ["telescope-command-palette.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/telescope-command-palette.nvim",
    url = "https://github.com/LinArcX/telescope-command-palette.nvim"
  },
  ["telescope-luasnip.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/telescope-luasnip.nvim",
    url = "https://github.com/benfowler/telescope-luasnip.nvim"
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
  ["vim-better-whitespace"] = {
    config = { "\27LJ\2\nX\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\3\0\0\14dashboard\aqf*better_whitespace_filetypes_blacklist\6g\bvim\0" },
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
  ["vim-cursorword"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/vim-cursorword",
    url = "https://github.com/itchyny/vim-cursorword"
  },
  ["vim-diminactive"] = {
    commands = { "DimInactive", "DimInactiveOff", "DimInactiveToggle" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-diminactive",
    url = "https://github.com/blueyed/vim-diminactive"
  },
  ["vim-eunuch"] = {
    commands = { "Cfind", "Chmod", "Clocate", "Copy", "Delete", "Duplicate", "Lfind", "Llocate", "Mkdir", "Move", "Remove", "Rename", "SudoEdit", "SudoWrite", "Unlink", "W", "Wall" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-eunuch",
    url = "https://github.com/tpope/vim-eunuch"
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
  ["vim-python-docstring"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/vim-python-docstring",
    url = "https://github.com/pixelneo/vim-python-docstring"
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
  ["vim-speeddating"] = {
    keys = { { "n", "<C-a>" }, { "n", "<C-x>" }, { "n", "d<C-a>" }, { "n", "d<C-x>" }, { "x", "<C-a>" }, { "x", "<C-x>" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-speeddating",
    url = "https://github.com/tpope/vim-speeddating"
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
  ["vim-translator"] = {
    commands = { "Translate", "TranslateR" },
    config = { 'require("config.translator")' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-translator",
    url = "https://github.com/voldikss/vim-translator"
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
  ["which-key.nvim"] = {
    config = { 'require("config.which-key")' },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  },
  ["winshift.nvim"] = {
    config = { "\27LJ\2\nè\1\0\0\f\0\14\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\3\0005\2\4\0B\0\2\4H\3\14€6\5\5\0009\5\6\0059\5\a\5'\a\b\0'\b\t\0\18\t\3\0'\n\n\0&\b\n\b'\t\v\0\18\n\4\0'\v\f\0&\t\v\t5\n\r\0B\5\5\1F\3\3\3R\3ð\127K\0\1\0\1\0\2\vsilent\2\fnoremap\2\6\r\15:WinShift \6>\n<C-S-\6n\bset\vkeymap\bvim\1\0\4\6j\tdown\6h\tleft\6k\aup\6l\nright\npairs\nsetup\rwinshift\frequire\0" },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/winshift.nvim",
    url = "https://github.com/sindrets/winshift.nvim"
  },
  ["yanky.nvim"] = {
    config = { "\27LJ\2\n¦\3\0\0\6\0\19\00086\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0B\0\4\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\t\0'\4\n\0B\0\4\0016\0\3\0009\0\4\0009\0\5\0'\2\v\0'\3\a\0'\4\b\0B\0\4\0016\0\3\0009\0\4\0009\0\5\0'\2\v\0'\3\t\0'\4\n\0B\0\4\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\f\0'\4\r\0B\0\4\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\14\0'\4\15\0004\5\0\0B\0\5\0016\0\0\0'\2\16\0B\0\2\0029\0\17\0'\2\18\0B\0\2\1K\0\1\0\17yank_history\19load_extension\14telescope\31<Plug>(YankyCycleBackward)\n<A-P>\30<Plug>(YankyCycleForward)\n<A-p>\6x\27<Plug>(YankyPutBefore)\6P\26<Plug>(YankyPutAfter)\6p\6n\bset\vkeymap\bvim\nsetup\nyanky\frequire\0" },
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
-- Setup for: vim-surround
time([[Setup for vim-surround]], true)
try_loadstring("\27LJ\2\nº\1\0\0\5\0\n\0\0226\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0B\0\4\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\6\0'\4\a\0B\0\4\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\b\0'\4\t\0B\0\4\1K\0\1\0\29<esc>`>a!<esc>`<iÂ¡<esc>\a&!\29<esc>`>a?<esc>`<iÂ¿<esc>\a&?\20<Plug>VSurround\6&\6x\bset\vkeymap\bvim\0", "setup", "vim-surround")
time([[Setup for vim-surround]], false)
-- Setup for: vim-highlighter
time([[Setup for vim-highlighter]], true)
try_loadstring("\27LJ\2\nˆ\1\0\0\2\0\n\0\0176\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\1\0'\1\a\0=\1\6\0006\0\0\0009\0\1\0'\1\t\0=\1\b\0K\0\1\0\vM<tab>\vHiFind\vM<C-L>\fHiClear\nM<BS>\fHiErase\nM<CR>\nHiSet\6g\bvim\0", "setup", "vim-highlighter")
time([[Setup for vim-highlighter]], false)
-- Setup for: FastFold
time([[Setup for FastFold]], true)
try_loadstring("\27LJ\2\nÍ\1\0\0\b\1\n\0\25-\0\0\0009\0\0\0-\2\0\0009\2\1\2)\4\1\0-\5\0\0009\5\2\5'\a\3\0B\5\2\0A\2\1\2'\3\4\0B\0\3\2\21\0\0\0)\1\0\0\1\1\0\0X\0\b€6\0\5\0009\0\6\0'\2\a\0B\0\2\1-\0\0\0009\0\b\0006\2\t\0B\0\2\1K\0\1\0\0À\18FASTFOLDTIMER\15timer_stop\28doautocmd User isfolded\bcmd\bvim\23foldlevel(v:val)>0\6$\tline\nrange\vfiltera\1\0\6\0\6\0\n6\0\0\0009\0\1\0009\1\2\0)\3Ð\a3\4\3\0005\5\4\0B\1\4\0027\1\5\0002\0\0€K\0\1\0\18FASTFOLDTIMER\1\0\1\vrepeat\3ÿÿÿÿ\15\0\16timer_start\afn\bvim\0", "setup", "FastFold")
time([[Setup for FastFold]], false)
-- Setup for: dashboard-nvim
time([[Setup for dashboard-nvim]], true)
try_loadstring("\27LJ\2\n{\0\0\3\0\a\2\0186\0\0\0009\0\1\0009\0\2\0B\0\1\2\t\0\0\0X\0\v€6\0\0\0009\0\1\0009\0\3\0'\2\4\0B\0\2\2\t\0\1\0X\0\4€6\0\0\0009\0\5\0'\2\6\0B\0\2\1K\0\1\0\14Dashboard\bcmd\6$\14line2byte\targc\afn\bvim\0þÿÿÿ\31]\1\0\5\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0005\3\5\0003\4\4\0=\4\6\3B\0\3\1K\0\1\0\rcallback\1\0\0\0\rVimenter\24nvim_create_autocmd\bapi\bvim\0", "setup", "dashboard-nvim")
time([[Setup for dashboard-nvim]], false)
-- Setup for: dirbuf.nvim
time([[Setup for dirbuf.nvim]], true)
try_loadstring("\27LJ\2\n”\1\0\0\4\0\5\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0005\3\4\0B\0\3\1K\0\1\0\1\0\1\fcommandEif isdirectory(expand('%')) && !&modified|execute 'Dirbuf'|endif\rBufEnter\24nvim_create_autocmd\bapi\bvim\0", "setup", "dirbuf.nvim")
time([[Setup for dirbuf.nvim]], false)
-- Config for: renamer.nvim
time([[Config for renamer.nvim]], true)
try_loadstring("\27LJ\2\n˜\1\0\0\5\0\n\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0009\0\5\0009\0\6\0'\2\a\0'\3\b\0'\4\t\0B\0\4\1K\0\1\0$:lua require\"renamer\".rename()\r\agr\6n\bset\vkeymap\bvim\1\0\1\15with_popup\1\nsetup\frenamer\frequire\0", "config", "renamer.nvim")
time([[Config for renamer.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
require"nvim-autopairs".setup{
  fast_wrap = {},
  map_cr = false
}
time([[Config for nvim-autopairs]], false)
-- Config for: matchparen.nvim
time([[Config for matchparen.nvim]], true)
require"matchparen".setup{}
time([[Config for matchparen.nvim]], false)
-- Config for: onedark.nvim
time([[Config for onedark.nvim]], true)
vim.cmd"colorschem onedark"
time([[Config for onedark.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
require"lualine".setup{
  options = {
    theme = "powerline"
  }
}
time([[Config for lualine.nvim]], false)
-- Config for: orgmode
time([[Config for orgmode]], true)
require"orgmode".setup{}
time([[Config for orgmode]], false)
-- Config for: hop.nvim
time([[Config for hop.nvim]], true)
require"hop".setup{}
time([[Config for hop.nvim]], false)
-- Config for: clipboard-image.nvim
time([[Config for clipboard-image.nvim]], true)
try_loadstring("\27LJ\2\n]\0\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\vnowait\2\15:PasteImg\r\a\\p\6n\bset\vkeymap\bvim\0", "config", "clipboard-image.nvim")
time([[Config for clipboard-image.nvim]], false)
-- Config for: vim-better-whitespace
time([[Config for vim-better-whitespace]], true)
try_loadstring("\27LJ\2\nX\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\3\0\0\14dashboard\aqf*better_whitespace_filetypes_blacklist\6g\bvim\0", "config", "vim-better-whitespace")
time([[Config for vim-better-whitespace]], false)
-- Config for: nvim-pqf
time([[Config for nvim-pqf]], true)
require"pqf".setup{}
time([[Config for nvim-pqf]], false)
-- Config for: nvim-window
time([[Config for nvim-window]], true)
try_loadstring("\27LJ\2\n{\0\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2(:lua require(\"nvim-window\").pick()\r\v<C-w> \6n\bset\vkeymap\bvim\0", "config", "nvim-window")
time([[Config for nvim-window]], false)
-- Config for: nvim-lazy-inner-block
time([[Config for nvim-lazy-inner-block]], true)
require"nvim-lazy-inner-block".setup{}
time([[Config for nvim-lazy-inner-block]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
require("config.lsp")
time([[Config for nvim-lspconfig]], false)
-- Config for: focus.nvim
time([[Config for focus.nvim]], true)
require"focus".setup{
  autoresize = false
}
time([[Config for focus.nvim]], false)
-- Config for: nvim-expand-expr
time([[Config for nvim-expand-expr]], true)
try_loadstring("\27LJ\2\n_\0\0\5\0\6\0\b6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0B\0\4\1K\0\1\0(:lua require\"expand_expr\".expand()\r\agE\6n\bset\vkeymap\bvim\0", "config", "nvim-expand-expr")
time([[Config for nvim-expand-expr]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
require("config.telescope")
time([[Config for telescope.nvim]], false)
-- Config for: abbreinder.nvim
time([[Config for abbreinder.nvim]], true)
require"abbreinder".setup{}
time([[Config for abbreinder.nvim]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
require"colorizer".setup{ "*" }
time([[Config for nvim-colorizer.lua]], false)
-- Config for: zen-mode.nvim
time([[Config for zen-mode.nvim]], true)
require"zen-mode".setup{}
time([[Config for zen-mode.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
require("config.cmp-nvim")
time([[Config for nvim-cmp]], false)
-- Config for: yanky.nvim
time([[Config for yanky.nvim]], true)
try_loadstring("\27LJ\2\n¦\3\0\0\6\0\19\00086\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0B\0\4\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\t\0'\4\n\0B\0\4\0016\0\3\0009\0\4\0009\0\5\0'\2\v\0'\3\a\0'\4\b\0B\0\4\0016\0\3\0009\0\4\0009\0\5\0'\2\v\0'\3\t\0'\4\n\0B\0\4\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\f\0'\4\r\0B\0\4\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\14\0'\4\15\0004\5\0\0B\0\5\0016\0\0\0'\2\16\0B\0\2\0029\0\17\0'\2\18\0B\0\2\1K\0\1\0\17yank_history\19load_extension\14telescope\31<Plug>(YankyCycleBackward)\n<A-P>\30<Plug>(YankyCycleForward)\n<A-p>\6x\27<Plug>(YankyPutBefore)\6P\26<Plug>(YankyPutAfter)\6p\6n\bset\vkeymap\bvim\nsetup\nyanky\frequire\0", "config", "yanky.nvim")
time([[Config for yanky.nvim]], false)
-- Config for: winshift.nvim
time([[Config for winshift.nvim]], true)
try_loadstring("\27LJ\2\nè\1\0\0\f\0\14\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\3\0005\2\4\0B\0\2\4H\3\14€6\5\5\0009\5\6\0059\5\a\5'\a\b\0'\b\t\0\18\t\3\0'\n\n\0&\b\n\b'\t\v\0\18\n\4\0'\v\f\0&\t\v\t5\n\r\0B\5\5\1F\3\3\3R\3ð\127K\0\1\0\1\0\2\vsilent\2\fnoremap\2\6\r\15:WinShift \6>\n<C-S-\6n\bset\vkeymap\bvim\1\0\4\6j\tdown\6h\tleft\6k\aup\6l\nright\npairs\nsetup\rwinshift\frequire\0", "config", "winshift.nvim")
time([[Config for winshift.nvim]], false)
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
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
require("config.which-key")
time([[Config for which-key.nvim]], false)
-- Config for: numb.nvim
time([[Config for numb.nvim]], true)
require"numb".setup{}
time([[Config for numb.nvim]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
require("config.snip")
time([[Config for LuaSnip]], false)
-- Config for: nvim-trevj.lua
time([[Config for nvim-trevj.lua]], true)
try_loadstring("\27LJ\2\ne\0\0\5\0\6\0\b6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0B\0\4\1K\0\1\0.:lua require(\"trevj\").format_at_cursor()\r\agR\6n\bset\vkeymap\bvim\0", "config", "nvim-trevj.lua")
time([[Config for nvim-trevj.lua]], false)
-- Config for: neoscroll.nvim
time([[Config for neoscroll.nvim]], true)
require"neoscroll".setup{}
time([[Config for neoscroll.nvim]], false)
-- Config for: nvim-lastplace
time([[Config for nvim-lastplace]], true)
require"nvim-lastplace".setup{}
time([[Config for nvim-lastplace]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
require("config.treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: stabilize.nvim
time([[Config for stabilize.nvim]], true)
require"stabilize".setup{}
time([[Config for stabilize.nvim]], false)
-- Config for: refactoring.nvim
time([[Config for refactoring.nvim]], true)
try_loadstring("\27LJ\2\nÀ\4\0\0\6\0\16\0!6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\a\0'\4\b\0005\5\t\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\n\0'\4\v\0005\5\f\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\r\0'\4\14\0005\5\15\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2I<Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>\15<leader>ri\1\0\2\vsilent\2\fnoremap\2J<Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>\15<leader>rv\1\0\2\vsilent\2\fnoremap\2R<Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>\15<leader>rf\1\0\2\vsilent\2\fnoremap\2J<Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>\15<leader>re\6v\20nvim_set_keymap\bapi\bvim\0", "config", "refactoring.nvim")
time([[Config for refactoring.nvim]], false)
-- Config for: iswap.nvim
time([[Config for iswap.nvim]], true)
try_loadstring("\27LJ\2\nn\0\0\5\0\b\0\0156\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0B\0\4\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\6\0'\4\a\0B\0\4\1K\0\1\0\f:ISwap\r\agH\16:ISwapWith\r\agh\6n\bset\vkeymap\bvim\0", "config", "iswap.nvim")
time([[Config for iswap.nvim]], false)
-- Config for: range-highlight.nvim
time([[Config for range-highlight.nvim]], true)
require"range-highlight".setup{}
time([[Config for range-highlight.nvim]], false)
-- Config for: spellsitter.nvim
time([[Config for spellsitter.nvim]], true)
require"spellsitter".setup{}
time([[Config for spellsitter.nvim]], false)
-- Config for: project.nvim
time([[Config for project.nvim]], true)
require"project_nvim".setup{
  manual_mode = true
}
time([[Config for project.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file CycleColorNext lua require("packer.load")({'CycleColor'}, { cmd = "CycleColorNext", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file CycleColorPrev lua require("packer.load")({'CycleColor'}, { cmd = "CycleColorPrev", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file CycleColorRefresh lua require("packer.load")({'CycleColor'}, { cmd = "CycleColorRefresh", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file CodiNew lua require("packer.load")({'codi.vim'}, { cmd = "CodiNew", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file CodiExpand lua require("packer.load")({'codi.vim'}, { cmd = "CodiExpand", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file CodiSelect lua require("packer.load")({'codi.vim'}, { cmd = "CodiSelect", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file T lua require("packer.load")({'neoterm'}, { cmd = "T", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Tnew lua require("packer.load")({'neoterm'}, { cmd = "Tnew", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Topen lua require("packer.load")({'neoterm'}, { cmd = "Topen", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Texec lua require("packer.load")({'neoterm'}, { cmd = "Texec", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Bwipeout lua require("packer.load")({'close-buffers.vim'}, { cmd = "Bwipeout", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Rooter lua require("packer.load")({'vim-rooter'}, { cmd = "Rooter", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DimInactiveOff lua require("packer.load")({'vim-diminactive'}, { cmd = "DimInactiveOff", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DimInactiveToggle lua require("packer.load")({'vim-diminactive'}, { cmd = "DimInactiveToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GitGutterBufferDisable lua require("packer.load")({'vim-gitgutter'}, { cmd = "GitGutterBufferDisable", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GitGutterBufferEnable lua require("packer.load")({'vim-gitgutter'}, { cmd = "GitGutterBufferEnable", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GitGutterBufferToggle lua require("packer.load")({'vim-gitgutter'}, { cmd = "GitGutterBufferToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeToggle lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GitGutterDiffOrig lua require("packer.load")({'vim-gitgutter'}, { cmd = "GitGutterDiffOrig", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GitGutterDisable lua require("packer.load")({'vim-gitgutter'}, { cmd = "GitGutterDisable", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GitGutterEnable lua require("packer.load")({'vim-gitgutter'}, { cmd = "GitGutterEnable", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GitGutterFold lua require("packer.load")({'vim-gitgutter'}, { cmd = "GitGutterFold", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GitGutterLineHighlightsDisable lua require("packer.load")({'vim-gitgutter'}, { cmd = "GitGutterLineHighlightsDisable", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GitGutterLineHighlightsEnable lua require("packer.load")({'vim-gitgutter'}, { cmd = "GitGutterLineHighlightsEnable", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GitGutterLineHighlightsToggle lua require("packer.load")({'vim-gitgutter'}, { cmd = "GitGutterLineHighlightsToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GitGutterLineNrHighlightsDisable lua require("packer.load")({'vim-gitgutter'}, { cmd = "GitGutterLineNrHighlightsDisable", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GitGutterLineNrHighlightsEnable lua require("packer.load")({'vim-gitgutter'}, { cmd = "GitGutterLineNrHighlightsEnable", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SymbolsOutline lua require("packer.load")({'symbols-outline.nvim'}, { cmd = "SymbolsOutline", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GitGutterNextHunk lua require("packer.load")({'vim-gitgutter'}, { cmd = "GitGutterNextHunk", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GitGutterPrevHunk lua require("packer.load")({'vim-gitgutter'}, { cmd = "GitGutterPrevHunk", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GitGutterPreviewHunk lua require("packer.load")({'vim-gitgutter'}, { cmd = "GitGutterPreviewHunk", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GitGutterQuickFix lua require("packer.load")({'vim-gitgutter'}, { cmd = "GitGutterQuickFix", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Far lua require("packer.load")({'far.vim'}, { cmd = "Far", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file VSSplit lua require("packer.load")({'visual-split.vim'}, { cmd = "VSSplit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SwitchExtend lua require("packer.load")({'switch.vim'}, { cmd = "SwitchExtend", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SwitchReverse lua require("packer.load")({'switch.vim'}, { cmd = "SwitchReverse", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TagbarToggle lua require("packer.load")({'tagbar'}, { cmd = "TagbarToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file MundoToggle lua require("packer.load")({'vim-mundo'}, { cmd = "MundoToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
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
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SudoWrite lua require("packer.load")({'vim-eunuch'}, { cmd = "SudoWrite", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Unlink lua require("packer.load")({'vim-eunuch'}, { cmd = "Unlink", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file W lua require("packer.load")({'vim-eunuch'}, { cmd = "W", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Wall lua require("packer.load")({'vim-eunuch'}, { cmd = "Wall", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GitGutter lua require("packer.load")({'vim-gitgutter'}, { cmd = "GitGutter", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Fardo lua require("packer.load")({'far.vim'}, { cmd = "Fardo", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Switch lua require("packer.load")({'switch.vim'}, { cmd = "Switch", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Farf lua require("packer.load")({'far.vim'}, { cmd = "Farf", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Farp lua require("packer.load")({'far.vim'}, { cmd = "Farp", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Farundo lua require("packer.load")({'far.vim'}, { cmd = "Farundo", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TableModeToggle lua require("packer.load")({'vim-table-mode'}, { cmd = "TableModeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file FastFoldUpdate lua require("packer.load")({'FastFold'}, { cmd = "FastFoldUpdate", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TranslateR lua require("packer.load")({'vim-translator'}, { cmd = "TranslateR", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Translate lua require("packer.load")({'vim-translator'}, { cmd = "Translate", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file VSResize lua require("packer.load")({'visual-split.vim'}, { cmd = "VSResize", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GitGutterAll lua require("packer.load")({'vim-gitgutter'}, { cmd = "GitGutterAll", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GitGutterDebug lua require("packer.load")({'vim-gitgutter'}, { cmd = "GitGutterDebug", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file MinimapToggle lua require("packer.load")({'minimap.vim'}, { cmd = "MinimapToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GitGutterQuickFixCurrentFile lua require("packer.load")({'vim-gitgutter'}, { cmd = "GitGutterQuickFixCurrentFile", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GitGutterSignsDisable lua require("packer.load")({'vim-gitgutter'}, { cmd = "GitGutterSignsDisable", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GitGutterSignsEnable lua require("packer.load")({'vim-gitgutter'}, { cmd = "GitGutterSignsEnable", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GitGutterSignsToggle lua require("packer.load")({'vim-gitgutter'}, { cmd = "GitGutterSignsToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GitGutterStageHunk lua require("packer.load")({'vim-gitgutter'}, { cmd = "GitGutterStageHunk", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GitGutterToggle lua require("packer.load")({'vim-gitgutter'}, { cmd = "GitGutterToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GitGutterUndoHunk lua require("packer.load")({'vim-gitgutter'}, { cmd = "GitGutterUndoHunk", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Dirbuf lua require("packer.load")({'dirbuf.nvim'}, { cmd = "Dirbuf", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Dashboard lua require("packer.load")({'dashboard-nvim'}, { cmd = "Dashboard", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GitGutterLineNrHighlightsToggle lua require("packer.load")({'vim-gitgutter'}, { cmd = "GitGutterLineNrHighlightsToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Calender lua require("packer.load")({'calendar-vim'}, { cmd = "Calender", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file AsyncStop lua require("packer.load")({'asyncrun.vim'}, { cmd = "AsyncStop", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file AsyncRun lua require("packer.load")({'asyncrun.vim'}, { cmd = "AsyncRun", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Bclose lua require("packer.load")({'bclose.vim'}, { cmd = "Bclose", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Bdelete lua require("packer.load")({'close-buffers.vim'}, { cmd = "Bdelete", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DimInactive lua require("packer.load")({'vim-diminactive'}, { cmd = "DimInactive", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TSPlaygroundToggle lua require("packer.load")({'playground'}, { cmd = "TSPlaygroundToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file CodiUpdate lua require("packer.load")({'codi.vim'}, { cmd = "CodiUpdate", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file F lua require("packer.load")({'far.vim'}, { cmd = "F", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SymbolsOutlineOpen lua require("packer.load")({'symbols-outline.nvim'}, { cmd = "SymbolsOutlineOpen", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SymbolsOutlineClose lua require("packer.load")({'symbols-outline.nvim'}, { cmd = "SymbolsOutlineClose", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file CalenderH lua require("packer.load")({'calendar-vim'}, { cmd = "CalenderH", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file CalenderT lua require("packer.load")({'calendar-vim'}, { cmd = "CalenderT", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file CalenderVT lua require("packer.load")({'calendar-vim'}, { cmd = "CalenderVT", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Refar lua require("packer.load")({'far.vim'}, { cmd = "Refar", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Codi lua require("packer.load")({'codi.vim'}, { cmd = "Codi", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Farr lua require("packer.load")({'far.vim'}, { cmd = "Farr", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DashboardNewFile lua require("packer.load")({'dashboard-nvim'}, { cmd = "DashboardNewFile", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file VSSplitAbove lua require("packer.load")({'visual-split.vim'}, { cmd = "VSSplitAbove", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file VSSplitBelow lua require("packer.load")({'visual-split.vim'}, { cmd = "VSSplitBelow", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file RooterToggle lua require("packer.load")({'vim-rooter'}, { cmd = "RooterToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[noremap <silent> g[ <cmd>lua require("packer.load")({'jumpy.vim'}, { keys = "g[", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> mc <cmd>lua require("packer.load")({'vim-bookmarks'}, { keys = "mc", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> <C-W>gsb <cmd>lua require("packer.load")({'visual-split.vim'}, { keys = "<lt>C-W>gsb", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> <C-W>gsa <cmd>lua require("packer.load")({'visual-split.vim'}, { keys = "<lt>C-W>gsa", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> <C-W>gss <cmd>lua require("packer.load")({'visual-split.vim'}, { keys = "<lt>C-W>gss", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> <C-W>gr <cmd>lua require("packer.load")({'visual-split.vim'}, { keys = "<lt>C-W>gr", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <C-W>gsb <cmd>lua require("packer.load")({'visual-split.vim'}, { keys = "<lt>C-W>gsb", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> d<C-a> <cmd>lua require("packer.load")({'vim-speeddating'}, { keys = "d<lt>C-a>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <C-W>gsa <cmd>lua require("packer.load")({'visual-split.vim'}, { keys = "<lt>C-W>gsa", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> cs <cmd>lua require("packer.load")({'vim-surround'}, { keys = "cs", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <C-W>gr <cmd>lua require("packer.load")({'visual-split.vim'}, { keys = "<lt>C-W>gr", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> Z <cmd>lua require("packer.load")({'FastFold'}, { keys = "Z", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>bd <cmd>lua require("packer.load")({'bclose.vim'}, { keys = "<lt>leader>bd", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <char-93><char-93> <cmd>lua require("packer.load")({'jumpy.vim'}, { keys = "<lt>char-93><lt>char-93>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> g] <cmd>lua require("packer.load")({'jumpy.vim'}, { keys = "g]", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> mjj <cmd>lua require("packer.load")({'vim-bookmarks'}, { keys = "mjj", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[vnoremap <silent> gl <cmd>lua require("packer.load")({'vim-lion'}, { keys = "gl", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> gJ <cmd>lua require("packer.load")({'splitjoin.vim'}, { keys = "gJ", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> gS <cmd>lua require("packer.load")({'splitjoin.vim'}, { keys = "gS", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> gs <cmd>lua require("packer.load")({'switch.vim'}, { keys = "gs", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> i <cmd>lua require("packer.load")({'targets.vim'}, { keys = "i", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[onoremap <silent> i <cmd>lua require("packer.load")({'targets.vim'}, { keys = "i", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> ma <cmd>lua require("packer.load")({'vim-bookmarks'}, { keys = "ma", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <C-a> <cmd>lua require("packer.load")({'vim-speeddating'}, { keys = "<lt>C-a>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> mm <cmd>lua require("packer.load")({'vim-bookmarks'}, { keys = "mm", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> mi <cmd>lua require("packer.load")({'vim-bookmarks'}, { keys = "mi", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> mn <cmd>lua require("packer.load")({'vim-bookmarks'}, { keys = "mn", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> mp <cmd>lua require("packer.load")({'vim-bookmarks'}, { keys = "mp", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <C-G>S <cmd>lua require("packer.load")({'vim-surround'}, { keys = "<lt>C-G>S", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <C-G>s <cmd>lua require("packer.load")({'vim-surround'}, { keys = "<lt>C-G>s", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <C-S> <cmd>lua require("packer.load")({'vim-surround'}, { keys = "<lt>C-S>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> mx <cmd>lua require("packer.load")({'vim-bookmarks'}, { keys = "mx", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> ySs <cmd>lua require("packer.load")({'vim-surround'}, { keys = "ySs", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> gS <cmd>lua require("packer.load")({'vim-surround'}, { keys = "gS", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> ys <cmd>lua require("packer.load")({'vim-surround'}, { keys = "ys", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> cS <cmd>lua require("packer.load")({'vim-surround'}, { keys = "cS", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <C-x> <cmd>lua require("packer.load")({'vim-speeddating'}, { keys = "<lt>C-x>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> ds <cmd>lua require("packer.load")({'vim-surround'}, { keys = "ds", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <C-W>gss <cmd>lua require("packer.load")({'visual-split.vim'}, { keys = "<lt>C-W>gss", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> gl <cmd>lua require("packer.load")({'vim-lion'}, { keys = "gl", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> yS <cmd>lua require("packer.load")({'vim-surround'}, { keys = "yS", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> yss <cmd>lua require("packer.load")({'vim-surround'}, { keys = "yss", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> ySS <cmd>lua require("packer.load")({'vim-surround'}, { keys = "ySS", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> d<C-x> <cmd>lua require("packer.load")({'vim-speeddating'}, { keys = "d<lt>C-x>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> <C-a> <cmd>lua require("packer.load")({'vim-speeddating'}, { keys = "<lt>C-a>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> <C-x> <cmd>lua require("packer.load")({'vim-speeddating'}, { keys = "<lt>C-x>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> [[ <cmd>lua require("packer.load")({'jumpy.vim'}, { keys = "[[", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> mkk <cmd>lua require("packer.load")({'vim-bookmarks'}, { keys = "mkk", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[vnoremap <silent> gL <cmd>lua require("packer.load")({'vim-lion'}, { keys = "gL", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> mg <cmd>lua require("packer.load")({'vim-bookmarks'}, { keys = "mg", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> M<CR> <cmd>lua require("packer.load")({'vim-highlighter'}, { keys = "M<lt>CR>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> M<BS> <cmd>lua require("packer.load")({'vim-highlighter'}, { keys = "M<lt>BS>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>VSurround <cmd>lua require("packer.load")({'vim-surround'}, { keys = "<lt>Plug>VSurround", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> M<C-l> <cmd>lua require("packer.load")({'vim-highlighter'}, { keys = "M<lt>C-l>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> M<Tab> <cmd>lua require("packer.load")({'vim-highlighter'}, { keys = "M<lt>Tab>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> gL <cmd>lua require("packer.load")({'vim-lion'}, { keys = "gL", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType fish ++once lua require("packer.load")({'cmp-fish'}, { ft = "fish" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'vim-instant-markdown'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType html ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "html" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au User isfolded ++once lua require("packer.load")({'FastFold'}, { event = "User isfolded" }, _G.packer_plugins)]]
vim.cmd [[au User autotag ++once lua require("packer.load")({'nvim-ts-autotag'}, { event = "User autotag" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
