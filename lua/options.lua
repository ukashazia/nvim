local opt = vim.opt
local o = vim.o
local g = vim.g

opt.spell = false
opt.spelllang = { 'en_us' }
vim.g.mapleader = ' '
opt.number = true
opt.relativenumber = true
opt.scrolloff = 8

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv 'HOME' .. '/.vim/undodir'
opt.undofile = true

-- disable some default providers
g.loaded_node_provider = 0
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0

-- add binaries installed by mason.nvim to path
local is_windows = vim.fn.has 'win32' ~= 0
local sep = is_windows and '\\' or '/'
local delim = is_windows and ';' or ':'
vim.env.PATH = table.concat({ vim.fn.stdpath 'data', 'mason', 'bin' }, sep) .. delim .. vim.env.PATH

-- Indenting
o.expandtab = true
o.shiftwidth = 2
o.smartindent = true
o.tabstop = 2
o.softtabstop = 2

o.laststatus = 3
o.showmode = false

-- o.clipboard = "unnamedplus"
o.cursorline = true
o.cursorlineopt = 'line,number'

o.smartcase = true
o.mouse = 'a'
o.ignorecase = true

o.signcolumn = 'yes'
o.splitbelow = true
o.splitright = true
o.timeoutlen = 400

-- interval for writing swap file to disk, also used by gitsigns
o.updatetime = 250

opt.termguicolors = true

o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'
vim.lsp.log.set_level('off')
vim.o.winborder = 'rounded'
vim.diagnostic.config {
  virtual_text = true,
  virtual_lines = false,
  severity_sort = true,
}

if g.neovide then
  g.neovide_cursor_animation_length = 0
  g.neovide_scroll_animation_length = 0
  g.neovide_scale_factor = 1.0
  g.neovide_window_blurred = true
  g.neovide_refresh_rate = 60
  o.guifont = 'JetBrainsMono Nerd Font Mono:h13'
end

-- vim.lsp.inline_completion.enable()
