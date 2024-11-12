require "nvchad.mappings"
local harpoon = require "harpoon"

-- add yours here

local map = vim.keymap.set
local api_map = vim.api.nvim_set_keymap
-- force quit nvim
map({ "n", "i", "v" }, ":fexit<cr>", ":qa!<cr>", { noremap = true, silent = true })

map("n", ";", ":", { desc = "cmd enter command mode" })
map("i", "jk", "<ESC>")
map({ "v", "i" }, "Y", "y$")
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- write file 
map("n", "<leader>ww", ":w<CR>", { desc = "Write file" })
map("n", "B", "^", { desc = "Move to beginning of line" })
map("n", "E", "$", { desc = "Move to end of line" })

-- select and move multiple lines up & down
map("n", "<leader>uo", require("undotree").open, { noremap = true, silent = true })
map("n", "<leader>uc", require("undotree").close, { noremap = true, silent = true })

-- binds for harpoon
map("n", "<C-e>", function()
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
-- ma(p({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
