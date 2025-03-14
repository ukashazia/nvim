local lsp_configuration = require "configs.lsp"
local servers = lsp_configuration.servers

local function lsp_setup()
  local lspconfig = require 'lspconfig'

  local nvlsp = require 'configs.nvlsp'

  for _, server in ipairs(servers) do
    lspconfig[server].setup {
      on_attach = nvlsp.on_attach,
      on_init = nvlsp.on_init,
      capabilities = nvlsp.capabilities,
    }
  end

  lspconfig.lua_ls.setup {
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
  }
  lspconfig.tailwindcss.setup {
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
  }

  lspconfig.lexical.setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
    cmd = { 'lexical' },
  }

  lspconfig.harper_ls.setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
    settings = {
      ["harper-ls"] = {
        userDictPath = "",
        fileDictPath = "",
        linters = {
          SpellCheck = true,
          SpelledNumbers = false,
          AnA = true,
          SentenceCapitalization = true,
          UnclosedQuotes = true,
          WrongQuotes = false,
          LongSentences = true,
          RepeatedWords = true,
          Spaces = true,
          Matcher = true,
          CorrectNumberSuffix = true
        },
        codeActions = {
          ForceStable = false
        },
        markdown = {
          IgnoreLinkTitle = false
        },
        diagnosticSeverity = "hint",
        isolateEnglish = false
      }
    }
  }

  lspconfig.sourcekit.setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
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

return {
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    config = function()
      require('mason-lspconfig').setup {
        ensure_installed = servers,
        automatic_installation = true,
        allow_headless = true,
      }
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
    opts = {
      inlay_hints = {
        enabled = true,
      }
    },
    dependencies = {
      "williamboman/mason.nvim",
    }
  },
}
