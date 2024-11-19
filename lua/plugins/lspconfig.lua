local function lsp_setup()
  local lspconfig = require 'lspconfig'
  -- List of LSP servers
  local servers = {
    'lexical',
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
  local nvlsp = require 'configs.nvlsp'

  for _, server in ipairs(servers) do
    lspconfig[server].setup {
      on_attach = nvlsp.on_attach,
      on_init = nvlsp.on_init,
      capabilities = nvlsp.capabilities,
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
  lspconfig.tailwindcss.setup {
    filetypes = {
      'html',
      'elixir',
      'eelixir',
      'heex',
      'javascript',
      'typescript',
      'javascriptreact',
      'typescriptreact',
      'svelte',
      'vue',
      'css',
      'scss',
      'less',
    },
    init_options = {
      userLanguages = {
        elixir = 'html-eex',
        eelixir = 'html-eex',
        heex = 'html-eex',
      },
    },
  }

  lspconfig.lexical.setup {
    cmd = { 'lexical' },
  }

  lspconfig.sourcekit.setup {
    cmd = {
      "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekit-lsp",
    },
    capabilities = {
      workspace = {
        didChangeWatchedFiles = {
          dynamicRegistration = true,
        },
      },
    },
  }
end

-- Plugin setup for nvim-lspconfig
return {
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    -- dir = "~/.config/nvim/plugins/mason-lspconfig.nvim",
    config = function()
      require('mason-lspconfig').setup {
        ensure_installed = servers,
        automatic_installation = true,
        allow_headless = true,
      }
      -- preinstall_lsps()
    end,
    dependencies = {
      "williamboman/mason.nvim",
      'neovim/nvim-lspconfig',
    },
  },

  {
    'neovim/nvim-lspconfig',
    lazy = false,
    config = function()
      lsp_setup()
    end,
    dependencies = {
      "williamboman/mason.nvim",
    }
  },
}
