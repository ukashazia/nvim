local harpoon = require 'harpoon'

local map = vim.keymap.set
local api_map = vim.api.nvim_set_keymap

-- force quit nvim
map({ 'n', 'v' }, ':Fexit<cr>', ':qa!<cr>', { noremap = true, silent = true })

map({ 'n', 'v' }, ';', ':', { desc = 'cmd enter command mode' })
map('i', 'jk', '<ESC>')
map({ 'v', 'i' }, 'Y', 'y$')
map('v', 'J', ":m '>+1<CR>gv=gv")
map('v', 'K', ":m '<-2<CR>gv=gv")

-- clear highlights
map('n', '<Esc>', '<cmd>noh<CR>', { desc = 'general clear highlights' })

-- move between windows
map('n', '<C-h>', '<C-w>h', { desc = 'switch window left' })
map('n', '<C-l>', '<C-w>l', { desc = 'switch window right' })
map('n', '<C-j>', '<C-w>j', { desc = 'switch window down' })
map('n', '<C-k>', '<C-w>k', { desc = 'switch window up' })

-- write file
map({ 'n', 'v' }, '<leader>ww', ':w<CR>', { desc = 'Write file' })
map({ 'n', 'v' }, 'B', '^', { desc = 'Move to beginning of line' })
map({ 'n', 'v' }, 'E', '$', { desc = 'Move to end of line' })
map({ 'n', 'v' }, '<leader>th', '<leader>h', { desc = 'Horizontal terminal' })
map({ 'n', 'v' }, '<leader>tv', '<leader>v', { desc = 'Vertical terminal' })
map({ 'n', 'v' }, '<leader>tt', ':Telescope<CR>', { desc = 'Open Telescope' })
map({ 'n', 'v' }, '<leader>dd', 'vim.lsp.buf.hover()', { desc = 'Open documemtation' })
map({ 'n' }, '<leader>bc', ':let @+ = expand("%")<cr>', { desc = 'Copy buffer path (relative)' })
map({ 'n' }, '<leader>bca', ':let @+ = expand("%:p")<cr>', { desc = 'Copy buffer path (absolute)' })
map({ "v", "n" }, "ps", '"+p', { desc = 'Paste from system clipboard' })
map({ "v" }, "ys", '"+y', { desc = 'Copy to system clipboard' })
map({ "v", "n" }, "<leader>yb", ':%y<CR>', { desc = 'Copy whole buffer' })
map({ "v", "n" }, "<leader>ybs", ':%y+<CR>', { desc = "Copy whole buffer into system's clipboard" })
map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true, desc = "Go to declaration" })
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true, desc = "Go to definition" })
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { noremap = true, silent = true, desc = "Go to usage" })

-- select and move multiple lines up & down
map('n', '<leader>uo', require('undotree').open, { noremap = true, silent = true })
map('n', '<leader>uc', require('undotree').close, { noremap = true, silent = true })

-- binds for harpoon
map('n', '<leader>h', function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = 'Toggle harpoon menu' })

map('n', '<leader>a', function()
  harpoon:list():add()
end, { desc = 'Add current buffer to harpoon' })

-- Github Copilot
map('n', '<leader>cpd', ':Copilot disable<cr>', { silent = true, noremap = true, desc = 'Disable Copilot' })
map('n', '<leader>cpe', ':Copilot enable<cr>', { silent = true, noremap = true, desc = 'Enable Copilot' })
api_map('i', '<Tab>', 'copilot#Accept("<Tab>")', { silent = true, expr = true })

-- Mason
map('n', '<leader>mn', ':Mason<cr>', { silent = true, noremap = true, desc = 'Mason' })

-- ThePrimeagen
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')
map('x', '<leader>P', [["_dP]])

-- Spectre
map('n', '<leader>s', '<cmd>lua require("spectre").toggle()<cr>', {
  desc = 'toggle spectre',
})
map('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<cr>', {
  desc = 'search current word',
})
map('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<cr>', {
  desc = 'search current word',
})
map('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<cr>', {
  desc = 'search on current file',
})

-- Fun
map('n', '<leader>fml', '<cmd>CellularAutomaton make_it_rain<CR>')

-- Telescope --

map('n', '<leader>fw', '<cmd>Telescope live_grep<CR>', { desc = 'telescope live grep' })
map('n', '<leader>fb', '<cmd>Telescope buffers<CR>', { desc = 'telescope find buffers' })
map('n', '<leader>fh', '<cmd>Telescope help_tags<CR>', { desc = 'telescope help page' })
map('n', '<leader>ma', '<cmd>Telescope marks<CR>', { desc = 'telescope find marks' })
map('n', '<leader>fo', '<cmd>Telescope oldfiles<CR>', { desc = 'telescope find oldfiles' })
map('n', '<leader>fz', '<cmd>Telescope current_buffer_fuzzy_find<CR>', { desc = 'telescope find in current buffer' })
map('n', '<leader>cm', '<cmd>Telescope git_commits<CR>', { desc = 'telescope git commits' })
map('n', '<leader>gt', '<cmd>Telescope git_status<CR>', { desc = 'telescope git status' })
map('n', '<leader>pt', '<cmd>Telescope terms<CR>', { desc = 'telescope pick hidden term' })

map('n', '<leader>th', function()
  require('nvchad.themes').open()
end, { desc = 'telescope nvchad themes' })

-- map('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { desc = 'telescope find files' })
map('n', '<leader>ff', '<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>',
  { desc = 'telescope find all files' })
map("n", "<leader>tb", ":Telescope file_browser<CR>")
map("n", "<leader>tc", ":Telescope neoclip<CR>", { desc = "Telescope Clipboard" })
map({ "n", "v" }, "<leader>tm", ":Telescope macroscope<CR>", { desc = "Telescope Macros" })

-- Search with Telescope
function vim.getVisualSelection()
  vim.cmd 'noau normal! "vy"'
  local text = vim.fn.getreg 'v'
  vim.fn.setreg('v', {})

  text = string.gsub(text, '\n', '')
  if #text > 0 then
    return text
  else
    return ''
  end
end

local keymap = vim.keymap.set
local tb = require 'telescope.builtin'
local opts = { noremap = true, silent = true }

keymap('n', '<leader>g', ':Telescope current_buffer_fuzzy_find<cr>', opts)
keymap('v', '<leader>g', function()
  local text = vim.getVisualSelection()
  tb.current_buffer_fuzzy_find { default_text = text }
end, opts)

keymap('n', '<leader>G', ':Telescope live_grep<cr>', opts)
keymap('v', '<leader>G', function()
  local text = vim.getVisualSelection()
  tb.live_grep { default_text = text }
end, opts)
-- Search with Telescope end

-- Comment
map('n', '<leader>/', 'gcc', { desc = 'toggle comment', remap = true })
map('v', '<leader>/', 'gc', { desc = 'toggle comment', remap = true })

-- nvimtree
map('n', '<C-n>', '<cmd>NvimTreeToggle<CR>', { desc = 'nvimtree toggle window' })
map('n', '<leader>e', '<cmd>NvimTreeFocus<CR>', { desc = 'nvimtree focus window' })

map('n', '<leader>fm', function()
  require('conform').format { lsp_fallback = true }
end, { desc = 'general format file' })

-- Tabline
-- map("n", "<leader>b", "<cmd>enew<CR>", { desc = "buffer new" })

map('n', '<tab>', function()
  require('bufferline').cycle(1)
end, { desc = 'buffer goto next' })

map('n', '<S-tab>', function()
  require('bufferline').cycle(-1)
end, { desc = 'buffer goto prev' })

map('n', '<leader>X', ':bd<cr>', { desc = 'buffer close' })

-- Trouble

map({ 'v', 'n' }, '<leader>xx', '<cmd>Trouble diagnostics toggle<cr>', {
  desc = 'Diagnostics (Trouble)',
})
map({ 'v', 'n' }, '<leader>xX', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', {
  desc = 'Buffer Diagnostics (Trouble)',
})
map({ 'v', 'n' }, '<leader>cs', '<cmd>Trouble symbols toggle focus=false<cr>', {
  desc = 'Symbols (Trouble)',
})
map({ 'v', 'n' }, '<leader>cl', '<cmd>Trouble lsp toggle focus=false win.position=right<cr>', {
  desc = 'LSP Definitions / references / ... (Trouble)',
})
map({ 'v', 'n' }, '<leader>xL', '<cmd>Trouble loclist toggle<cr>', {
  desc = 'Location List (Trouble)',
})
map({ 'v', 'n' }, '<leader>xQ', '<cmd>Trouble qflist toggle<cr>', {
  desc = 'Quickfix List (Trouble)',
})
