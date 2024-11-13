-- -- load defaults i.e lua_lsp
-- require("nvchad.configs.lspconfig").defaults()
--
-- local lspconfig = require "lspconfig"
--
-- -- EXAMPLE
-- local servers = {
--   "html",
--   "cssls",
--   "lexical",
--   "docker_compose_language_service",
--   "dockerls",
--   "pyright",
--   "lua_ls",
--   "ts_ls",
--   "jsonls",
--   "java_language_server",
--   "tailwindcss",
--   "biome",
--   "clangd",
--   "yamlls",
--   "helm_ls",
--   "bashls",
--   "eslint",
--   "rust_analyzer",
-- }
--
-- -- local nvlsp = require "nvchad.configs.lspconfig"
--
-- local function lsp_setup()
--   -- lsps with default config
--   for _, lsp in ipairs(servers) do
--     lspconfig[lsp].setup {
--       on_attach = nvlsp.on_attach,
--       on_init = nvlsp.on_init,
--       capabilities = nvlsp.capabilities,
--     }
--   end
--
--   lspconfig.lua_ls.setup {
--     settings = {
--       Lua = {
--         diagnostics = {
--           globals = { "vim" },
--         },
--       },
--     },
--   }
-- end
-- -- configuring single server, example: typescript
-- -- lspconfig.ts_ls.setup {
-- --   on_attach = nvlsp.on_attach,
-- --   on_init = nvlsp.on_init,
-- --   capabilities = nvlsp.capabilities,
-- -- }
-- return {
--
--   "neovim/nvim-lspconfig",
--   lazy = false,
--   config = lsp_setup,
-- }
-- lua/plugins/lspconfig.lua
-- local nvlsp = require "nvchad.configs.lspconfig" -- NvChad LSP config defaults

-- List of LSP servers
local servers = {
  "html",
  "cssls",
  "docker_compose_language_service",
  "dockerls",
  "pyright",
  "lua_ls",
  "tsserver",             -- Use "tsserver" for TypeScript
  "jsonls",
  "jdtls",                -- Java language server
  "tailwindcss",
  "clangd",
  "yamlls",
  "helm_ls",
  "bashls",
  "eslint",
  "rust_analyzer",
}

-- Function to set up LSP servers
local function lsp_setup()
	
local lspconfig = require "lspconfig"
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
          globals = { "vim" },
        },
      },
    },
  }
end

-- Plugin setup for nvim-lspconfig
return {
  "williamboman/mason-lspconfig.nvim",
  lazy = false, -- Load immediately
  config = function()
	  lsp_setup()
  end, -- Pass the function reference without parentheses
}	
