-- must be required before any other plugins
require "options"
require "configs.lazy"

-- put this after lazy setup
for _, v in ipairs(vim.fn.readdir(vim.g.base46_cache)) do
  dofile(vim.g.base46_cache .. v)
end

require "mappings"
