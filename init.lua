_G.nvim = vim

vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
vim.opt.scrolloff = 8

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },
  {
    "andymass/vim-matchup",
  },
  { import = "plugins" },
}, lazy_config)

require("nvim-tree").setup {
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    side = "right",
    width = 55,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
}

-- neoscroll config
require("neoscroll").setup {
  mappings = { -- Keys to be mapped to their corresponding default scrolling animation
    "<C-u>",
    "<C-d>",
    "<C-b>",
    "<C-f>",
    "<C-y>",
    "<C-e>",
    "zt",
    "zz",
    "zb",
  },
  hide_cursor = true, -- Hide cursor while scrolling
  stop_eof = true, -- Stop at <EOF> when scrolling downwards
  respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
  cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
  easing = "circular", -- Default easing function
  pre_hook = nil, -- Function to run before the scrolling animation starts
  post_hook = nil, -- Function to run after the scrolling animation ends
  performance_mode = false, -- Disable "Performance Mode" on all buffers.
  ignored_events = { -- Events ignored while scrolling
    "WinScrolled",
    "CursorMoved",
  },
}

require("conform").setup {}
require("auto-save").setup {
  enabled = true,
  events = { "InsertLeave", "TextChanged" },
  conditions = {
    exists = true,
    filetype_is_not = {},
    modifiable = true,
  },
}

local undotree = require "undotree"

undotree.setup {
  float_diff = true, -- using float window previews diff, set this `true` will disable layout option
  layout = "left_bottom", -- "left_bottom", "left_left_bottom"
  position = "right", -- "right", "bottom"
  ignore_filetype = { "undotree", "undotreeDiff", "qf", "TelescopePrompt", "spectre_panel", "tsplayground" },
  window = {
    winblend = 10,
  },
  keymaps = {
    ["j"] = "move_next",
    ["k"] = "move_prev",
    ["gj"] = "move2parent",
    ["J"] = "move_change_next",
    ["K"] = "move_change_prev",
    ["<cr>"] = "action_enter",
    ["p"] = "enter_diffbuf",
    ["q"] = "quit",
  },
}

local conf = require("telescope.config").values
require("telescope.builtin").live_grep {
  vimgrep_arguments = table.insert(conf.vimgrep_arguments, "--fixed-strings"),
}

require("harpoon").setup {}
-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)
