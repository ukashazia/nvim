require("lua.configs.lazy")
require "options"

local conf = require("telescope.config").values
require("telescope.builtin").live_grep {
  vimgrep_arguments = table.insert(conf.vimgrep_arguments, "--fixed-strings"),
}

vim.schedule(function()
  require "mappings"
end)

