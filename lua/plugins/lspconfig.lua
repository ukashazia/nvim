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

local function preinstall_lsps()
  local is_headless = require "utils.core".is_headless()
  if is_headless then
    local mlsp = require("mason-lspconfig")
    local mason_registry = require("mason-registry")
    local lsp_servers_to_install = {}

    -- Collect the servers that need to be installed
    for _, server in ipairs(servers) do
      server = mlsp.get_mappings().lspconfig_to_mason[server]
      local pkg = mason_registry.get_package(server)
      if not pkg:is_installed() then
        table.insert(lsp_servers_to_install, pkg)
      end
    end

    -- Install the servers and wait for them to finish
    if #lsp_servers_to_install > 0 then
      vim.notify("Installing LSP servers...")
      local completed_count = 0

      for _, pkg in ipairs(lsp_servers_to_install) do
        vim.notify("Installing ")
        -- vim.notify(pkg)
        pkg:install():on("close", function()
          completed_count = completed_count + 1
          if completed_count == #lsp_servers_to_install then
            vim.notify("LSP servers installation complete!")
            vim.cmd("qa") -- Quit Neovim once all installations are done
          end
        end)
      end
    else
      vim.notify("All LSP servers are already installed!")
      vim.cmd("qa") -- Quit immediately if nothing to install
    end
  end
end

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
