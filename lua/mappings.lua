local harpoon = require "harpoon"

local map = vim.keymap.set
local api_map = vim.api.nvim_set_keymap

-- force quit nvim
map({ "n", "v" }, ":Fexit<cr>", ":qa!<cr>", { noremap = true, silent = true })

map("n", ";", ":", { desc = "cmd enter command mode" })
map("i", "jk", "<ESC>")
map({ "v", "i" }, "Y", "y$")
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- write file
map({ "n", "v" }, "<leader>ww", ":w<CR>", { desc = "Write file" })
map({ "n", "v" }, "B", "^", { desc = "Move to beginning of line" })
map({ "n", "v" }, "E", "$", { desc = "Move to end of line" })
map({ "n", "v" }, "<leader>th", "<leader>h", { desc = "Horizontal terminal" })
map({ "n", "v" }, "<leader>tv", "<leader>v", { desc = "Vertical terminal" })
map({ "n", "v" }, "<leader>tt", ":Telescope<CR>", { desc = "Open Telescope" })

-- select and move multiple lines up & down
map("n", "<leader>uo", require("undotree").open, { noremap = true, silent = true })
map("n", "<leader>uc", require("undotree").close, { noremap = true, silent = true })

-- binds for harpoon
map("n", "<leader>h", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Toggle harpoon menu" })

map("n", "<leader>a", function()
  harpoon:list():add()
end, { desc = "Add current buffer to harpoon" })

-- Github Copilot
map("n", "<leader>cpd", ":Copilot disable<cr>", { silent = true, noremap = true, desc = "Disable Copilot" })
map("n", "<leader>cpe", ":Copilot enable<cr>", { silent = true, noremap = true, desc = "Enable Copilot" })
api_map("i", "<Tab>", 'copilot#Accept("<Tab>")', { silent = true, expr = true })

-- Mason
map("n", "<leader>mn", ":Mason<cr>", { silent = true, noremap = true, desc = "Mason" })

-- ThePrimeagen
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("x", "<leader>P", [["_dP]])

-- Spectre
map("n", "<leader>s", '<cmd>lua require("spectre").toggle()<cr>', {
  desc = "toggle spectre",
})
map("n", "<leader>sw", '<cmd>lua require("spectre").open_visual({select_word=true})<cr>', {
  desc = "search current word",
})
map("v", "<leader>sw", '<esc><cmd>lua require("spectre").open_visual()<cr>', {
  desc = "search current word",
})
map("n", "<leader>sp", '<cmd>lua require("spectre").open_file_search({select_word=true})<cr>', {
  desc = "search on current file",
})

-- Fun
map("n", "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>")

-- Telescope -- 
-- telescope

map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
map("n", "<leader>ma", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
map("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
map("n", "<leader>pt", "<cmd>Telescope terms<CR>", { desc = "telescope pick hidden term" })

map("n", "<leader>th", function()
  require("nvchad.themes").open()
end, { desc = "telescope nvchad themes" })

map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
map(
  "n",
  "<leader>fa",
  "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
  { desc = "telescope find all files" }
)

-- Search with Telescope
function vim.getVisualSelection()
  vim.cmd 'noau normal! "vy"'
  local text = vim.fn.getreg "v"
  vim.fn.setreg("v", {})

  text = string.gsub(text, "\n", "")
  if #text > 0 then
    return text
  else
    return ""
  end
end

local keymap = vim.keymap.set
local tb = require "telescope.builtin"
local opts = { noremap = true, silent = true }

keymap("n", "<space>g", ":Telescope current_buffer_fuzzy_find<cr>", opts)
keymap("v", "<space>g", function()
  local text = vim.getVisualSelection()
  tb.current_buffer_fuzzy_find { default_text = text }
end, opts)

keymap("n", "<space>G", ":Telescope live_grep<cr>", opts)
keymap("v", "<space>G", function()
  local text = vim.getVisualSelection()
  tb.live_grep { default_text = text }
end, opts)
