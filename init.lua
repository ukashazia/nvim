-- must be required before any other plugins
require "options"
require "configs.lazy"

-- put this after lazy setup
for _, v in ipairs(vim.fn.readdir(vim.g.base46_cache)) do
  dofile(vim.g.base46_cache .. v)
end

-- local conf = require("telescope.config").values
-- require("telescope.builtin").live_grep {
--   vimgrep_arguments = table.insert(conf.vimgrep_arguments, "--fixed-strings"),
-- }

require "mappings"
-- vim.schedule(function()
-- end)
