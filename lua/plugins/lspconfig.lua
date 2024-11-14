local function lsp_setup()
  local lspconfig = require 'lspconfig'
  -- List of LSP servers
  local servers = {
    'html',
    'cssls',
    'docker_compose_language_service',
    'dockerls',
    'pyright',
    'lua_ls',
    'ts_ls', -- Use "tsserver" for TypeScript
    'jsonls',
    'jdtls', -- Java language server
    'tailwindcss',
    'clangd',
    'yamlls',
    'helm_ls',
    'bashls',
    'eslint',
    'rust_analyzer',
  }

  -- Function to set up LSP servers

  -- Iterate and set up each LSP server
  for _, server in ipairs(servers) do
    lspconfig[server].setup {
      -- on_attach = nvlsp.on_attach,
      -- on_init = nvlsp.on_init,
      -- capabilities = nvlsp.capabilities,
    }
  end

  -- Additional settings for specific servers (e.g., Lua)
  lspconfig.lua_ls.setup {
    settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim' },
        },
      },
    },
  }
end

-- Plugin setup for nvim-lspconfig
return {
  'neovim/nvim-lspconfig',
  lazy = false, -- Load immediately
  config = function() 
    lsp_setup()
  end, -- Pass the function reference without parenthesese
}
