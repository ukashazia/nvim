local M = {}

M.servers = {
  'ansiblels',
  'arduino_language_server',
  'jinja_lsp',
  'lexical',
  'cssls',
  'docker_compose_language_service',
  'dockerls',
  'pyright',
  'lua_ls',
  'ts_ls',
  'jsonls',
  'jdtls',
  'tailwindcss',
  'clangd',
  'yamlls',
  'helm_ls',
  'bashls',
  'eslint',
  'rust_analyzer',
  'gopls',
  'cmake',
  'ember',
  'gradle_ls',
  'html',
  'biome',
  'taplo',
  'zls'
}

M.InstallLsps = function()
  local is_headless = require "utils.core".is_headless()
  if is_headless then
    require "utils.cmd" {
      cmd = "LspInstall " .. table.concat(M.servers, " "),
      callback = function()
        -- vim.cmd("qa")
      end
    }
  end
end

return M
