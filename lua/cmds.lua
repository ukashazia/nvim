local lsp_configuration = require "configs.lsp"
local cmd = vim.api.nvim_create_user_command

-- cmd for auto install
cmd('InstallLsps', function(_)
  lsp_configuration.InstallLsps()
end, {
  nargs = '*'
})
