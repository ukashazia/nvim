local lsp_configuration = require 'configs.lsp'
local servers = lsp_configuration.servers

local function lsp_setup()
  local lspconfig = vim.lsp.config

  local nvlsp = require 'configs.nvlsp'
  vim.lsp.enable(servers)

  for _, server in ipairs(servers) do
    lspconfig(server, {
      on_attach = nvlsp.on_attach,
      on_init = nvlsp.on_init,
      capabilities = nvlsp.capabilities,
    })
  end

  lspconfig('lua_ls', {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
    settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim', 'jit' },
        },
      },
    },
  })
  lspconfig('tailwindcss', {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
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
  })

  -- lspconfig('lexical', {
  --   on_attach = nvlsp.on_attach,
  --   on_init = nvlsp.on_init,
  --   capabilities = nvlsp.capabilities,
  --   cmd = { 'lexical' },
  -- })

  lspconfig('elixirls', {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
    cmd = { 'elixir-ls' },
  })

  lspconfig('harper_ls', {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
    settings = {
      ['harper-ls'] = {
        userDictPath = '',
        fileDictPath = '',
        linters = {
          SpellCheck = true,
          SpelledNumbers = false,
          AnA = true,
          SentenceCapitalization = false,
          UnclosedQuotes = true,
          WrongQuotes = false,
          LongSentences = false,
          RepeatedWords = false,
          Spaces = false,
          Matcher = true,
          CorrectNumberSuffix = true,
        },
        codeActions = {
          ForceStable = false,
        },
        markdown = {
          IgnoreLinkTitle = false,
        },
        diagnosticSeverity = 'hint',
        isolateEnglish = false,
      },
    },
  })

  lspconfig('sourcekit', {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    cmd = {
      '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekit-lsp',
    },
    capabilities = {
      workspace = {
        didChangeWatchedFiles = {
          dynamicRegistration = true,
        },
      },
    },
  })

  lspconfig('gopls', {
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
        gofumpt = true,
        codelenses = {
          generate = true,
          gc_details = true,
        },
      },
    },
  })
end

return {
  {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      require('mason-lspconfig').setup {
        ensure_installed = servers,
        automatic_installation = true,
        allow_headless = true,
        automatic_enable = false,
      }
    end,
    dependencies = {
      'williamboman/mason.nvim',
      'neovim/nvim-lspconfig',
    },
  },

  {
    'neovim/nvim-lspconfig',
    config = function()
      lsp_setup()
    end,
    opts = {
      inlay_hints = {
        enabled = true,
      },
    },
    dependencies = {
      'williamboman/mason.nvim',
    },
  },
}
