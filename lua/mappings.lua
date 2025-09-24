local harpoon = require 'harpoon'
harpoon:setup()

local Snacks = require 'snacks'

local map = vim.keymap.set
local api_map = vim.api.nvim_set_keymap

map('v', 'J', ":m '>+1<CR>gv=gv")
map('v', 'K', ":m '<-2<CR>gv=gv")

-- clear highlights
map('n', '<Esc>', '<cmd>noh<CR>', { desc = 'general clear highlights' })

map({ 'n' }, '<leader>bc', ':let @+ = expand("%")<cr>', { desc = 'Copy buffer path (relative)' })
map({ 'n' }, '<leader>bca', ':let @+ = expand("%:p")<cr>', { desc = 'Copy buffer path (absolute)' })

map({ "v", "n" }, "<S-P>", '"+p', { desc = 'Paste from system clipboard' })
map({ "v" }, "<S-Y>", '"+y', { desc = 'Copy to system clipboard' })
map({ "n" }, "<S-Y>", '"+yy', { desc = 'Copy to system clipboard' })

map({ "v", "n" }, "<leader>yb", ':%y<CR>', { desc = 'Copy whole buffer' })
map({ "v", "n" }, "<leader>ybs", ':%y+<CR>', { desc = "Copy whole buffer into system's clipboard" })

map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true, desc = "Go to declaration" })
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true, desc = "Go to definition" })
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { noremap = true, silent = true, desc = "Go to usage" })

map("n", "<C-S-H>", "<cmd>tabprevious<CR>", { noremap = true, silent = true, desc = "Go to previous tab" })
map("n", "<C-S-L>", "<cmd>tabnext<CR>", { noremap = true, silent = true, desc = "Go to next tab" })


-- binds for harpoon

map("n", "<leader>a", function() harpoon:list():add() end)

map("n", "<C-h>", function() harpoon:list():select(1) end)
map("n", "<C-t>", function() harpoon:list():select(2) end)
map("n", "<C-n>", function() harpoon:list():select(3) end)
map("n", "<C-s>", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
map("n", "<C-S-P>", function() harpoon:list():prev() end)
map("n", "<C-S-N>", function() harpoon:list():next() end)

map('n', '<leader>h', function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = 'Toggle harpoon menu' })

map('n', '<leader>a', function()
  harpoon:list():add()
end, { desc = 'Add current buffer to harpoon' })

-- GitHub Copilot
map('n', '<leader>cpd', ':Copilot disable<cr>', { silent = true, noremap = true, desc = 'Disable Copilot' })
map('n', '<leader>cpe', ':Copilot enable<cr>', { silent = true, noremap = true, desc = 'Enable Copilot' })
api_map('i', '<Tab>', 'copilot#Accept("<Tab>")', { silent = true, expr = true })

-- ThePrimeagen
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')

map('n', '<C-f>', '<C-f>zz')
map('n', '<C-b>', '<C-b>zz')

map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

map('n', 'G', 'Gzz')

-- Paste without add stuff to register
map("v", "<leader>p", [["_dP]])

map('n', '<leader>u', ':UndotreeToggle <cr>', { silent = true, noremap = true, desc = 'Toggle undotree' })

-- Telescope --
map({ 'n' }, '<leader>tt', function() Snacks.picker() end, { silent = true, desc = 'Open snacks picker' })
map({ "n", "v" }, "<leader>tc", ":Telescope neoclip<CR>", { desc = "Telescope Clipboard" })
map({ "n", "v" }, "<leader>tm", ":Telescope macroscope<CR>", { desc = "Telescope Macros" })
-- -- Search with Telescope

map('n', '<leader>as', function()
  require('conform').format { lsp_fallback = true, async = false, }
end, { desc = 'general format file' })

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

-- builtin Terminal
map('t', '<C-\\>', [[<C-\><C-n>]], { noremap = true, silent = true })

-- Oil nvim
map('n', '-', '<cmd>Oil --float<CR>', { desc = 'Open Oil' })
